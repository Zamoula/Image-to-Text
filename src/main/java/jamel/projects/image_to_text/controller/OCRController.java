package jamel.projects.image_to_text.controller;

import jamel.projects.image_to_text.service.OCRService;
import net.sourceforge.tess4j.TesseractException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/ocr")
public class OCRController {

    @Autowired
    private OCRService ocrService;

    @PostMapping()
    public ResponseEntity<String> extractTextFromImage(@RequestParam("file") MultipartFile imageFile) throws IOException , TesseractException {
            String extractedText = ocrService.extractTextFromImage(imageFile);
            return ResponseEntity.ok(extractedText);
    }
}
