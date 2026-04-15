package com.febora.controller;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.febora.util.DBConnection;

@WebServlet("/verifyEmail")
public class ForgotPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws IOException {

        String email = request.getParameter("email");

        try(Connection con = DBConnection.getConnection()) {

            String sql = "SELECT * FROM users WHERE email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                HttpSession session = request.getSession();
                session.setAttribute("resetEmail", email);

                response.sendRedirect("pages/reset-password.jsp");

            } else {
                response.sendRedirect("pages/forgot-password.jsp?error=1");
            }

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}