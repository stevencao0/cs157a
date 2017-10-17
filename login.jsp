<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>login-jsp</title>
</head>
<body>
 <%@ page import="java.sql.*" %>
 <%@ page import="javax.sql.*" %>
 <%
 String username = request.getParameter("username");
 session.putValue("username",username);
 String password = request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration?autoReconnect=true&useSSL=false","admin","cs157a");
Statement stmt = connect.createStatement();
				
ResultSet rs= stmt.executeQuery("select * from users where username='"+username+"'"); // input for mysql command
 
 if(rs.next())
 {
 	if(rs.getString(2).equals(password))
 	{
 	out.println("Welcome "+username);
 	}
 	else
 	{
 	out.println("Invalid password");
	}
 }
  %>
</body>
</html>
