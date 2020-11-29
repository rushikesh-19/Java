package net.healthcare.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.healthcare.model.Admin;

public class AdminDAO {
	String user = "root";
	String pwd = "root";
	String connUrl = "jdbc:mysql://localhost:3306/healthcare";

	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;


	public Admin getAdmin(String adminUsername, String adminPassword) {
		Admin admin = new Admin();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			String adminLogin = "select * from admin where adminUsername=? and adminPassword=?";
			ps = con.prepareStatement(adminLogin);
			ps.setString(1, adminUsername);
			ps.setString(2, adminPassword);

			rs = ps.executeQuery();

			while (rs.next()) {
				admin.setAdminId(rs.getInt("adminId"));
				admin.setAdminName(rs.getString("adminName"));
				admin.setAdminUsername(rs.getString("adminUsername"));
				admin.setAdminPassword(rs.getString("adminPassword"));
			}

			rs.close();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return admin;
	}
}