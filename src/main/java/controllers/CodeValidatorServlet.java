package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import static util.HashMethod.hashPassword;

@WebServlet(name = "CodeValidatorServlet", urlPatterns = {"/views/log/CodeValidatorServlet"})
public class CodeValidatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String codeHashed =  hashPassword(code);
        HttpSession session = request.getSession();

        String storedCodeHashed = (String) session.getAttribute("code");

        if (storedCodeHashed != null && storedCodeHashed.equals(codeHashed)) {

            String userEmail = (String) session.getAttribute("mail");
            session.invalidate();
            HttpSession newSession = request.getSession();
            newSession.setAttribute("mail", userEmail);
            response.sendRedirect(request.getContextPath() + "/views/log/newPassword.jsp");
        } else {
            session.invalidate();
            response.sendRedirect("../../");
        }

    }

}
