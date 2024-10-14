package com.example.bootstrapjsp;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "LogoutServlet", value = "/logout")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Obtener sesión existente
        if (session != null) {
            session.invalidate(); // Invalidar sesión
        }
        response.sendRedirect("index.jsp"); // Redirigir al login
    }
}