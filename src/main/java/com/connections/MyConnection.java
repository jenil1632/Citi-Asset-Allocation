package com.connections;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class MyConnection {
	
	private static Connection con;
	
	static public Connection openConnection() {

		try {
			Class.forName("org.postgresql.Driver");			
			con=DriverManager.getConnection("jdbc:postgresql://localhost/Asset-allocation", "postgres", "admin");
				
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}	
}
