package com.forgot.password;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ForgotDao {
	String user = "root";
	String pwd = "rishimax";
	String connUrl = "jdbc:mysql://localhost:3306/mybook";
	Connection con = null;
	PreparedStatement ps = null;
	
	String query = "select * from user where email=? and security_question=? and security_answer=?";
	


	public Forgot getCustomer(String email, String security_question , String security_answer) {
		
		Forgot dao = new Forgot();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			ps = con.prepareStatement(query);
			
			ps.setString(1, email);
			ps.setString(2, security_question);
			ps.setString(3, security_answer);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				dao.setUser_id(rs.getString("user_id"));
				dao.setEmail(rs.getString("email"));
				dao.setSecurity_question(rs.getString("security_question"));
				dao.setSecurity_answer(rs.getString("security_answer"));
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return dao;
	}
}