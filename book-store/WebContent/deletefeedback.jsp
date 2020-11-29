<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<!DOCTYPE html>
<html>
<head>
<title>DeleteFeedback-BookWorld</title>
</head>
<body>

<% 
String feedback_id = request.getParameter("feedback_id");
%>

<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybook", "root", "rishimax");
	Statement stmt = con.createStatement();
	String query = "delete from feedback where feedback_id='"+feedback_id+"'";
	stmt.executeUpdate(query);
	
	stmt.close();
	con.close();
	response.sendRedirect("viewfeedback.jsp");
} catch (Exception e) {e.printStackTrace();}
%>

</body>
</html>