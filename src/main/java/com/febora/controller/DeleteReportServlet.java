package com.febora.controller;

import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.febora.dao.ReportDAO;

@WebServlet("/deleteReport")
public class DeleteReportServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        ReportDAO dao = new ReportDAO();
        dao.deleteReport(id);

        response.sendRedirect(
            request.getContextPath() + "/pages/reports.jsp"
        );
    }
}