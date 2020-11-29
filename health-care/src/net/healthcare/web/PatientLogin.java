package net.healthcare.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.healthcare.dao.PatientDAO;
import net.healthcare.model.Patient;

@WebServlet("/PatientLogin")
public class PatientLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String patientUsername = request.getParameter("patientUsername");
		String patientPassword = request.getParameter("patientPassword");

		System.out.println("Patient Username: " + patientUsername);
		System.out.println("Patient Password: " + patientPassword);

		PatientDAO patientdao = new PatientDAO();
		Patient patient = patientdao.getPatient(patientUsername, patientPassword);

		if (patient != null && patient.getPatientName() != null) {
			
			HttpSession session = request.getSession();
			
			System.out.println("Patient Login Successfully");
			
			session.setAttribute("patientid", patient.getPatientId());
			response.sendRedirect("patientDashboard.jsp");

		} else {
			
			System.out.println("Patient Username or Passoword Wrong");
			
			request.setAttribute("loginError","The email address or passowrd that you've entered doesn't match any account.Sign up for now!!");
			request.getRequestDispatcher("patientLogin.jsp").forward(request, response);
		
		}
	}
}