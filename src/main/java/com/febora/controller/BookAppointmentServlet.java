package com.febora.controller;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.febora.dao.AppointmentDAO;
import com.febora.model.Appointment;

@WebServlet("/bookAppointment")
public class BookAppointmentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("userEmail");

        String doctor = req.getParameter("doctor");
        String date = req.getParameter("date");

        Appointment ap = new Appointment();
        ap.setUserEmail(email);
        ap.setDoctorName(doctor);
        ap.setDate(date);

        AppointmentDAO dao = new AppointmentDAO();

        if(dao.bookAppointment(ap)){
            res.sendRedirect("pages/appointments.jsp?success=1");
        } else {
            res.sendRedirect("pages/appointments.jsp?error=1");
        }
    }
}