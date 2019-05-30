<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Item List</title>
</head>
<body onload="history.forward(1)">
	<ul class="sidenav">
		<li><a href="itemAdd.jsp">add item</a></li>
		<li><a class="active" href="itemlist.jsp">list items</a></li>
		<li><a href="itemDelete.jsp">Delete items</a></li>
		<li><a href="stock.jsp">Stock report</a></li>
		<li><a href="user.jsp">Back</a></li>
		<li class="logout"><a href="Logout.jsp">Logout</a></li>
	</ul>

	<div class="content">
			<font face="Tw Cen MT" color="1234">
			<center>
		<%
		String admin = (String)session.getAttribute("userid");
		if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
	%>
	You are not logged in<br /> <a href="Login.html">Please Login</a>
	<%
		} 
	else {
			Connection con1 = null;
			Statement st = null;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/stockanalyser", "root", "2513218");
				st = con1.createStatement();
				ResultSet rs = st.executeQuery("Select * from item");
		%>

				<h2 align="center">
					<u>Item List</u>
				</h2>
				<table cellpadding="15">
					<tr>
						<th>ItemID</th>
						<th>ItemName</th>
						<th>ItemDetails</th>
					</tr>
					<%
						while (rs.next()) {
					%>
					<tr>
						<td>
							<%
								out.println(rs.getString("itemID"));
							%>
						</td>
						<td>
							<%
								out.println(rs.getString("itemName"));
							%>
						</td>
						<td>
							<%
								out.println(rs.getString("itemDetails"));
							%>
						</td>
					</tr>
					<%
						}

						} catch (Exception e) {
							System.out.print(e);
							e.printStackTrace();
						}
	}
					%>
				</table>
			</center>
		</font>
	</div>
</body>
<style>
th, td {
	border-bottom: 1px solid #ddd;
	text-align: left;
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

@media screen and (max-width: 400px) {
	ul.sidenav li a {
		text-align: center;
		float: none;
	}
}

footer {
	position: fixed;
	bottom: 0;
	color: white;
	margin-left: 43%;
}
</style>
<footer> <small>&copy; Copyright 2017, Stock Analyser
	NEC</small> </footer>
</html>