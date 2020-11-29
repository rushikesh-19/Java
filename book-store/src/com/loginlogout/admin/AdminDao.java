package com.loginlogout.admin;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDao {
	String user = "root";
	String pwd = "rishimax";
	String connUrl = "jdbc:mysql://localhost:3306/mybook";
	String sql = "select * from admin where username=? and password=?";
	PreparedStatement ps;
	Connection con;
	public Admin getAdmin(String username, String password) {
		Admin dao = new Admin();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				dao.setAdmin_id(rs.getString("admin_id"));
				dao.setAdmin_name(rs.getString("admin_name"));
				dao.setUsername(rs.getString("username"));
				dao.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return dao;
	}
}
