<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>supplier Add</title>
</head>
<body bgcolor="#008B8B">
	<ul class="sidenav">
		<li><a class="active" href="supplierAdd.jsp">Add Supplier</a></li>
		<li><a href="supplierlist.jsp">List Supplier</a></li>
		<li><a href="supplierDelete.jsp">Delete Supplier</a></li>
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
Connection con1=null;
Statement st=null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/stockanalyser", "root", "2513218");
	st=con1.createStatement();
	ResultSet rs = st.executeQuery("Select itemID from item"); %>
	<h1 align="center" ><u>Add New Supplier</u></h1></center>
	<form align="center" action="supplierAdd.jsp">
		<input type="text" name="SID" placeholder="Enter Supplier ID" required/>
		<input type="text" name="SName" placeholder="Name of Supplier" required/>
		<select name="items">
		<option>select item</option>
		<%
		while(rs.next())
		{
			String itemID=rs.getString("itemID");
			%>
			<option value=<%out.println(itemID);%>><%out.println(itemID);%></option>
		<%
		}
}catch(Exception e){
	System.out.print(e);
	e.printStackTrace();
	}
		%>
		</select>
		<input type="submit" value="add supplier"/>
		<input type="reset" value="cancel"/>
	</form>
	</font>
	</div>
</body>
<center>
<%
String SID = request.getParameter("SID");
String SName = request.getParameter("SName");
String itemID=request.getParameter("items");
try {
Class.forName("com.mysql.jdbc.Driver");
con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/stockanalyser", "root", "2513218");
st=con1.createStatement();
String query="insert into supplier(SID,SName,itemID) values ('"+SID+"','"+SName+"','"+itemID+"')";
System.out.println(query);
int i=st.executeUpdate(query);
out.println("Successfully Registered your details");
}
catch(Exception e){
System.out.print(e);
e.printStackTrace();
}
		}
%>
</center>
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
textArea {
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
footer {
       position: fixed;
       bottom:0; 
       color: white;
       margin-left: 33%;
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
	
</style>
<footer>
 <small>&copy; Copyright 2017, Stock Analyser NEC</small>
</footer>
</html>