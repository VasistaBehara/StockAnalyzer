<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Stock Analyser</title>
</head>
<body>
	<ul class="topnav">
		<li><a class="active" href="index.jsp">Home</a></li>
		<li><a href="Login.html">Login</a></li>
		<li><a href="Register.jsp">Register</a></li>
		<li><a href="about.jsp">About</a></li>

	</ul>
	<br>
	<br>
	<h3>Stock Analyzer is an online software application which
		fulfills therequirement of a typical Stock Analysis in various
		godowns. It provides the interface to users in agraphical way to
		manage the daily transactions as well as historical data. Also
		provides the managementreports like monthly inwards, monthly
		deliveries and monthly returns.</h3>
	<br>
	<img src="images/Stockanalysys.jpg" alt="">
	
</body>
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