package com.febora.controller;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws IOException {

        HttpSession session = request.getSession(false);

        if(session != null){
            session.invalidate(); // destroy session
        }

        response.sendRedirect("pages/login.jsp");
    }
}