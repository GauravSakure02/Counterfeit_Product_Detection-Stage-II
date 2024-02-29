<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.user.*"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
	<title>Blockchain</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/css?family=Encode+Sans+Expanded:400,600,700" rel="stylesheet">
	<link href="plugin-frameworks/bootstrap.css" rel="stylesheet">
	<link href="fonts/ionicons.css" rel="stylesheet">
	<link href="common/styles.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="demo.css" />
</head>
<body>
	<%
	if(request.getParameter("Done")!=null)
	{
	out.println("<script>alert('Product Save Successfully ...!')</script>");	
	}
	if(request.getParameter("invalid")!=null)
	{
	out.println("<script>alert('Invalid Login Credential ...!')</script>");	
	}
	if(request.getParameter("Unable")!=null)
	{
	out.println("<script>alert('Unable Product scan ...!')</script>");	
	}
	if(request.getParameter("Fake")!=null)
	{
	out.println("<script>alert('Fake Product scan ...!')</script>");	
	}
   %>
	<header>		
		<div class="container">
			<a class="logo" href="#"><jsp:include page="titlepage.jsp"></jsp:include></a>
			<a class="menu-nav-icon" data-menu="#main-menu" href="#"><i class="ion-navicon"></i></a>
			<ul class="main-menu" id="main-menu">
				<jsp:include page="distmenu.jsp"></jsp:include>
			</ul>
			<div class="clearfix"></div>
		</div>
	</header>

	<section class="ptb-0">
	<div class="mb-30 brdr-ash-1 opacty-5"></div>
		<div class="container"><br><br><br>
		 <div class="row">
		  <div class="col-sm-12 col-md-8">
			<div class="row">
				<table align="center">
					<tr>
						<td><img src="img/admin.jpg" width="10" height="240">
					</tr>
					<tr>
						<td colspan="2"><b>QR Code(by Best Distribute)</b></td>
					</tr>
            	</table>	
            		<%
			            String emailid=(String)session.getAttribute("Cuserid");
			        %>		
		
						<form class="post_section" action="QRCodeupload" method="post" enctype="multipart/form-data">
							<table align="center" border="0"  cellpadding="5" cellspacing="5">
								<tr>
									<td colspan="2"><div class="cleaner" style="height: 20%">&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
								</tr>
								
								<tr>
									<td><b>Email_ID:</b></td>
									<td><input type="text" name="Marksheet_No" placeholder="mymail@mail.com" value="<%=emailid%>" style="width: 90%" required /></td>
								</tr>
								<tr>
									<td colspan="2"><div class="cleaner" style="height: 10%"></div></td>
								</tr>
								<tr>
									<td><b>Upload QR Code:</b></td>
									<td><input type="file" name="qrcodefile" placeholder="Select Document" required /></td>
								</tr>
								<tr>
									<td colspan="2"><div class="cleaner" style="height: 10%"></div></td>
								</tr>
								<tr>
							     	<td colspan="2" align="center"><input type="submit" value="Update" style="background: yellow;color: black;" class="button"/></td>
				    			</tr>
							</table>
						</form>	
					</div>
				</div>
				
				<!-- <div class="col-sm-12 col-md-4">
					<img src="images/M2.jpg" alt="">
				</div> -->
			</div>
		</div>
	</section><br><br><br><br><br><br>
	
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