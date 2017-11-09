<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%@ page import="java.sql.*" %>
 <%@ page import="javax.sql.*" %>
 <%
 String username = request.getParameter("username");
 session.putValue("username",username);
 String password = request.getParameter("password");
 String email = request.getParameter("email");
 Class.forName("com.mysql.jdbc.Driver");
 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration?autoReconnect=true&useSSL=false","root","cs157a");
 Statement stmt = connect.createStatement();
 				
 ResultSet rs;
 
 int i = stmt.executeUpdate("insert into users values (NULL,'"+username+"','"+password+"','"+email+"')");
  
 //out.println("Registered");
 %>
 
 <div class="header">
		<h1>Registered</h1>
	</div>
</body>
</html>
