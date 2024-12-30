package springitem.teachingmanager.utils;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

public class CaptchaUtil {
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
    private static final int WIDTH = 120;
    private static final int HEIGHT = 40;

    public static String generateCaptchaText(int length) {
        StringBuilder captcha = new StringBuilder(length);
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            captcha.append(CHARACTERS.charAt(random.nextInt(CHARACTERS.length())));
        }
        return captcha.toString();
    }

    public static BufferedImage generateCaptchaImage(String captchaText) {
        BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
        Graphics2D graphics = image.createGraphics();

        // Background
        graphics.setColor(Color.WHITE);
        graphics.fillRect(0, 0, WIDTH, HEIGHT);

        // Draw text
        graphics.setFont(new Font("Arial", Font.BOLD, 24));
        Random random = new Random();
        for (int i = 0; i < captchaText.length(); i++) {
            graphics.setColor(new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255)));
            graphics.drawString(String.valueOf(captchaText.charAt(i)), 20 * i + 10, 30);
        }

        // Add noise
        for (int i = 0; i < 10; i++) {
            graphics.setColor(new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255)));
            graphics.drawLine(random.nextInt(WIDTH), random.nextInt(HEIGHT), random.nextInt(WIDTH), random.nextInt(HEIGHT));
        }

        graphics.dispose();
        return image;
    }
}