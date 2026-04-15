package com.febora.controller;

import java.io.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;

import com.febora.dao.ReportDAO;
import com.febora.model.Report;

@WebServlet("/uploadReport")
@MultipartConfig
public class UploadReportServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws IOException, ServletException {

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("userEmail");

        Part filePart = request.getPart("report");

        String fileName = filePart.getSubmittedFileName();

        String uploadPath = getServletContext().getRealPath("") + "uploads";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String filePath = uploadPath + File.separator + fileName;

        filePart.write(filePath);

        Report r = new Report();
        r.setUserEmail(email);
        r.setFileName(fileName);
        r.setFilePath("uploads/" + fileName);

        ReportDAO dao = new ReportDAO();

        if(dao.uploadReport(r)){
            response.sendRedirect("pages/reports.jsp?success=1");
        } else {
            response.sendRedirect("pages/reports.jsp?error=1");
        }
    }
}