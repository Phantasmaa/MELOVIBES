package util;

import java.util.Random;

public class GenerateCode {

    public static int codeGenerator() {
        Random random = new Random();
        int otpCode = random.nextInt(999999) + 100000;
        return otpCode;
    }
}
