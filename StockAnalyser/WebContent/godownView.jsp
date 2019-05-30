<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>godown View</title>
</head>
<body onload="history.forward(1)">
	<ul class="sidenav">
		<li><a href="godownAdd.jsp">godown add</a></li>
		<li><a href="godownlist.jsp">List Godown</a></li>
		<li><a class="active" href="godownView.jsp">View Godown</a></li>
		<li><a href="godownDelete.jsp">Delete Godown</a>
		<li><a href="user.jsp">Back</a></li>
		<li class="logout"><a href="Logout.jsp">Logout</a></li>
	</ul>
	<div class="content">
		<font face="Tw Cen MT" color="1234">
			<center>
				
			</center>
			<form align="center" action="godownView.jsp">
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
						ResultSet rs = st.executeQuery("Select godownID from godown");
				%>
				<h1 align="center">
					<u>View Godown Details</u>
				</h1>
				<select name="godownID">
					<option>select godown</option>
					<%
						while (rs.next()) {
								String godownID = rs.getString("godownID");
					%>
					<option value=<%out.println(godownID);%>>
						<%
							out.println(godownID);
						%>
					</option>
					<%
						}
					%>
				</select>
				<%
					} catch (Exception e) {
						System.out.print(e);
						e.printStackTrace();
					}
				%>
				<input type="submit" value="get details" />
			</form>
		</font>

		<%
			String godownID = request.getParameter("godownID");
			Connection con = null;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stockanalyser", "root", "2513218");
				st = con.createStatement();
				ResultSet rs = st.executeQuery("Select * from godown where godownID='" + godownID + "'");
				if (rs.next()) {
		%>
		<font face="Tw Cen MT" color="1234">
			<center>
				<h2 align="center">
					Godown ID :
					<%
					out.println(rs.getString("godownID"));
				%>
				</h2>
				<table border="0" cellpadding="10">
					<tr>
						<th>Location</th>
						<td>
							<%
								out.println(rs.getString("GLocation"));
							%>
						</td>
					</tr>
					<tr>
						<th>Manager</th>
						<td>
							<%
								out.println(rs.getString("GManager"));
							%>
						</td>
					</tr>
					<tr>
						<th>Starting Date</th>
						<td>
							<%
								out.println(rs.getString("GSDate"));
							%>
						</td>
					</tr>
					<tr>
						<th>Capacity(Quintals)</th>
						<td>
							<%
								out.println(rs.getString("GCapacity"));
							%>
						</td>
					</tr>
					<tr>
						<th>Stock(Quintals)</th>
						<td>
							<%
								out.println(rs.getString("GStock"));
							%>
						</td>
					</tr>
				</table>
			</center>
		</font>
</body>
<%
	}
	} catch (Exception e) {
		System.out.print(e);
		e.printStackTrace();
	}
			}
%>
<style>
form {
	width: 300px;
	margin: 0 auto;
	padding: 10px;
}

input[type=text], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 45%;
	background-color: #333;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #111;
}

td {
	text-align: left;
	width: 50%;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

th, td {
	border-bottom: 1px solid #ddd;
	text-align: left;
}

td:hover {
	background-color: #f5f5f5
}

th:hover {
	background-color: #f5f5f5
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
       bottom:0; 
       color: white;
       margin-left: 3%;
 }
</style>
<footer>
 <small>&copy; Copyright 2017, Stock Analyser NEC</small>
</footer>
</html>