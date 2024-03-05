/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vehiclevalley.connection;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author neera
 */
public class CreateConnection {

    static Connection cn = null;

    // Create Connectinon
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclevalley", "root", "");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return cn;
    }

    // Close Connection 
    public static void closeConnection() {
        try {
            cn.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
