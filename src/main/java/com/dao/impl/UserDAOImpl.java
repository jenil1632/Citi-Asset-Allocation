package com.dao.impl;

import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.connections.MyConnection;

import com.dao.UserDAO;
import com.pojo.User;

public class UserDAOImpl implements UserDAO {

	@Override
	public int addUser(User user) {
		// TODO Auto-generated method stub
        int rowsAdded = 0;
		
		String  ADD_USER="INSERT INTO CLIENT VALUES(?,?,?)";
		
		try {
			Connection con = MyConnection.openConnection();
			PreparedStatement ps = con.prepareStatement(ADD_USER);
			ps.setString(1, user.getEmailid());
			ps.setString(2, user.getUsername());
			ps.setString(3, user.getPassword());
		
			
			rowsAdded = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return rowsAdded;

	}

	@Override
	public boolean checkLogin(String username, String password) {
		// TODO Auto-generated method stub
		String FIND_BY_USERNAME = "SELECT * FROM CLIENT WHERE USERNAME = ?";
		try(Connection con = MyConnection.openConnection()) {
			
			PreparedStatement ps = con.prepareStatement(FIND_BY_USERNAME);
			ps.setString(1, username);
			ResultSet set = ps.executeQuery();
			while(set.next()) {
				String password1 = set.getString("password");
				if(password.equals(password1)) {
					return true;
				}
			}
			
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			}
		return false;

	}

	@Override
	public String getEmail(String username) {
		// TODO Auto-generated method stub
		String FIND_BY_USERNAME = "SELECT emailid FROM CLIENT WHERE USERNAME = ?";
		try(Connection con = MyConnection.openConnection()) {
			
			PreparedStatement ps = con.prepareStatement(FIND_BY_USERNAME);
			ps.setString(1, username);
			ResultSet set = ps.executeQuery();
			while(set.next()) {
				String email = set.getString("emailid");
				return email;
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			}
		return null;
	}


}
