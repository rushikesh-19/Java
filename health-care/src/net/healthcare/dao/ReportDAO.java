package net.healthcare.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import net.healthcare.model.Report;

public class ReportDAO {
	String user = "root";
	String pwd = "root";
	String connUrl = "jdbc:mysql://localhost:3306/healthcare";

	Connection con = null;
	Statement stmt = null;

	public int showReport (Report report) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			String showReport = "update report set reportStatus = true where reportId = " + report.getReportId();

			stmt = con.createStatement();
			stmt.executeUpdate(showReport);

			stmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int hideReport (Report report) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			String hideReport = "update report set reportStatus = false where reportId = " + report.getReportId();

			stmt = con.createStatement();
			stmt.executeUpdate(hideReport);

			stmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int deleteReport(Report report) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			String deleteReport = "delete from report where reportId = " + report.getReportId();

			stmt = con.createStatement();
			stmt.executeUpdate(deleteReport);

			stmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
