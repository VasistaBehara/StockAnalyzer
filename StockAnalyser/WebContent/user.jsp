<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stock Analyzer</title>
<script language="JavaScript" type="text/javascript">
	window.history.forward();
</script>
</head>
<body onload="history.forward(1)">
		<div class="content">
			<center><strong style="font-size:32px">
				<%
				String admin = (String)session.getAttribute("userid");
					if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
				%>
				You are not logged in<br /> <a href="Login.html">Please Login</a>
				<%
					} 
				else {
						try {
							Class.forName("com.mysql.jdbc.Driver");
							String s1 = (String) session.getAttribute("userid");
							Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stockanalyser", "root",
									"2513218");
							PreparedStatement pst = conn.prepareStatement("Select empName from emp where empID='" + s1 + "'");
							ResultSet rs = pst.executeQuery();
							if (rs.next()) {
								String s2 = rs.getString("empName");
								out.println("welcome  " + s2);
							}
						} catch (Exception e) {
							System.out.print(e);
							e.printStackTrace();
						}
				%>
</strong>
				<h2>
					<u>Manage</u>
				</h2>
			</center>
			<table align="center">
				<tr>
					<td><a href="godownAdd.jsp"><button>Godown</button></a></td>
					<td><a href="userView.jsp"><button>User</button></a></td>
				</tr>
				<tr>
					<td><a href="itemAdd.jsp"><button>Item</button></a></td>
					<td><a href="customerAdd.jsp"><button>Customer</button></a></td>
				</tr>
				<tr>
					<td><a href="supplierAdd.jsp"><button>Supplier</button></a></td>
					<td><a href="inwardsAdd.jsp"><button>Inwards</button></a></td>
				</tr>
				<tr>
					<td><a href="deliveriesAdd.jsp"><button>Deliveries</button></a></td>
					<td><a href="returnsAdd.jsp"><button>Returns</button></a></td>
				</tr>
			</table>
			<center>
				<a href="Logout.jsp"><button>Logout</button></a>
			</center>
		</div>
		<%} %>
</body>
<style>

button {
	background-color: #008080;
	border: 2px solid #008080;
	color: white;
	padding: 30px 32px;
	text-align: center;
	border-radius: 70%;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
}

button:hover {
	background-color: Transparent;
	color: black;
}

body {
	margin: 0;
	background-image:
		url("images/yellow-gold-scratched-paint-wall-background.jpg");
	background-size: cover;
	width: 100%;
	height: 400px;
}

td {
	width: 70%;
	padding: 14px 20px;
	margin: 0;
	border: none;
	border-radius: 4px;
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