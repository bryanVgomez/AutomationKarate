package integration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import net.minidev.json.JSONObject;

public class DbHandler {

	private static String connectionUrl = "jdbc:sqlserver://localhost:14330;databse=example;user=qa;password=qa";

	public static void changeNewName(String jobName) {
		try (Connection connect = DriverManager.getConnection(connectionUrl)) {
			connect.createStatement().execute("query");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
