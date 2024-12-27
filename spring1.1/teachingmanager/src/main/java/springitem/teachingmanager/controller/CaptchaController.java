package springitem.teachingmanager.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import springitem.teachingmanager.utils.CaptchaUtil;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

@RestController
public class CaptchaController {

    @GetMapping("/api/captcha")
    public Map<String, String> getCaptcha(HttpSession session) throws Exception {
        String captchaText = CaptchaUtil.generateCaptchaText(6); // 6 characters
        session.setAttribute("captcha", captchaText); // Store in session
        BufferedImage captchaImage = CaptchaUtil.generateCaptchaImage(captchaText);

        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ImageIO.write(captchaImage, "png", outputStream);
        String base64Image = Base64.getEncoder().encodeToString(outputStream.toByteArray());

        Map<String, String> response = new HashMap<>();
        response.put("captchaImage", "data:image/png;base64," + base64Image);
        return response;
    }

    @PostMapping("/api/validate-captcha")
    public boolean validateCaptcha(@RequestBody Map<String, String> request, HttpSession session) {
        String userInput = request.get("captcha");
        String actualCaptcha = (String) session.getAttribute("captcha");
        return actualCaptcha != null && actualCaptcha.equalsIgnoreCase(userInput);
    }
}