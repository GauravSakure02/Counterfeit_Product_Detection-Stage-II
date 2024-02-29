<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	if(request.getParameter("succ")!=null)
	{
	out.println("<script>alert('Congratulations....product Save Successfull...!')</script>");	
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
		<div class="container"><br><br><br>
		 <div class="row">
		  <div class="col-sm-12 col-md-8">
			<div class="row">			
			
			<%
			String id = request.getParameter("productno");
	
			String oldqty="",productName = "", CompanyName = "", DescriptionName = "", MFGDate = "", Price = "", ExpiryDate = "", product_No = "";
			
			try {
				Connection con = (Connection) DBconn.conn();
				Statement stRegister1 = (Statement) con.createStatement();
				ResultSet rsLogin1 = stRegister1
						.executeQuery("select * from distribute_product_info where Product_No='"+id+"'");
				if (rsLogin1.next()) {
					productName = rsLogin1.getString("ProductName");
					CompanyName = rsLogin1.getString("CompanyName");
					DescriptionName = rsLogin1.getString("DescriptionName");
					MFGDate = rsLogin1.getString("MFGDate");
					Price = rsLogin1.getString("Price");
					ExpiryDate = rsLogin1.getString("ExpiryDate");
					product_No = rsLogin1.getString("Product_No");
					
				}
				
				Statement st1 = (Statement) con.createStatement();
				ResultSet rs1 = st1
						.executeQuery("select * from user_product_info_order where Product_No='"+id+"'");
				if (rs1.next()) {
					oldqty = rs1.getString("Order_Qty");
				}
			}
			catch(Exception e)
			{}
			int dbprice=Integer.valueOf(Price);
			int qty=Integer.valueOf(oldqty);
			int totalprice=dbprice*qty;
			%>
			
			
			<form action="u_saveproduct" method="post" class="form-block form-bold form-mb-20 form-h-35 form-brdr-b-grey pr-50 pr-sm-0">
			            	<table align="center" border="1"  cellpadding="5" cellspacing="5">
					 <tr>
						<td><b>product Name</b></td>
						<td><input type="text" name="productName" readonly="readonly" value="<%=productName %>" placeholder="product Name"/></td>
						<td><b>Company Name</b></td>
						<td><input type="text" name="companyname"  readonly="readonly"  value="<%=CompanyName %>" placeholder="Company Name" title="Minimum Two  Characters  are Required For Company Name" required /></td>
					</tr>
					<tr>
						<td><b>Description</b></td>
						<td><input type="text" name="Descriptionname"  value="<%=DescriptionName %>" readonly="readonly" required /></td>
						<td><b>MFG. Date</b></td>
						<td><input type="text" name="mfgdate"  value="<%=MFGDate %>" readonly="readonly"  required="required"/>
						</td>
						</tr>
					<tr>
						<td><b>Price</b></td>
						<td><input type="text" name="price" value="<%=Price %>" readonly="readonly" required="required"/></td>
						<td><b>Expiry Date</b></td>
						<td><input type="text" name="Expirydate"  value="<%=ExpiryDate %>"  required="required" readonly="readonly"  />
						</td>
					</tr>
					<tr>
						<td><b>QTY</b></td>
						<td><input type="text" name="qty"  value="<%=oldqty %>" placeholder="Enter Qty" required="required" pattern="^[1-9]\d*(\.\d+)?$" /></td>
						
						<td><b>Total Price</b></td>
						<td><input type="text" name="totalprice"  value="<%=totalprice %>" placeholder="Enter Qty" required="required" pattern="^[1-9]\d*(\.\d+)?$" /></td>
						
						
					</tr>
					<tr>
						
						<td><input type="hidden" name="meid" readonly="readonly" value="<%=id %>"  /></td>
						
						
					</tr>
					<tr>
				     	<td colspan="2" align="center"><input type="submit" value="Pay Bill" style="background: yellow;color: black;" class="button"/></td>
				    	<td colspan="2" align="center"><input type="reset" value="Reset" style="background: yellow;color: black;" class="button"/></td>
				    </tr>
				</table>
                       
			</form>	
			</div>
		</div>
				
				<div class="col-sm-12 col-md-4">
				<h3 align="center">Update Product Information</h3>
					<img src="img/users.jpg" alt="">
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
     