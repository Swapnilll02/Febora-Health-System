package com.febora.controller;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.febora.dao.UserDAO;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws IOException {

        HttpSession session = request.getSession();

        // Get session email (MORE RELIABLE)
        String sessionEmail = (String) session.getAttribute("userEmail");

        // Get form data
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        // ===== SAFETY CHECKS =====
        if(sessionEmail == null){
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
            return;
        }

        if(name == null || phone == null || email == null ||
           name.trim().isEmpty() || phone.trim().isEmpty() || email.trim().isEmpty()){

            response.sendRedirect(
                request.getContextPath() + "/pages/settings.jsp?error=profile"
            );
            return;
        }

        // Trim values (good practice)
        name = name.trim();
        phone = phone.trim();
        email = email.trim();

        // ===== DEBUG (optional, remove later) =====
        System.out.println("Updating profile:");
        System.out.println("Email: " + email);
        System.out.println("Name: " + name);
        System.out.println("Phone: " + phone);

        // DAO
        UserDAO dao = new UserDAO();

        boolean updated = dao.updateProfile(name, phone, email);

        if(updated){

            // Update session name (IMPORTANT for navbar)
            session.setAttribute("userName", name);

            response.sendRedirect(
                request.getContextPath() + "/pages/settings.jsp?success=profile"
            );

        } else {

            response.sendRedirect(
                request.getContextPath() + "/pages/settings.jsp?error=profile"
            );
        }
    }
}