<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>

</head>

<body>
	<ul class="topnav">
		<li><a href="index.jsp">Home</a></li>
		<li><a href="Login.html">Login</a></li>
		<li><a class="active" href="Register.jsp">Register</a></li>
		<li><a href="about.jsp">About</a></li>
	</ul>
	<div class="content">
		<font face="Tw Cen MT" color="1234"><center>
				<h1>Register Here</h1>
			</center>
			<form align="center" action="Register.jsp">
				<input type="text" name="empID" pattern="[1-9][0-9]{4}" title="5 Digit employee ID" placeholder="Enter your employee ID" required /><br>
				 <input type="text" name="empName" pattern="[A-Za-z].{3,}" title="atleast 3 letters" placeholder="Enter your Full Name" /><br> 
					Gender: <input
					type="radio" name="gender" value="male" checked> Male <input
					type="radio" name="gender" value="female"> Female<br>
				<select name="JLocation">
					<option>Select your Job Location</option>
					<option value="hyd">hyd</option>
					<option value="mumbai">mumbai</option>
					<option value="delhi">delhi</option>
					<option value="chennai">chennai</option>
					<option value="banglore">banglore</option>
				</select><br> Join Date : <input type="date" name="JDate" /><br> 
				<select
					name="role" required>
					<option>Select your Role</option>
					<option value="manager">manager</option>
					<option value="clerk">clerk</option>
					<option value="accountant">accountant</option>
					<option value="security">security</option>
					<option value="other">Other</option>
				</select><br>
					<input type="password" name="password" id="passsword" pattern=".{5,}" title="atleast 5 characters"	placeholder="Enter Password" required />
					<input	type="password" name="rpassword" id="rpassword" pattern=".{5,}" title="atleast 5 characters" placeholder="Re Enter Password" onkeyup="validatePassword()" required /><br>
					<input type="submit" name="register" value="Register" /> <input type="reset" value="cancel" />
			</form>
			<style>
body {
	margin: 0;
	background-image:
		url("images/yellow-gold-scratched-paint-wall-background.jpg");
	background-size: cover;
	width: 100%;
	height: 400px;
}

img {
	opacity: 0.5;
	filter: alpha(opacity = 50);
	display: block;
	margin: auto;
	border-radius: 8px;
	max-width: 100%;
	height: auto;
}

img:hover {
	opacity: 1.0;
	filter: alpha(opacity = 100);
}

ul.topnav {
	position: fixed;
	top: 0;
	width: 100%;
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

ul.topnav li {
	float: left;
}

ul.topnav li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

ul.topnav li a:hover {
	background-color: #111;
}

ul.topnav li a.active {
	background-color: #4CAF50;
}

div.content {
	margin-top: 5%;
	padding: 1px 10px;
	height: auto;
}

form {
	border-radius: 8px;
	width: 300px;
	margin: 0 auto;
	background-color: #F3F3DE;
	padding: 10px;
}

input[type=date] {
	width: 70%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
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

input[type=password], select {
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

input[type=reset] {
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

input[type=reset]:hover {
	background-color: #111;
}
footer {
       position: fixed;
       bottom:0; 
       color: white;
       margin-left: 43%;
 }
</style>

			<center>
				<%@page language="java" contentType="text/html; charset=ISO-8859-1"
					pageEncoding="ISO-8859-1"%>
				<%@page import="java.sql.*,java.util.*"%>
				<%
					String empID = request.getParameter("empID");
					String empName = request.getParameter("empName");
					String gender = request.getParameter("gender");
					String JLocation = request.getParameter("JLocation");
					String role = request.getParameter("role");
					String password = request.getParameter("password");
					try {
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stockanalyser", "root",
								"2513218");
						Statement st = con.createStatement();
						String query = "insert into emp(empID,empName,gender,JLocation,role,password) values ('" + empID + "','"
								+ empName + "','" + gender + "','" + JLocation + "','" + role + "','" + password + "')";
						System.out.println(query);
						int i = st.executeUpdate(query);
						out.println("Successfully Registered your details");
				%>
				<a href="Login.html">Login here...</a>
				<%
					} catch (Exception e) {
						System.out.print(e);
						e.printStackTrace();
					}
				%>
			</center> </font>
	</div>
	<script type="text/javascript">
function mouseoverPass(obj) {
	  var obj = document.getElementById('Password');
	  obj.type = "text";
	}
	function mouseoutPass(obj) {
	  var obj = document.getElementById('Password');
	  obj.type = "password";
	}
</script>
</body>
<footer>
 <small>&copy; Copyright 2017, Stock Analyser NEC</small>
</footer>
</html>