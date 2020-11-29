package net.healthcare.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ContactUs
 */
@WebServlet("/ContactUs")
public class ContactUs extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String query = request.getParameter("query");
		
		System.out.println(name);
		System.out.println(email);
		System.out.println(phone);
		System.out.println(query);
		Connection con = null;
		PreparedStatement ps = null;
		String user = "root";
		String pwd = "root";
		String connUrl = "jdbc:mysql://localhost:3306/healthcare";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			String contactUs = "insert into contact (name, email, phone, query, enquiryStatus) values(?,?,?,?,?)";
			ps = con.prepareStatement(contactUs);
			
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, phone);
			ps.setString(4, query);
			ps.setBoolean(5, false);
			ps.executeUpdate();
			
			ps.close();
			con.close();
			System.out.println("Query submitted successully......");
			response.sendRedirect("contactUs.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}