package com.febora.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static String url =
        "jdbc:mysql://localhost:3306/febora_db";

    private static String user = "root";
    private static String password = "Swapnil@mysql2000"; // change if needed

    public static Connection getConnection() {

        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}