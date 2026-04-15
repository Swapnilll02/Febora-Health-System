package com.febora.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.febora.model.Doctor;
import com.febora.util.DBConnection;

public class DoctorDAO {

    // ================= GET ALL DOCTORS =================
    public List<Doctor> getAllDoctors() {

        List<Doctor> list = new ArrayList<>();

        try(Connection con = DBConnection.getConnection()) {

            String sql = "SELECT * FROM doctors";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Doctor d = new Doctor();

                d.setName(rs.getString("name"));
                d.setSpecialization(rs.getString("specialization"));
                d.setExperience(rs.getInt("experience"));
                d.setHospital(rs.getString("hospital"));

                list.add(d);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }


    // ================= COUNT (🔥 NEW FOR DASHBOARD) =================
    public int getDoctorCount() {

        int count = 0;

        try(Connection con = DBConnection.getConnection()) {

            String sql = "SELECT COUNT(*) FROM doctors";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                count = rs.getInt(1);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return count;
    }
}