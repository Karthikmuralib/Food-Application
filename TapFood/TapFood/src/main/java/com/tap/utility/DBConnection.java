package com.tap.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static final String HOST = System.getenv().getOrDefault("DB_HOST", "localhost");
	private static final String PORT = System.getenv().getOrDefault("DB_PORT", "3306");
	private static final String DATABASE = System.getenv().getOrDefault("DB_NAME", "tapfood");
	private static final String UNAME = System.getenv().getOrDefault("DB_USER", "root");
	private static final String PASSWORD = System.getenv().getOrDefault("DB_PASSWORD", "root");
	private static final String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE
			+ "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
	
	public final static Connection getConnection()
	{
		Connection connection=null;
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection=DriverManager.getConnection(URL, UNAME, PASSWORD);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			return connection;
	}
	
	

}
