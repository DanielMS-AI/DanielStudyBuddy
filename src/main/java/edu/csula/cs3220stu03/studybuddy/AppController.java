package edu.csula.cs3220stu03.studybuddy;

import edu.csula.cs3220stu03.studybuddy.models.Flashcard;
import edu.csula.cs3220stu03.studybuddy.models.Quiz;
import edu.csula.cs3220stu03.studybuddy.models.StudySet;
import edu.csula.cs3220stu03.studybuddy.models.User;
import edu.csula.cs3220stu03.studybuddy.repositories.StudySetRepository;
import edu.csula.cs3220stu03.studybuddy.repositories.UserRepository;
import edu.csula.cs3220stu03.studybuddy.storage.UserSession;
import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.chat.messages.SystemMessage;
import org.springframework.ai.chat.messages.UserMessage;
import org.springframework.ai.chat.prompt.Prompt;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
public class AppController {

    private final UserSession userSession;
    private final StudySetRepository studySetRepository;
    private final UserRepository userRepository;
    private final ChatClient chatClient;

    private static final ObjectMapper MAPPER = new ObjectMapper()
            .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

    public AppController(ChatClient.Builder chatClientBuilder,
                              StudySetRepository studySetRepository,
                              UserRepository userRepository,
                              UserSession userSession) {
        this.chatClient = chatClientBuilder.build();
        this.studySetRepository = studySetRepository;
        this.userRepository = userRepository;
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
        if (file == null || file.isEmpty()) return "redirect:/";

        String fileText = extractText(file);
        String prompt = buildPrompt(message, fileText);

        String flashcardJson = extractJsonArray(realFlashcardChat(prompt));
        List<Flashcard> flashcards = MAPPER.readValue(flashcardJson, new TypeReference<List<Flashcard>>() {});

        String quizJson = extractJsonArray(realQuizChat(prompt));
        List<Quiz> quizzes = MAPPER.readValue(quizJson, new TypeReference<List<Quiz>>() {});

        User user = userRepository.findById(userSession.getUserId()).orElse(null);
        if (user == null) return "redirect:/login";

        StudySet set = new StudySet();
        set.setTitle(file.getOriginalFilename() != null ? file.getOriginalFilename() : "Untitled Study Set");
        set.setUser(user);

        for (Flashcard f : flashcards) f.setStudySet(set);
        for (Quiz q : quizzes) q.setStudySet(set);

        set.setFlashcards(flashcards);
        set.setQuizzes(quizzes);

        studySetRepository.save(set);

        int userId = userSession.getUserId();
        List<StudySet> studySets = studySetRepository.findAll()
                .stream()
                .filter(s -> s.getUser().getId() == userId)
                .toList();

        model.addAttribute("studySets", studySets);
        return "allnotes";
    }

    @GetMapping("/allnotes")
    public String allNotes(Model model) {
        if (!userSession.isLoggedIn()) return "redirect:/login";

        int userId = userSession.getUserId();
        List<StudySet> studySets = studySetRepository.findAll()
                .stream()
                .filter(s -> s.getUser().getId() == userId)
                .toList();

        model.addAttribute("studySets", studySets);
        return "allnotes";
    }

    @GetMapping("/flashcards/{studySetId}")
    public String showFlashcard(@PathVariable int studySetId, Model model) {
        if (!userSession.isLoggedIn()) return "redirect:/login";

        int userId = userSession.getUserId();
        StudySet set = studySetRepository.findById(studySetId)
                .filter(s -> s.getUser().getId() == userId)
                .orElse(null);
        if (set == null) return "redirect:/allnotes";

        List<Flashcard> flashcards = set.getFlashcards();
        model.addAttribute("fileTitle", set.getTitle());
        model.addAttribute("setId", studySetId);
        model.addAttribute("total", flashcards.size());
        model.addAttribute("flashcards", flashcards);

        return "flashcards";
    }

    @GetMapping("/quiz/{studySetId}/{number}")
    public String showQuestion(@PathVariable int studySetId,
                               @PathVariable int number,
                               @RequestParam(defaultValue = "0") int score,
                               Model model) {
        if (!userSession.isLoggedIn()) return "redirect:/login";

        int userId = userSession.getUserId();
        StudySet set = studySetRepository.findById(studySetId)
                .filter(s -> s.getUser().getId() == userId)
                .orElse(null);
        if (set == null) return "redirect:/allnotes";

        List<Quiz> questions = set.getQuizzes();
        if (number < 1 || number > questions.size()) return "redirect:/allnotes";

        Quiz q = questions.get(number - 1);

        List<String> options = new ArrayList<>();
        if (q.getResponses() != null && !q.getResponses().isEmpty()) {
            options.addAll(q.getResponses());
        }
        if (!options.contains(q.getAnswer())) options.add(q.getAnswer());
        Collections.shuffle(options);

        model.addAttribute("fileTitle", set.getTitle());
        model.addAttribute("setId", studySetId);
        model.addAttribute("number", number);
        model.addAttribute("total", questions.size());
        model.addAttribute("question", q.getQuestion());
        model.addAttribute("options", options);
        model.addAttribute("answer", q.getAnswer());
        model.addAttribute("score", score);
        return "quiz";
    }

    @PostMapping("/quiz/{studySetId}/{number}")
    public String submitAnswer(@PathVariable int studySetId,
                               @PathVariable int number,
                               @RequestParam("choice") String choice,
                               @RequestParam("correct") String correct,
                               @RequestParam("score") int score) {
        if (choice.equals(correct)) score++;

        int userId = userSession.getUserId();
        StudySet set = studySetRepository.findById(studySetId)
                .filter(s -> s.getUser().getId() == userId)
                .orElse(null);
        if (set == null) return "redirect:/allnotes";

        if (number < set.getQuizzes().size()) {
            return "redirect:/quiz/" + studySetId + "/" + (number + 1) + "?score=" + score;
        } else {
            return "redirect:/quiz/results/" + studySetId + "?score=" + score;
        }
    }

    @GetMapping("/quiz/results/{studySetId}")
    public String results(@PathVariable int studySetId,
                          @RequestParam int score,
                          Model model) {
        int userId = userSession.getUserId();
        StudySet set = studySetRepository.findById(studySetId)
                .filter(s -> s.getUser().getId() == userId)
                .orElse(null);
        if (set == null) return "redirect:/allnotes";

        model.addAttribute("score", score);
        model.addAttribute("total", set.getQuizzes().size());
        model.addAttribute("studySetId", studySetId);
        model.addAttribute("fileTitle", set.getTitle());
        model.addAttribute("allquizzes", set.getQuizzes());

        return "quiz_results";
    }

    @GetMapping("/delete/{studySetId}")
    public String deleteStudySet(@PathVariable int studySetId) {
        if (!userSession.isLoggedIn()) return "redirect:/login";

        int userId = userSession.getUserId();
        studySetRepository.findById(studySetId)
                .filter(s -> s.getUser().getId() == userId)
                .ifPresent(studySetRepository::delete);

        return "redirect:/allnotes";
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
