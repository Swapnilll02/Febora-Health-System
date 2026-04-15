package com.febora.model;

public class Appointment {

    private int id; // 🔥 ADD THIS

    private String userEmail;
    private String doctorName;
    private String date;

    // ===== ID =====
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    // ===== USER EMAIL =====
    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    // ===== DOCTOR =====
    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    // ===== DATE =====
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}