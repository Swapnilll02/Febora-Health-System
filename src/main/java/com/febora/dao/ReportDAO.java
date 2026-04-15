package com.febora.dao;

import java.sql.*;
import java.util.*;

import com.febora.model.Report;
import com.febora.util.DBConnection;

public class ReportDAO {

    // ===== UPLOAD =====
    public boolean uploadReport(Report r) {

        boolean status = false;

        try (Connection con = DBConnection.getConnection()) {

            String sql = "INSERT INTO reports(user_email, file_name, file_path) VALUES(?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, r.getUserEmail());
            ps.setString(2, r.getFileName());
            ps.setString(3, r.getFilePath());

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }


    // ===== GET REPORTS =====
    public List<Report> getReports(String email) {

        List<Report> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            String sql = "SELECT * FROM reports WHERE user_email=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Report r = new Report();

                r.setId(rs.getInt("id"));
                r.setUserEmail(rs.getString("user_email"));
                r.setFileName(rs.getString("file_name"));
                r.setFilePath(rs.getString("file_path"));

                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }


    // ===== DELETE REPORT =====
    public boolean deleteReport(int id) {

        boolean status = false;

        try (Connection con = DBConnection.getConnection()) {

            String sql = "DELETE FROM reports WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }


    // ===== COUNT (🔥 NEW FOR DASHBOARD) =====
    public int getReportCount(String email) {

        int count = 0;

        try (Connection con = DBConnection.getConnection()) {

            String sql = "SELECT COUNT(*) FROM reports WHERE user_email=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }
}