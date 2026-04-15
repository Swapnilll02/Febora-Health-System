package com.febora.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.febora.dao.UserDAO;
import com.febora.model.User;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        User user = new User();

        user.setName(request.getParameter("name"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));
        user.setPhone(request.getParameter("phone"));

        UserDAO dao = new UserDAO();

        if(dao.register(user)) {
            response.sendRedirect("pages/login.jsp");
        } else {
            response.getWriter().println("Signup Failed");
        }
    }
}