<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<title>DeleteQuries-BookWorld</title>
</head>
<body>

<%
String contact_id = request.getParameter("contact_id");
%>

<%
try
{

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybook", "root", "rishimax");
	Statement stmt = con.createStatement();
	String query = "delete from contactus where  contact_id='"+contact_id+"'";
	stmt.executeUpdate(query);
	
	stmt.close();
	con.close();
	
	response.sendRedirect("viewcontactus.jsp");
}catch (Exception e) {e.printStackTrace();}
%>

</body>
</html>