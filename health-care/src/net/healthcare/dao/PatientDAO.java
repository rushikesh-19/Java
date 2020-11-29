package net.healthcare.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import net.healthcare.model.Patient;

public class PatientDAO {

	String user = "root";
	String pwd = "root";
	String connUrl = "jdbc:mysql://localhost:3306/healthcare";

	Connection con = null;
	Statement stmt = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public int insertPatient(Patient patient) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			String patientRegister = "insert into patient (patientGender,patientName,patientBirthdate,patientHeight,patientWeight,patientUsername,patientPassword,patientAllergy,patientSymptoms,patientIlleness,patientOperations,patientMedictions,patientExercise,patientDiet,patientDrink,patientCaffeine,patientSmoke,patientComments,doctorSuggestions,suggested,contactPerson) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			ps = con.prepareStatement(patientRegister);

			ps.setString(1, patient.getPatientGender());
			ps.setString(2, patient.getPatientName());
			ps.setString(3, patient.getPatientBirthdate());
			ps.setInt(4, patient.getPatientHeight());
			ps.setInt(5, patient.getPatientWeight());
			ps.setString(6, patient.getPatientUsername());
			ps.setString(7, patient.getPatientPassword());
			ps.setString(8, patient.getPatientAllergy());

			String patientSymptons = "";
			for (String symptoms : patient.getPatientSymptoms()) {
				if (patientSymptons.equals("")) {
					patientSymptons = symptoms;
				} else {
					patientSymptons += ", " + symptoms;
				}
			}

			ps.setString(9, patientSymptons);
			ps.setString(10, patient.getPatientIllness());
			ps.setString(11, patient.getPatientOperations());
			ps.setString(12, patient.getPatientMedictions());
			ps.setString(13, patient.getPatientExercise());
			ps.setString(14, patient.getPatientDiet());
			ps.setString(15, patient.getPatientDrink());
			ps.setString(16, patient.getPatientCaffeine());
			ps.setString(17, patient.getPatientSmoke());
			ps.setString(18, patient.getPatientComments());
			ps.setString(19, "No Suggestions");
			ps.setBoolean(20, false);
			ps.setString(21, "Contact Soon");
//			System.out.println("Patient Symptoms: " + patientSymptons);

			ps.executeBatch();
			ps.executeUpdate();

			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public Patient getPatient(String patientUsername, String patientPassword) {

		Patient patient = new Patient();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			String patientLogin = "select * from patient where patientUsername=? and patientPassword=?";
			ps = con.prepareStatement(patientLogin);
			ps.setString(1, patientUsername);
			ps.setString(2, patientPassword);

			rs = ps.executeQuery();

			while (rs.next()) {
				patient.setPatientId(rs.getInt("patientId"));
				patient.setPatientName(rs.getString("patientName"));
				patient.setPatientUsername(rs.getString("patientUsername"));
				patient.setPatientPassword(rs.getString("patientPassword"));
			}

			rs.close();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return patient;
	}
	
	public int deletePatient(Patient patient) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			stmt = con.createStatement();
			String deletePatient = "delete from patient where patientId = " + patient.getPatientId();
			stmt.executeUpdate(deletePatient);
			stmt.close();
			
			stmt = con.createStatement();
			String deletePayment = "delete from payment where patientId = " + patient.getPatientId();
			stmt.executeUpdate(deletePayment);
			stmt.close();
			
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}