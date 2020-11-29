package com.admin.side;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Contactus")
public class Contactus extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_name = request.getParameter("user_name");
		String email = request.getParameter("email");
		String contact = request.getParameter("contact");
		String message = request.getParameter("message");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybook", "root", "rishimax");
			String query = "insert into contactus(user_name,email,contact,message) values(?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1,user_name);
			ps.setString(2, email);
			ps.setString(3,contact);
			ps.setString(4, message);
			ps.executeUpdate();
				request.setAttribute("contact","Your message sent successfully");
				request.getRequestDispatcher("contactus.jsp").forward(request, response);
				
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
