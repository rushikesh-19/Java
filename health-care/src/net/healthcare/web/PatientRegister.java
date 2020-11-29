package net.healthcare.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.healthcare.dao.PatientDAO;
import net.healthcare.model.Patient;

@WebServlet("/PatientRegister")
public class PatientRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String patientGender = request.getParameter("patientGender");
		String patientName = request.getParameter("patientName");
		String patientBirthdate = request.getParameter("patientBirthdate");

		String ph = request.getParameter("patientHeight");
		int patientHeight = Integer.parseInt(ph);

		String pw = request.getParameter("patientWeight");
		int patientWeight = Integer.parseInt(pw);

		String patientUsername = request.getParameter("patientUsername");
		String patientPassword = request.getParameter("patientPassword");
		String patientAllergy = request.getParameter("patientAllergy");

		String[] patientSymptomsList = request.getParameterValues("patientSymptoms");
		List<String> patientSymptoms = Arrays.asList(patientSymptomsList);

		String patientIllness = request.getParameter("patientIllnesses");
		String patientOperations = request.getParameter("patientOperations");
		String patientMedictions = request.getParameter("patientMedictions");
		String patientExercise = request.getParameter("patientExercise");
		String patientDiet = request.getParameter("patientDiet");
		String patientDrink = request.getParameter("patientDrink");
		String patientCaffeine = request.getParameter("patientCaffeine");
		String patientSmoke = request.getParameter("patientSmoke");
		String patientComments = request.getParameter("patientComments");

		System.out.println("Patient Gender: " + patientGender);
		System.out.println("Patient Name: " + patientName);
		System.out.println("Patient BirthDate: " + patientBirthdate);
		System.out.println("Patient Height: " + patientHeight);
		System.out.println("Patient Weight: " + patientWeight);
		System.out.println("Patient Username: " + patientUsername);
		System.out.println("Patient Passowrd: " + patientPassword);
		System.out.println("Patient Allergy: " + patientAllergy);
		System.out.println("Patient Symptoms: " + patientSymptoms);
		System.out.println("Patient Operations: " + patientOperations);
		System.out.println("Patient Medictions: " + patientMedictions);
		System.out.println("Patient Exercise: " + patientExercise);
		System.out.println("Patient Diet: " + patientDiet);
		System.out.println("Patient Drink: " + patientDrink);
		System.out.println("Patient Caffeine: " + patientCaffeine);
		System.out.println("Patient Smoke: " + patientSmoke);
		System.out.println("Patient Comments: " + patientComments);

		PatientDAO patientdao = new PatientDAO();
		Patient patient = new Patient();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			String user = "root";
			String pwd = "rishimax";
			String connUrl = "jdbc:mysql://localhost:3306/healthcare";
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			ps = con.prepareStatement("select patientId from patient");
			rs = ps.executeQuery();
			
			int patientId = 0;
			while (rs.next()) {
				patientId = rs.getInt("patientId");
			}
			patientId++;
			ps.close();
			rs.close();
			con.close();

			patient.setPatientId(patientId);
			patient.setPatientGender(patientGender);
			patient.setPatientName(patientName);
			patient.setPatientBirthdate(patientBirthdate);
			patient.setPatientHeight(patientHeight);
			patient.setPatientWeight(patientWeight);
			patient.setPatientUsername(patientUsername);
			patient.setPatientPassword(patientPassword);
			patient.setPatientAllergy(patientAllergy);
			patient.setPatientSymptoms(patientSymptoms);
			patient.setPatientIllness(patientIllness);
			patient.setPatientOperations(patientOperations);
			patient.setPatientMedictions(patientMedictions);
			patient.setPatientExercise(patientExercise);
			patient.setPatientDiet(patientDiet);
			patient.setPatientDrink(patientDrink);
			patient.setPatientCaffeine(patientCaffeine);
			patient.setPatientSmoke(patientSmoke);
			patient.setPatientComments(patientComments);

			patientdao.insertPatient(patient);	
		
			System.out.println("Patient Registration Successfully");
			
			response.sendRedirect("patientLogin.jsp");
	
		} catch (Exception e) {
			
			System.out.println("Something went wrong ");
			e.printStackTrace();	
			
			request.setAttribute("registerError","Registration error!! Please try again...");
			request.getRequestDispatcher("patientRegister.jsp").forward(request, response);
		}
	}
}