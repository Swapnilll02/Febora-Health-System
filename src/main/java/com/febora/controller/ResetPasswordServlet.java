package com.febora.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.febora.util.DBConnection;

@WebServlet("/resetPassword")
public class ResetPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws IOException {

        HttpSession session = request.getSession(false);

        String email = (String) session.getAttribute("resetEmail");
        String password = request.getParameter("password");

        try(Connection con = DBConnection.getConnection()) {

            String sql =
                "UPDATE users SET password=? WHERE email=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, password);
            ps.setString(2, email);

            ps.executeUpdate();

            session.removeAttribute("resetEmail");

            response.sendRedirect("pages/login.jsp?reset=success");

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}