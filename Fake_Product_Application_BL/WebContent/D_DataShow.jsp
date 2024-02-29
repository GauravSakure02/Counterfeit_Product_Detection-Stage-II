<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<%@ page import="java.sql.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.user.*"%>
<%@page import="java.sql.Connection"%>
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
	<link rel="stylesheet" type="text/css" href="demo.css" />
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
    	$('#examples').DataTable( {
        "pagingType": "full_numbers"
	    } );
	} );
</script>
</head>
<body>
	<%
	if(request.getParameter("Update")!=null)
	{
	out.println("<script>alert('Status Update Successfully...!')</script>");	
	}
   %>
	<header>		
		<div class="container">
			<a class="logo" href="#"><jsp:include page="titlepage.jsp"></jsp:include></a>
			<a class="menu-nav-icon" data-menu="#main-menu" href="#"><i class="ion-navicon"></i></a>
			<ul class="main-menu" id="main-menu">
				<li><a href="CHome.jsp" class="current" >Home</a></li>
				<li><a href="OrderShow.jsp" >Order</a></li>
				<li><a href="QRCode_details.jsp">QRCode Upload</a></li>
				<li><a href="U_DistributeDataShow.jsp" class="current-demo">User Data Show</a></li>
				<li><a href="Distribute_UserPayBillDataShow.jsp" class="current-demo">Pay Bill Data Show</a></li>
				<li><a href="LoginPage.jsp?logout">Logout</a></li>
			</ul>
			<div class="clearfix"></div>
		</div>
	</header>

	<section class="ptb-0">
	<div class="mb-30 brdr-ash-1 opacty-5"></div>
		<div class="container">
		 <div class="row">
		  <div class="col-sm-12 col-md-8">
			<div class="row">			
			<%
					  try{
						  String mid=request.getParameter("id");
						  System.out.println(mid);
						  int i=1;
						  String query="select * from product_info where MID='"+mid+"'";
						  Connection conn=DBconn.conn();
						  Statement stmt=conn.createStatement();
						  ResultSet rs=stmt.executeQuery(query);
					    	if(rs.next()){
					    	{
			%>
			
			<h2><img src="images/M1.jpg" alt=""></h2>
				
			</div>
				</div>
				
				<div class="col-sm-12 col-md-4"><br>
				<h3 align="center"><b>View Information:</b></h3>
					<form action="distributeorder" method="post" class="form-block form-bold form-mb-20 form-h-35 form-brdr-b-grey pr-50 pr-sm-0">
			
					<table  class="displays" border="5" cellpadding="10" cellspacing="10">  	
				<tr>
					
					<td colspan="2"><input type="hidden" name="id" value=<%=mid %> readonly="readonly" /></td>
				</tr>
				<tr>
					
					<td><input type="hidden" name="product_No" value=<%=rs.getString(9) %> readonly="readonly"/></td>
				</tr>
				<tr>
					<td><b>ProductName:</b></td>
					<td><%=rs.getString(2) %></td>
				</tr>
				<tr>
					<td><b>CompanyName</b></td>
					<td><%=rs.getString(3) %></td> 
				</tr>
				<tr>
					<td><b>Qty</b></td>
					<td><%=rs.getString(8) %></td> 
				</tr>
				<tr>
					<td><b>Order Qty</b></td>
					 <td><input type="text" name="qty" placeholder="Enter Qty" required="required" pattern="^[1-9]\d*(\.\d+)?$" /></td>
				</tr>
				
				<tr>
				     	<td  align="center"><input type="submit" value="Save" style="background: yellow;color: black;" class="button"/></td>
				    	<td align="center"><input type="reset" value="Reset" style="background: yellow;color: black;" class="button"/></td>
				    </tr>	   
				<%}
						
				} %>
				<% 
					}
					catch (Exception e) {
					 e.printStackTrace();
				}%>	           
    			</table>
    			</form>
				</div>
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