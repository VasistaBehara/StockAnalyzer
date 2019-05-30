<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>return Add </title>
</head>
<body onload="history.forward(1)">
<ul class="sidenav">
		<li><a class="active" href="retuensAdd.jsp">Add Returns</a></li>
		<li><a href="returnsReport.jsp">Returns Report</a></li>
		<li><a href="user.jsp">Back</a></li>
		<li class="logout"><a href="Logout.jsp">Logout</a></li>
	</ul>
	<div class="content">
<font face="Tw Cen MT" color="1234">
<center>
	<form align="center" action="returnsAdd.jsp">
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
	ResultSet rs = st.executeQuery("Select godownID from godown"); %>
	<h1 align="center" ><u>Add New return</u></h1>
		<select name="godown">
		<option>select godown</option>
		<%
		while(rs.next())
		{
			String godownID=rs.getString("godownID");
			%>
			<option value=<%out.println(godownID);%>><%out.println(godownID);%></option>
		<%
		}
		%>
		</select>		
		<% 
		rs = st.executeQuery("Select CID from customer"); %>
		<select name="customer">
		<option>select customer</option>
		<%
		while(rs.next())
		{
			String CID=rs.getString("CID");
			%>
			<option value=<%out.println(CID);%>><%out.println(CID);%></option>				
		<% 
		}%>
		</select>		
		<%
		rs = st.executeQuery("Select itemID from item");%>
		<select name="item">
		<option>select item</option>
		<%
		while(rs.next())
		{
			String itemID=rs.getString("itemID");
			%>
			<option value=<%out.println(itemID);%>><%out.println(itemID);%></option>
		<%
		}
		%>
		</select>
		Date of Delivery <input type="date" name="dateOfDelivery" required/>
		<input type="text" name="quantity" placeholder="Enter quantity of stock" required/>
		Date of Return<input type="date" name="dateOfReturn" required/>
		<select name="purpose">
		<option>select an option</option>
		<option value="orderCanceled">orderCanceled</option>
		<option value="damage">Damage</option>
		<option value="others">others</option>
		</select>
		<input type="text" name="receiptNo" placeholder="Enter the receipt number" required/>		
		<input type="text" name="bill" placeholder="bill" required/>
		<% 
		rs = st.executeQuery("Select empID from emp"); %>
		<select name="cemp">
		<option>select received employee</option>
		<%
		while(rs.next())
		{
			String empID=rs.getString("empID");
			%>
			<option value=<%out.println(empID);%>><%out.println(empID);%></option>				
		<% 
		}%>
		</select>
		<input type="text" name="invoice" placeholder="invoice" required/>
		<input type="submit" value="submit"/>
		<input type="reset" value="cancel"/>
	</form>
<%		
}
catch(Exception e){
	System.out.print(e);
	e.printStackTrace();
}
String godownID = request.getParameter("godown");
String CID = request.getParameter("customer");
String itemID=request.getParameter("item");
String dateOfDelivery=request.getParameter("dateOfDelivery");
String quantity=request.getParameter("quantity");
String dateOfReturn=request.getParameter("dateOfReturn");
String purpose=request.getParameter("purpose");
String receiptNo=request.getParameter("receiptNo");
String bill=request.getParameter("bill");
String CEmpID=request.getParameter("cemp");
String invoice=request.getParameter("invoice");
try {
Class.forName("com.mysql.jdbc.Driver");
con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/stockanalyser", "root", "2513218");
st=con1.createStatement();
String query="insert into returns(godownID,CID,itemID,dateOfDelivery,quantity,dateOfReturn,purpose,receiptNo,bill,CEmpID,invoice) values ('"+godownID+"','"+CID+"','"+itemID+"','"+dateOfDelivery+"','"+quantity+"','"+dateOfReturn+"','"+purpose+"','"+receiptNo+"','"+bill+"','"+CEmpID+"','"+invoice+"')";
System.out.println(query);
int i=st.executeUpdate(query);
Integer q2 = Integer.parseInt(quantity);
ResultSet rs = st.executeQuery("Select * from godown where godownID='" + godownID + "'");
if(rs.next())
{
Integer stock=rs.getInt("GStock");
stock=stock + q2;
String query2="update godown set GStock = '"+stock+"'";
System.out.println(query2);
int j=st.executeUpdate(query2);
out.println("Successfully Registered your details");
}
}
catch(Exception e){
System.out.print(e);
e.printStackTrace();
}
}
%>
</center>
</font>
</div>
</body>
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
input[type=date]{
    width: 60%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
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