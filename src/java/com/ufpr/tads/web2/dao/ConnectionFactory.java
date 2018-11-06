package com.ufpr.tads.web2.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnectionFactory {

    public Connection getConnection() {
        try {
            Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection("jdbc:postgresql://localhost/web2", "postgres", "postgres");
        } catch (SQLException exception) {
            System.out.println("Erro ao conectar no banco: " + exception);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectionFactory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
//        try {
//            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
//            return DriverManager.getConnection("jdbc:mysql://localhost/banco_web2", "root", "root");
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
    }
}
