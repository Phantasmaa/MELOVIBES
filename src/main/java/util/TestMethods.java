package util;

import static util.GenerateCode.codeGenerator;
import static util.MailSender.sendCode;
public class TestMethods {

    public static void main(String[] args) {

        String code = Integer.toString(codeGenerator());
        sendCode(code,"manuel.angeles@unmsm.edu.pe");//se envía el código




    }

}
