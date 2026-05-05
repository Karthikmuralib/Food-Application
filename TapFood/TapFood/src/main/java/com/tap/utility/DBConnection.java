package com.tap.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.tap.model.User;

public class DBConnection {
	
	private  static  final String URL="jdbc:mysql://localhost:3306/tapfood";
	private  static  final String UNAME="root";
	private  static  final String PASSWORD="root";
	
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
