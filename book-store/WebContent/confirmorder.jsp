<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<title>ConfirmOrder-BookWorld</title>
</head>
<body>

<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");// HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setHeader("Expires","0"); // Proxis
if(session.getAttribute("user_id")==null) 
response.sendRedirect("login.jsp");
%>

<%
String user_id =request.getParameter("user_id");
String user_name = request.getParameter("user_name");
String book_name = request.getParameter("book_name");
String book_author = request.getParameter("book_author");
String book_isbn = request.getParameter("book_isbn");
String book_price = request.getParameter("book_price");
String contact = request.getParameter("contact");
String address = request.getParameter("address");
%>

<%!
Connection con = null;
PreparedStatement ps = null;
%>

<%
try
{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybook","root","rishimax");
ps = con.prepareStatement("insert into saveorder(user_name,book_name,book_author,book_isbn,book_price,contact,address,user_id) values(?,?,?,?,?,?,?,?)");

ps.setString(1,user_name);
ps.setString(2,book_name);
ps.setString(3,book_author);
ps.setString(4,book_isbn);
ps.setString(5,book_price);
ps.setString(6,contact);
ps.setString(7,address);
ps.setString(8,user_id);

ps.executeUpdate();
ps.close();
con.close();

response.sendRedirect("dashboard.jsp");
}catch(Exception e){System.out.println(e);}
%>

</body>
</html>