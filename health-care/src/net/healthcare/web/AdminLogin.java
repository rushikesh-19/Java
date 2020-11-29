package net.healthcare.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.healthcare.dao.AdminDAO;
import net.healthcare.model.Admin;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String adminUsername = request.getParameter("adminUsername");
		String adminPassword = request.getParameter("adminPassword");

		System.out.println("Admin Username: " + adminUsername);
		System.out.println("Admin Passowrd: " + adminPassword);

		AdminDAO admindao = new AdminDAO();
		Admin admin = admindao.getAdmin(adminUsername, adminPassword);

		if (admin != null && admin.getAdminName() != null) {
			
			HttpSession session = request.getSession();
			
			System.out.println("Admin Login Successfully");
			
			session.setAttribute("adminid", admin.getAdminId());
			response.sendRedirect("adminDashboard.jsp");
		
		} else {
			
			System.out.println("Admin Username or Passoword Wrong");
			
			request.setAttribute("loginError","The email address or passowrd that you've entered doesn't match any account.");
			request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
		}
	}
}