package org.example;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AirlineDatabaseQueries {
    AirlineDatabaseQueries() {
    }

    public static void getTotalFlights() {
        String sql = "SELECT COUNT(*) FROM Flights";

        AppTest DatabaseConnection = null;
        try (Connection conn = AppTest.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            if (rs.next()) {
                int totalFlights = rs.getInt(1);
                System.out.println("Total de vuelos: " + totalFlights);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        getTotalFlights();
    }

    public static AirlineDatabaseQueries createAirlineDatabaseQueries() {
        return new AirlineDatabaseQueries();
    }
}
