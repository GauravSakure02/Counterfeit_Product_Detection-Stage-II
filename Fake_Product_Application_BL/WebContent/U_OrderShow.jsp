<%@ page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.user.*" %>
<%@page import="javax.sql.*" %>
<%@page import=" java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.math.BigInteger"%>
<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.awt.*" %>
<%@page import=" java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
	<title>BlockChain</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/css?family=Encode+Sans+Expanded:400,600,700" rel="stylesheet">
	<link href="plugin-frameworks/bootstrap.css" rel="stylesheet">
	<link href="fonts/ionicons.css" rel="stylesheet">
	<link href="common/styles.css" rel="stylesheet">
</head>
<body>
<%
	if(request.getParameter("Order")!=null)
	{
	out.println("<script>alert('Order Update Successfully...!')</script>");	
	}
   %>
	<header>		
		<div class="container">
			<a class="logo" href="#"><jsp:include page="titlepage.jsp"></jsp:include></a>
			<a class="menu-nav-icon" data-menu="#main-menu" href="#"><i class="ion-navicon"></i></a>
			<ul class="main-menu" id="main-menu">
				<li><a href="Home.jsp" class="current" >Home</a></li>
				<li><a href="U_OrderShow.jsp" >Order</a></li>
				<li><a href="U_QRCode_details.jsp">QRCode Upload</a></li>
				<li><a href="LoginPage.jsp?logout">Logout</a></li>
			</ul>
			<div class="clearfix"></div>
		</div>
	</header>

	<section class="ptb-0">
	<div class="mb-30 brdr-ash-1 opacty-5"></div>
		<div class="container">
		<h3 align="center"><b>View Information:</b></h3>
		 <div >
		  <div >
			<div>
			
				<div ><br>
				
					<table align="center" style="width: 100%;" class="displays" border="1" cellpadding="10" cellspacing="10"> 	
			<tr>
			<td><b>MedicineName:</b></td>
			<td><b>CompanyName</b></td>
		
			<td><b>MFGDate</b></td>
			<td><b>Price</b></td>
			<td><b>ExpiryDate</b></td>
			<td><b>Qty</b></td>
			<td><b>View</b></td>
			</tr>
			<%
					  try{
						  int i=1;
						  String query="select * from distribute_product_info";
						  Connection conn=DBconn.conn();
						  Statement stmt=conn.createStatement();
						  ResultSet rs=stmt.executeQuery(query);
					    	while(rs.next()){
					    	{
			%>
			
				
				
						
				<tr>
					
				
					<td><%=rs.getString(2) %></td> 
				
					<td><%=rs.getString(3) %></td> 
				
					
				
					<td><%=rs.getString(5) %></td>
				
					<td><%=rs.getString(6) %></td>
				
					<td><%=rs.getString(7) %></td>
					<td><%=rs.getString(8) %></td>
					
					<td> <a href="U_DataShow.jsp?id=<%=rs.getString(1)%>" style="background: yellow;color: black;" class="button">Order</a> 
					
						</tr>	   
				<%}
					i++;	
				} %>
				<% 
					}
					catch (Exception e) {
					 e.printStackTrace();
				}%>	           
    			</table>
				</div>
			</div>
		</div>
			</div>
				</div>
	</section>
	<br><br><br><br><br><br>
	
	<footer class="bg-191 color-ccc">
			<div class="brdr-ash-1 opacty-2"></div>
			<div class="oflow-hidden color-ash font-9 text-sm-center ptb-sm-5"><br>
			<p class="color-ash">
				Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ion-heart" aria-hidden="true"></i> by <a href="#" target="_blank">Digital Certificate on Blockchain</a>
			</p><br>
			</div>
	</footer>
	<script src="plugin-frameworks/jquery-3.2.1.min.js"></script>	
	<script src="plugin-frameworks/tether.min.js"></script>	
	<script src="plugin-frameworks/bootstrap.js"></script>	
	<script src="common/scripts.js"></script>	
</body>
</html>