package com.febora.controller;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.febora.dao.UserDAO;
import com.febora.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();

        if(dao.login(email, password)) {

            // Fetch full user data
            User user = dao.getUserByEmail(email);

            HttpSession session = request.getSession();

            // Store email in session
            session.setAttribute("userEmail", user.getEmail());

            // Store name in session
            session.setAttribute("userName", user.getName());

            response.sendRedirect("pages/home.jsp");

        } else {

            response.sendRedirect("pages/login.jsp?error=1");

        }
    }
}