<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Delete</title>
</head>
<body onload="history.forward(1)">
	<ul class="sidenav">
		<li><a href="customerAdd.jsp">Add Customer</a></li>
		<li><a href="customerlist.jsp">List Customer</a></li>
		<li><a class="active" href="customerDelete.jsp">Delete
				Customer</a></li>
		<li><a href="user.jsp">Back</a></li>
		<li class="logout"><a href="Logout.jsp">Logout</a></li>
	</ul>
	<div class="content">
		<center>
			<font face="Tw Cen MT" color="1234"> <%
					String admin = (String)session.getAttribute("userid");
						if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
					%>
					You are not logged in<br /> <a href="Login.html">Please Login</a>
					<%
						} 
						else if(!admin.substring(0,1).equals("9")) {
							%>
							You are  not Admin<br /> <a href="Login.html">Please Login as Admin to access this page</a>
							<%	
						}
					else {
 	Connection con1 = null;
 	Statement st = null;
 	try {
 		Class.forName("com.mysql.jdbc.Driver");
 		con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/stockanalyser", "root", "2513218");
 		st = con1.createStatement();
 		ResultSet rs = st.executeQuery("Select CName from customer");
 %>

				<h1 align="center">
					<u>Delete Customer</u>
				</h1>
				<form align="center" action="customerDelete.jsp">
					<select name="customers">
						<option>select customer</option>
						<%
							while (rs.next()) {
									String CName = rs.getString("CName");
						%>
						<option value=<%out.println(CName);%>>
							<%
								out.println(CName);
							%>
						</option>
						<%
							}
						%>
					</select> <br> <input type="submit" value="delete" />
				</form> <%--// --%> <%
 	} catch (Exception e) {
 		System.out.print(e);
 		e.printStackTrace();
 	}
 	String CName = request.getParameter("customers");
 	try {
 		Class.forName("com.mysql.jdbc.Driver");
 		con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/stockanalyser", "root", "2513218");
 		st = con1.createStatement();
 		String query = "delete from customer where CName='" + CName + "'";
 		System.out.println(query);
 		int i = st.executeUpdate(query);
 		if (i > 0)
 			out.println("Successfully deleted customer from database");
 		else
 			out.println("");
 	} catch (Exception e) {
 		System.out.print(e);
 		e.printStackTrace();
 	}
					}
 %>
			</font>
		</center>
	</div>
</body>
<style>
input[type=submit], select {
	width: 300px;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 100px;
	background-color: #333;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

body {
	margin: 0;
	background-image:
		url("images/yellow-gold-scratched-paint-wall-background.jpg");
	background-size: cover;
	width: 100%;
	height: 400px;
}

ul.sidenav {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 10%;
	background-color: #333;
	position: fixed;
	height: 100%;
	overflow: hidden;
}

ul.sidenav li a {
	display: block;
	color: #fff;
	padding: 14px 16px;
	text-decoration: none;
}

ul.sidenav li a.active {
	background-color: #4CAF50;
	color: white;
}

ul.sidenav li a:hover {
	background-color: #111;
}

div.content {
	margin-left: 10%;
	padding: 1px 16px;
}

@media screen and (max-width: 1050px) {
	ul.sidenav {
		width: 100%;
		height: auto;
		position: relative;
	}
	ul.sidenav li a {
		float: left;
		padding: 15px;
	}
	div.content {
		margin-left: 0;
	}
}
footer {
       position: fixed;
       bottom:0; 
       color: white;
       margin-left: 43%;
 }
</style>
<footer>
 <small>&copy; Copyright 2017, Stock Analyser NEC</small>
</footer>
</html>