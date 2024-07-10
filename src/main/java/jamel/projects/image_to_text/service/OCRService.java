package jamel.projects.image_to_text.service;

import net.sourceforge.tess4j.TesseractException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import net.sourceforge.tess4j.Tesseract;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Service
public class OCRService {
    public String extractTextFromImage(MultipartFile imageFile) throws IOException, TesseractException {

        // Initialize OCR engine
        Tesseract tesseract = new Tesseract();
        tesseract.setDatapath("/tessdata");

        // Process the image
        BufferedImage image = ImageIO.read(imageFile.getInputStream());
        String extractedText = tesseract.doOCR(image);

        return extractedText;
    }
}
