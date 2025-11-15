package edu.csula.cs3220stu03.studybuddy;

import edu.csula.cs3220stu03.studybuddy.models.Flashcard;
import edu.csula.cs3220stu03.studybuddy.models.Quiz;
import edu.csula.cs3220stu03.studybuddy.models.StudySet;
import edu.csula.cs3220stu03.studybuddy.storage.StudySetStore;
import edu.csula.cs3220stu03.studybuddy.storage.Studystorage;
import edu.csula.cs3220stu03.studybuddy.storage.UserSession;

import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.chat.messages.SystemMessage;
import org.springframework.ai.chat.messages.UserMessage;
import org.springframework.ai.chat.prompt.Prompt;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class AIController {

    private final UserSession userSession;
    private final Studystorage studystorage;
    private final StudySetStore studySetStore;
    private final ChatClient chatClient;

    private static final ObjectMapper MAPPER = new ObjectMapper()
            .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

    public AIController(ChatClient.Builder chatClientBuilder, Studystorage studystorage,
                        StudySetStore studySetStore, UserSession userSession) {
        this.chatClient = chatClientBuilder.build();
        this.studystorage = studystorage;
        this.studySetStore = studySetStore;
        this.userSession = userSession;
    }

    @GetMapping("/")
    public String chat(Model model) {
        if (!userSession.isLoggedIn()) return "redirect:/login";
        return "upload";
    }

    @PostMapping(value = "/", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String chat(@RequestParam(required = false) String message,
                       @RequestParam(required = false, name = "file") MultipartFile file,
                       Model model) throws IOException {

        if (!userSession.isLoggedIn()) return "redirect:/login";

        int userId = userSession.getUserId();

        if (file == null || file.isEmpty()) {
            return "redirect:/";
        }

        String fileText = extractText(file);
        String prompt = buildPrompt(message, fileText);

        String aiReply = realFlashcardChat(prompt);
        try {
            String json = extractJsonArray(aiReply);
            List<Flashcard> cards = MAPPER.readValue(json, new TypeReference<List<Flashcard>>() {});
            studystorage.setFlashcards(userId, cards);
        } catch (Exception e) {
            e.printStackTrace();
        }

        aiReply = realQuizChat(prompt);
        try {
            String json = extractJsonArray(aiReply);
            List<Quiz> quizzes = MAPPER.readValue(json, new TypeReference<List<Quiz>>() {});
            studystorage.setQuizzes(userId, quizzes);
        } catch (Exception e) {
            e.printStackTrace();
        }

        StudySet set = studySetStore.add(userId, file.getOriginalFilename(),
                studystorage.getFlashcards(userId),
                studystorage.getQuizzes(userId));

        model.addAttribute("studySets", studySetStore.getAll(userId));
        return "allnotes";
    }

    @GetMapping("/allnotes")
    public String showStudySets(Model model) {
        if (!userSession.isLoggedIn()) return "redirect:/login";
        int userId = userSession.getUserId();
        model.addAttribute("studySets", studySetStore.getAll(userId));
        return "allnotes";
    }

    @GetMapping("/testquizzes")
    @ResponseBody
    public List<Quiz> showQuizzes() {
        if (!userSession.isLoggedIn()) return List.of();
        return studystorage.getQuizzes(userSession.getUserId());
    }

    @GetMapping("/testflashcards")
    @ResponseBody
    public List<Flashcard> showFlashcards() {
        if (!userSession.isLoggedIn()) return List.of();
        return studystorage.getFlashcards(userSession.getUserId());
    }

    private String buildPrompt(String message, String fileText) {
        StringBuilder sb = new StringBuilder();
        if (message != null && !message.isBlank()) sb.append(message.trim());
        else sb.append("Please analyze the uploaded document.");
        if (fileText != null && !fileText.isBlank()) {
            String clamped = fileText.length() > 20000 ? fileText.substring(0, 20000) : fileText;
            sb.append("\n\n---\nHere is the document content:\n").append(clamped);
        }
        return sb.toString();
    }

    private String extractText(MultipartFile file) throws IOException {
        if (file == null || file.isEmpty()) return null;
        String filename = file.getOriginalFilename() != null ? file.getOriginalFilename().toLowerCase() : "";
        boolean isPdf = filename.endsWith(".pdf") || MediaType.APPLICATION_PDF_VALUE.equalsIgnoreCase(file.getContentType());
        if (isPdf) {
            try (PDDocument doc = PDDocument.load(file.getInputStream())) {
                return new PDFTextStripper().getText(doc);
            }
        } else {
            return new String(file.getBytes(), StandardCharsets.UTF_8);
        }
    }

    private String realQuizChat(String combinedUserPrompt) {
        var prompt = new Prompt(List.of(
                new SystemMessage("""
                        You are an educational AI that creates multiple-choice quiz questions in JSON.
                        Follow this format exactly:

[
        {
            "quizID": 1,
            "question": "...",
            "answer": "...",
            "responses": ["...", "...", "...", "..."]
        }
]

Rules:
- Always produce a valid JSON array.
- Each question must have 1 correct answer and 3 distractors.
- Include the correct answer inside the responses list.
- Do not include explanations or markdown.
- quizID should start at 1 and increment by 1.
"""),
                new UserMessage(combinedUserPrompt)
        ));
        return chatClient.prompt(prompt).call().content();
    }

    private String realFlashcardChat(String combinedUserPrompt) {
        var prompt = new Prompt(List.of(
                new SystemMessage("""
                        You are an educational AI that creates study flashcards in JSON.
                        Follow this format exactly:

[
  {
    "flashcardID": 1,
    "question": "...",
    "answer": "..."
  }
]

Rules:
- Always produce a valid JSON array.
- Each flashcard should contain a clear, concise question and a short factual answer.
- Answers should be one or two sentences at most.
- Do not include explanations, commentary, or markdown formatting.
- flashcardID should start at 1 and increment by 1.
"""),
                new UserMessage(combinedUserPrompt)
        ));
        return chatClient.prompt(prompt).call().content();
    }

    private String extractJsonArray(String text) {
        if (text == null) return "[]";
        int start = text.indexOf('[');
        int end = text.lastIndexOf(']');
        if (start >= 0 && end >= start) return text.substring(start, end + 1).trim();
        return text.trim();
    }
}