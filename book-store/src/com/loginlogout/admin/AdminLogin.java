package com.loginlogout.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDao admin = new AdminDao();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String submitType = request.getParameter("submit");
		
		Admin dao = admin.getAdmin(username, password);
		
		if (submitType.equals("login") && dao!= null && dao.getAdmin_name()!= null) {
			HttpSession session = request.getSession();
			session.setAttribute("adminid", dao.getAdmin_id());
			request.getRequestDispatcher("book.jsp").forward(request, response);
		} else {
			request.setAttribute("msg","The email address or passowrd that you've entered doesn't match any account.");
			request.getRequestDispatcher("adminlogin.jsp").forward(request, response);
		}
	}

}
