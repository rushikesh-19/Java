package net.healthcare.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.healthcare.dao.PatientDAO;
import net.healthcare.model.Patient;

@WebServlet("/AdminSetting")
public class AdminSetting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pId = request.getParameter("patientId");
		int patientId = Integer.parseInt(pId);
		
		System.out.println("Patient Id: " + patientId);
		
		Patient patient = new Patient();
		PatientDAO patientDao = new PatientDAO();

		if (pId != null) {
			
			patient.setPatientId(patientId);
			patientDao.deletePatient(patient);

			System.out.println("Delete patient successfully where Patient Id: " + patientId);
			
			response.sendRedirect("showAllPatients.jsp");
		
		} else {
			
			request.setAttribute("Error", "Something went wrong Patient Id: " + patientId);
			
			System.out.println("Something went wrong Patient Id: " + patientId);
		
		}
	}

}
