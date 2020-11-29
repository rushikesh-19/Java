	package com.loginlogout.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginRegister")
public class LoginRegister extends HttpServlet {
	private static final long serialVersionUID = 2068906835894702965L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try
		{
		String user = "root";
		String pwd = "rishimax";
		String connUrl = "jdbc:mysql://localhost:3306/mybook";
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		UserDAO userdao= new UserDAO();
		
		String user_name = request.getParameter("user_name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String contact = request.getParameter("contact");
		String address = request.getParameter("address");
		String security_question = request.getParameter("security_question");
		String security_answer = request.getParameter("security_answer");
		String submitType = request.getParameter("submit");
		
		User dao = userdao.getCustomer(email, password);
		
		if (submitType.equals("login") && dao!= null && dao.getUser_name()!= null) {
			HttpSession session = request.getSession();
		
			session.setAttribute("user_id", dao.getUserid());
			
			response.sendRedirect("dashboard.jsp");
	
		} else if (submitType.equals("Continue")) {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(connUrl, user, pwd);
			String query = "select user_id from user";
			stmt = con.createStatement();
			rs = stmt.executeQuery(query); 
			int uid = 0;
			while(rs.next())
			{
				 uid=rs.getInt("user_id");
			}
			uid++;
			dao.setUserid(uid);
			dao.setUser_name(user_name);
			dao.setEmail(email);
			dao.setPassword(password);
			dao.setContact(contact);
			dao.setAddress(address);
			dao.setSecurity_question(security_question);
			dao.setSecurity_answer(security_answer);;
			userdao.insertCustomer(dao);
			
			stmt.close();
			con.close();
			response.sendRedirect("login.jsp");
		} else {
			
			request.setAttribute("msg","The email address or passowrd that you've entered doesn't match any account.Sign up for now!!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}catch(Exception e) {System.out.println(e);}
}
}