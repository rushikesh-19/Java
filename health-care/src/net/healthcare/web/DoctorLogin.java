package net.healthcare.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.healthcare.dao.DoctorDAO;
import net.healthcare.model.Doctor;

@WebServlet("/DoctorLogin")
public class DoctorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String doctorUsername = request.getParameter("doctorUsername");
		String doctorPassword = request.getParameter("doctorPassword");

		System.out.println("Doctor Username: " + doctorUsername);
		System.out.println("Doctor Passoword: " + doctorPassword);

		DoctorDAO doctordao = new DoctorDAO();
		Doctor doctor = doctordao.getDoctor(doctorUsername, doctorPassword);

		if (doctor != null && doctor.getDoctorName() != null) {
			
			HttpSession session = request.getSession();
			
			System.out.println("Doctor Login Successfully");
			
			session.setAttribute("doctorid", doctor.getDoctorId());
			response.sendRedirect("doctorDashboard.jsp");
		
		} else {
			
			System.out.println("Doctor Username or Passoword Wrong");
			
			request.setAttribute("loginError","The email address or passowrd that you've entered doesn't match any account.");
			request.getRequestDispatcher("doctorLogin.jsp").forward(request, response);
		
		}

	}

}
