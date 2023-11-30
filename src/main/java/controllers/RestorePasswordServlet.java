package controllers;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;

import static util.GenerateCode.codeGenerator;
import static util.HashMethod.hashPassword;
import static util.MailSender.sendCode;

@WebServlet(name = "RestorePasswordServlet", urlPatterns = {"/views/log/RestorePasswordServlet"})
public class RestorePasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String code = Integer.toString(codeGenerator());
        sendCode(code, email);//
        String codeHashed = hashPassword(code);


        HttpSession session = request.getSession();
        session.setAttribute("mail", email);
        session.setAttribute("code", codeHashed);

        response.sendRedirect(request.getContextPath() + "/views/log/confirmCode.jsp");


    }


}
