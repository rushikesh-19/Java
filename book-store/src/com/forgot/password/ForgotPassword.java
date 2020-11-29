package com.forgot.password;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
		ForgotDao forgotdao= new ForgotDao();
		
		String email = request.getParameter("email");
		String security_question = request.getParameter("security_question");
		String security_answer = request.getParameter("security_answer");
		
		
		
		Forgot dao = forgotdao.getCustomer(email,security_question,security_answer);
		
		if (dao!= null && dao.getEmail()!= null) {
			
			HttpSession session = request.getSession();
		
			session.setAttribute("user_id", dao.getUser_id());
			
			response.sendRedirect("displaypassword.jsp");
	
		} else {
			
			request.setAttribute("pass","Something went wrong.Sign up for now!!");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}catch(Exception e) {System.out.println(e);}
	}

}
