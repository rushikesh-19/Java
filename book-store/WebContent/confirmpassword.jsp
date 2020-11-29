<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%!
Connection con = null;
Statement stmt = null;
ResultSet rs = null;
%>

<%
String currentpassword=request.getParameter("currentpassword");
String newpassword=request.getParameter("newpassword");
String confirmpassword=request.getParameter("confirmpassword");

String password="";
int user_id = (int) session.getAttribute("user_id");
%>

<%
try {

	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybook", "root", "rishimax");
	stmt = con.createStatement();
	
	String query = "select password from user where user_id='"+user_id+"'";
	rs = stmt.executeQuery(query);
	while(rs.next())
	{
	password=rs.getString("password");
	}	
	if(newpassword.equals(confirmpassword))
	{
	if(password.equals(currentpassword)){
	stmt.executeUpdate("update user set password='"+newpassword+"' where user_id='"+user_id+"'");
	}
	else{
		request.setAttribute("currentpasswordmsg","The current passowrd that you've entered doesn't match please enter current password correclty.");
		request.getRequestDispatcher("changepassword.jsp").forward(request, response);
	}
	}
	else{
		request.setAttribute("newpasswordmsg","Please enter both password same or correctly.");
		request.getRequestDispatcher("changepassword.jsp").forward(request, response);
	}
	stmt.close();
	con.close();
	request.setAttribute("successpasswordmsg","The new password set successfully!!!");
	request.getRequestDispatcher("myprofile.jsp").forward(request, response);
} catch (Exception e) {e.printStackTrace();
}
%>
</body>
</html>