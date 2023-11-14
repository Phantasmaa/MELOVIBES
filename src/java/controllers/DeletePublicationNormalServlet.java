/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.PublicationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author manue
 */
@WebServlet("/views/user/DeletePublicationNormal")
public class DeletePublicationNormalServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int publicationID = Integer.parseInt(request.getParameter("publicationID"));
        System.out.println("aaaaaaaaaaaa: "+publicationID);

        PublicationDAO publicationDAO = new PublicationDAO();

//intentar usar un procedimiento almacenado
        publicationDAO.deleteNormalPublication(publicationID);


        response.sendRedirect("myprofile");
    }
}

