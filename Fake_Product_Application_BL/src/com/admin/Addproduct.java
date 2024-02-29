package com.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.user.DBconn;

/**
 * Servlet implementation class Addproduct
 */
@WebServlet("/Addproduct")
public class Addproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addproduct() {
        super();
        // TODO Auto-generated constructor stub
    }
    public static String substring(String productName)
	{
		String msg;
		String mystring = new String(productName);
		 Random rand = new Random(); 
		 int rand_int1 = rand.nextInt(100000);
		msg=mystring.substring(0,3)+rand_int1;
		return msg;
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		String productName = request.getParameter("productName");
		String companyname = request.getParameter("companyname");
		String Descriptionname = request.getParameter("Descriptionname");
		String mfgdate = request.getParameter("mfgdate");
		String price = request.getParameter("price");
		String Expirydate = request.getParameter("Expirydate");
		String qty = request.getParameter("qty");
		String tabcon1=request.getParameter("tabcon1");
		String tabcon2=request.getParameter("tabcon2");
		String tabcon3=request.getParameter("tabcon3");
		
		String product_No=substring(productName);
		try {
			Connection con = DBconn.conn();

			Statement st = (Statement) con.createStatement();
			st.executeUpdate("insert into product_info(ProductName, CompanyName, DescriptionName, MFGDate,Price,ExpiryDate,Qty,Product_No,Tab_Contains_First,Tab_Contains_Second,Tab_Contains_Third) values ('"
							+ productName
							+ "','"
							+ companyname
							+ "','"
							+ Descriptionname
							+ "','" + mfgdate + "','"+price+"','"+Expirydate+"','"+qty+"','"+product_No+"','"+tabcon1+"','"+tabcon2+"','"+tabcon3+"')");

			

		} catch (Exception e) {
			System.out.println(e);
		}
		pw.println("<html><script>alert('product Save Successfully');</script><body>");
		pw.println("");
		pw.println("</body></html>");
		response.sendRedirect("UpdateProduct.jsp?succ");
		
	}

}
