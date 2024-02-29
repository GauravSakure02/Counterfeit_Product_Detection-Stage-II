package com.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.user.DBconn;

/**
 * Servlet implementation class updateproduct
 */
@WebServlet("/updateproduct")
public class updateproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateproduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
		
		String product_No=request.getParameter("meid");
		String mid=request.getParameter("mid");
		String Order_Qty="";
		try {
			Connection con = DBconn.conn();

			Statement stRegister12 = (Statement) con.createStatement();
			ResultSet rsLogin12 = stRegister12
					.executeQuery("select * from product_info where MID='"
							+ mid + "' and Product_No='"+product_No+"'");
			if (rsLogin12.next()) {
				
				Order_Qty = rsLogin12.getString("Qty");
			}
			int oqty=Integer.parseInt(Order_Qty);
			int newqty=Integer.parseInt(qty);
			int newtotalqty=oqty+newqty;
			Statement st = (Statement) con.createStatement();
			st.executeUpdate("update product_info set ProductName='"+productName+"', CompanyName='"+companyname+"', DescriptionName='"+Descriptionname+"', MFGDate='"+mfgdate+"',Price='"+price+"',ExpiryDate='"+Expirydate+"',Qty='"+newtotalqty+"' where Product_No='"+product_No+"' and MID='"+mid+"'");

			

		} catch (Exception e) {
			System.out.println(e);
		}
		pw.println("<html><script>alert('Product Save Successfully');</script><body>");
		pw.println("");
		pw.println("</body></html>");
		response.sendRedirect("Admin_updateProduct.jsp?succ");
	}

}
