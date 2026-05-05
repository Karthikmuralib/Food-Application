package com.tap.model.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.UserDAO;
import com.tap.model.User;
import com.tap.utility.DBConnection;

public class UserDAOImpl implements UserDAO{
	private static final String INSERT_USER_QUERY="Insert into `User`(`name`,'username`,`password`,`email`,`phone`,`address`,`role`,`createdDate`) "+ "values (?,?,?,?,?,?,?)";
	private static final String GET_USER_QUERY="SELECT * from user where userid=?";
	private static final String UPDATE_USER_QUERY="UPDATE `user` set `name`=? `paasword`=? `phone`=? `address`=? `role`=?";
	private static final String DELETE_USER_QUERY="DELETE FROM `user` where `userid`=?";
	private static final String GET_ALL_QUERY="SELECT * FROM `user`";


	@Override
	public void addUser(User user) {
		
		
		
		try(Connection connection=DBConnection.getConnection();
				PreparedStatement pre=connection.prepareStatement(INSERT_USER_QUERY);
				) {
			
			pre.setString(1,"user.getName()");
			pre.setString(2,"user.getUserame()");
			pre.setString(3,"user.getPassword()");
			pre.setString(4,"user.getEmail()");
			pre.setString(5,"user.getPhone()");
			pre.setString(6,"user.getAddress()");
			pre.setString(7,"user.getRole()");
			
			int res=pre.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

	@Override
	public User getUser(int userid) {
		User user=null;
		try (Connection connection=DBConnection.getConnection();
		PreparedStatement pre=connection.prepareStatement(GET_USER_QUERY);)
		{
			pre.setInt(1, userid);
			ResultSet res=pre.executeQuery();
		    user=extractUser(res);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return user;
	}

	@Override
	public void updateUser(User user) {
		Connection connection=null;
		PreparedStatement pre;
		
	try {
		connection=DBConnection.getConnection();
		 pre=connection.prepareStatement(UPDATE_USER_QUERY);
		pre.setString(1, user.getName());
		pre.setString(2, user.getPassword());
		pre.setString(3, user.getPhone());
		pre.setString(4, user.getAddress());
		pre.setString(5, user.getRole());
		pre.execute();
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
	}

	@Override
	public void deleteUser(int userid) {
		
		
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement pre=connection.prepareStatement(DELETE_USER_QUERY);
			pre.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	@Override
	public List<User> getAllUsers() {
		
		
		
		ArrayList<User> usersList=new ArrayList<User>();
		try {
			Connection connection=DBConnection.getConnection();
			Statement statement=connection.createStatement();
			ResultSet res=statement.executeQuery(GET_ALL_QUERY);
			
			while(res.next())
			{
				User user=extractUser(res);
				
				usersList.add(user);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return usersList;
	}
	User extractUser(ResultSet res) throws SQLException
	{
		int userid=res.getInt("userid");
		String name=res.getString("name");
		String username=res.getString("username");
		String password=res.getString("password");
		String email=res.getString("email");
		String phone=res.getString("phone");
		String address=res.getString("address");
		String role=res.getString("role");
		
		 User user=new User(userid, name, username, password, email, phone, address, role, null, null);
		
		 return user;
	}

	
	
}
