package com.febora.controller;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.febora.dao.UserDAO;

@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws IOException {

        HttpSession session = request.getSession(false);

        // ===== SESSION CHECK =====
        if(session == null || session.getAttribute("userEmail") == null){
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
            return;
        }

        // ===== GET EMAIL FROM SESSION =====
        String email = (String) session.getAttribute("userEmail");

        // ===== GET FORM DATA =====
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // ===== VALIDATION =====
        if(currentPassword == null || newPassword == null || confirmPassword == null ||
           currentPassword.trim().isEmpty() || newPassword.trim().isEmpty() || confirmPassword.trim().isEmpty()){

            response.sendRedirect(
                request.getContextPath() + "/pages/settings.jsp?error=password"
            );
            return;
        }

        // Password match check
        if(!newPassword.equals(confirmPassword)){
            response.sendRedirect(
                request.getContextPath() + "/pages/settings.jsp?error=match"
            );
            return;
        }

        // ===== DAO =====
        UserDAO dao = new UserDAO();

        boolean changed = dao.changePassword(email, currentPassword, newPassword);

        if(changed){
            response.sendRedirect(
                request.getContextPath() + "/pages/settings.jsp?success=password"
            );
        } else {
            response.sendRedirect(
                request.getContextPath() + "/pages/settings.jsp?error=password"
            );
        }
    }
}