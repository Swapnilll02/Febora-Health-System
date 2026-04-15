package com.febora.controller;

import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.febora.dao.AppointmentDAO;

@WebServlet("/deleteAppointment")
public class DeleteAppointmentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        AppointmentDAO dao = new AppointmentDAO();
        dao.deleteAppointment(id);

        response.sendRedirect(
            request.getContextPath() + "/pages/appointments.jsp"
        );
    }
}