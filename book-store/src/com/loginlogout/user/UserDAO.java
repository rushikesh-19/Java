package com.loginlogout.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	String user = "root";
	String pwd = "rishimax";
	String connUrl = "jdbc:mysql://localhost:3306/mybook";
	Connection con = null;
	PreparedStatement ps = null;
	
	String query1 = "insert into user values(?,?,?,?,?,?,?,?)";
	String query2 = "select * from user where email=? and password=?";
	

	public int insertCustomer(User c) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			ps = con.prepareStatement(query1);
			ps.setInt(1, c.getUserid());
			ps.setString(2, c.getUser_name());
			ps.setString(3, c.getEmail());
			ps.setString(4, c.getPassword());
			ps.setString(5, c.getContact());
			ps.setString(6, c.getAddress());
			ps.setString(7,c.getSecurity_question());
			ps.setString(8,c.getSecurity_answer());
			ps.executeUpdate();
			
			ps.close();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	public User getCustomer(String email, String password) {
		
		User dao = new User();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			ps = con.prepareStatement(query2);
			
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				dao.setUserid(rs.getInt("user_id"));
				dao.setUser_name(rs.getString("user_name"));
				dao.setEmail(rs.getString("email"));
				dao.setPassword(rs.getString("password"));
			}
			
			ps.close();
			rs.close();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return dao;
	}

}
