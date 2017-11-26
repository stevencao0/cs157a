<%@page import="sun.security.x509.RDN"%>
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
 String username = request.getParameter("username"); // get username input from login.html
 session.putValue("username",username); // puts the input in a string called 'username'
 String password = request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/TheMusicVault?autoReconnect=true&useSSL=false","root","cs157a");
PreparedStatement stmt = connect.prepareStatement("select * from users where username=? and password=?");
stmt.setString(1,username); // first ?, username =?
stmt.setString(2,password); // second ?, password =?
ResultSet rs= stmt.executeQuery(); // executes the query/statement stmt to SQL

 if(rs.next()) // looks through database based on the query (looks for matching username/password)
 {
 	RequestDispatcher rd = request.getRequestDispatcher("successTest.jsp");
 	rd.forward(request, response); // forwards us to the next page if success
 }
 else // Failed if account/password not found/match
 {
	%>
	  <script>	<!-- Could probably have something better than this, but it does the job--> 
	  alert("Invalid Username Or Password") <!-- Pop up message -->
	  location="login.html"  <!-- sends to login.html page (otherwise it would be blank page w/ pop up) --> 
	  </script>
	<%
 }
  %>
</body>
</html>
