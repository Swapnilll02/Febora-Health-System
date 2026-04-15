package com.febora.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.febora.model.User;
import com.febora.util.DBConnection;

public class UserDAO {

    // ================= REGISTER USER =================
    public boolean register(User user) {

        boolean status = false;

        try (Connection con = DBConnection.getConnection()) {

            String sql =
            "INSERT INTO users(full_name,email,password,phone) VALUES(?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());

            int rows = ps.executeUpdate();

            if(rows > 0){
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }


    // ================= LOGIN USER =================
    public boolean login(String email, String password) {

        boolean status = false;

        try (Connection con = DBConnection.getConnection()) {

            String sql =
            "SELECT * FROM users WHERE email=? AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }


    // ================= GET USER BY EMAIL =================
    public User getUserByEmail(String email) {

        User user = null;

        try (Connection con = DBConnection.getConnection()) {

            String sql = "SELECT * FROM users WHERE email=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                user = new User();

                user.setName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setPassword(rs.getString("password"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }


    // ================= UPDATE PROFILE =================
    public boolean updateProfile(String name, String phone, String email) {

        boolean status = false;

        try (Connection con = DBConnection.getConnection()) {

            String sql =
            "UPDATE users SET full_name=?, phone=? WHERE email=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, email);

            int rows = ps.executeUpdate();

            if(rows > 0){
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }


    // ================= CHANGE PASSWORD =================
    public boolean changePassword(String email,
                                  String currentPassword,
                                  String newPassword) {

        boolean status = false;

        try (Connection con = DBConnection.getConnection()) {

            String checkSql =
            "SELECT * FROM users WHERE email=? AND password=?";

            PreparedStatement checkPs =
            con.prepareStatement(checkSql);

            checkPs.setString(1, email);
            checkPs.setString(2, currentPassword);

            ResultSet rs = checkPs.executeQuery();

            if(rs.next()){

                String updateSql =
                "UPDATE users SET password=? WHERE email=?";

                PreparedStatement updatePs =
                con.prepareStatement(updateSql);

                updatePs.setString(1, newPassword);
                updatePs.setString(2, email);

                int rows = updatePs.executeUpdate();

                if(rows > 0){
                    status = true;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

}