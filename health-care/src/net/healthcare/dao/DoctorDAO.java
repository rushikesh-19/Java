package net.healthcare.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import net.healthcare.model.Doctor;

public class DoctorDAO {
	String user = "root";
	String pwd = "root";
	String connUrl = "jdbc:mysql://localhost:3306/healthcare";

	Connection con = null;
	Statement stmt = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	

	public int insertDoctor(Doctor doctor) {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			String addNewDoctor = "insert into doctor(doctorName, doctorUsername, doctorPassword, dateOfJoining, doctorPost, doctorExperience, doctorDesignation) values(?,?,?,?,?,?,?)";
			ps = con.prepareStatement(addNewDoctor);

			ps.setString(1, doctor.getDoctorName());
			ps.setString(2, doctor.getDoctorUsername());
			ps.setString(3, doctor.getDoctorPassword());
			ps.setString(4, doctor.getDateOfJoining());
			ps.setString(5, doctor.getDoctorPost());
			ps.setString(6, doctor.getDoctorExperience());
			ps.setString(7, doctor.getDoctorDesignation());

			ps.executeUpdate();

			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public Doctor getDoctor(String doctorUsername, String doctorPassword) {
		Doctor doctor = new Doctor();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			String doctorLogin = "select * from doctor where doctorUsername=? and doctorPassword=?";
			ps = con.prepareStatement(doctorLogin);

			ps.setString(1, doctorUsername);
			ps.setString(2, doctorPassword);

			rs = ps.executeQuery();

			while (rs.next()) {
				doctor.setDoctorId(rs.getInt("doctorId"));
				doctor.setDoctorName(rs.getString("doctorName"));
				doctor.setDoctorUsername(rs.getString("doctorUsername"));
				doctor.setDoctorPassword(rs.getString("doctorPassword"));
			}

			rs.close();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return doctor;
	}
	
	public int deleteDoctor(Doctor doctor) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			stmt = con.createStatement();
			String deleteDoctor = "delete from doctor where doctorId = " + doctor.getDoctorId();
			stmt.executeUpdate(deleteDoctor);
			stmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
}