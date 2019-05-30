<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<font face="Tw Cen MT" color="1234">
<center>
</style>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
	try {
		String login = request.getParameter("LoginID");
		String pass = request.getParameter("password");
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stockanalyser", "root", "2513218");
		PreparedStatement pst = conn.prepareStatement("Select empID,password from emp where empID='"+login+"' and password='"+pass+"'");
		ResultSet rs = pst.executeQuery();
		if (rs.next())
		{
			session.setAttribute("userid",login);
			    %>
			    <jsp:forward page="user.jsp"></jsp:forward>
			    <%
		}
		else
		{
			out.println("<script type='text/javascript'>window.alert('Employee ID or password invalid');window.location.href='Login.html';</script>");
		}
	} catch (Exception e) {
		out.println("Something went wrong !! Please try again");
	}
%>

</center>
</font>
</body>
</html>