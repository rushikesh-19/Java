package net.healthcare.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.healthcare.dao.DoctorDAO;
import net.healthcare.model.Doctor;

@WebServlet("/DoctorSetting")
public class DoctorSetting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String dId = request.getParameter("doctorId");	
		String doctorName = request.getParameter("doctorName");
		String doctorUsername = request.getParameter("doctorUsername");
		String doctorPassword = request.getParameter("doctorPassword");
		String dateOfJoining = request.getParameter("dateOfJoining");
		String doctorPost = request.getParameter("doctorPost");
		String doctorExperience = request.getParameter("doctorExperience");
		String doctorDesignation = request.getParameter("doctorDesignation");
		String submitValue = request.getParameter("submit");
		
		System.out.println("Submit Value: " + submitValue);
		
		Doctor doctor = new Doctor();
		DoctorDAO doctorDao = new DoctorDAO();
		
		if(submitValue.equals("Delete")) {
			
			int doctorId = Integer.parseInt(dId);
			doctor.setDoctorId(doctorId);
			doctorDao.deleteDoctor(doctor);
			
			System.out.println("Doctor deleted successfully Doctor Id: " + doctorId);
			
			response.sendRedirect("showAllDoctors.jsp");
		
		} else if (submitValue.equals("Add Doctor")) {
			
			doctor.setDoctorName(doctorName);
			doctor.setDoctorUsername(doctorUsername);
			doctor.setDoctorPassword(doctorPassword);
			doctor.setDateOfJoining(dateOfJoining);
			doctor.setDoctorPost(doctorPost);
			doctor.setDoctorExperience(doctorExperience);
			doctor.setDoctorDesignation(doctorDesignation);
			
			doctorDao.insertDoctor(doctor);
			
			System.out.println("Doctor Name: " + doctorName);
			System.out.println("Doctor Username: " + doctorUsername);
			System.out.println("Doctor Password: " + doctorPassword);
			System.out.println("Doctor Date of Joining: " + dateOfJoining);
			System.out.println("Doctor Post: " + doctorPost);
			System.out.println("Doctor Experience: " + doctorExperience);
			System.out.println("Doctor Designation: " + doctorDesignation);	
			
			System.out.println("Doctor Added Successfully");
			
			response.sendRedirect("addNewDoctor.jsp");
		}		
	}
}