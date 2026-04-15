package com.febora.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.febora.model.Appointment;
import com.febora.util.DBConnection;

public class AppointmentDAO {

    // ================= BOOK =================
    public boolean bookAppointment(Appointment ap) {

        boolean status = false;

        try (Connection con = DBConnection.getConnection()) {

            String sql = "INSERT INTO appointments(user_email, doctor_name, appointment_date) VALUES(?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, ap.getUserEmail());
            ps.setString(2, ap.getDoctorName());
            ps.setString(3, ap.getDate());

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }


    // ================= GET USER APPOINTMENTS =================
    public List<Appointment> getUserAppointments(String email) {

        List<Appointment> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            String sql = "SELECT * FROM appointments WHERE user_email=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Appointment ap = new Appointment();

                ap.setId(rs.getInt("id")); // ✅ required
                ap.setUserEmail(rs.getString("user_email"));
                ap.setDoctorName(rs.getString("doctor_name"));
                ap.setDate(rs.getString("appointment_date"));

                list.add(ap);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }


    // ================= DELETE =================
    public boolean deleteAppointment(int id) {

        boolean status = false;

        try (Connection con = DBConnection.getConnection()) {

            String sql = "DELETE FROM appointments WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }


    // ================= COUNT (🔥 NEW FOR DASHBOARD) =================
    public int getAppointmentCount(String email) {

        int count = 0;

        try (Connection con = DBConnection.getConnection()) {

            String sql = "SELECT COUNT(*) FROM appointments WHERE user_email=?";

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