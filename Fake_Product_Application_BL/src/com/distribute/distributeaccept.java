package com.distribute;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.qrcode.Create_QR;
import com.user.DBconn;

/**
 * Servlet implementation class distributeaccept
 */
@WebServlet("/distributeaccept")
public class distributeaccept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public distributeaccept() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println("ID=>" + id);
		HttpSession session = request.getSession(true);
		String[] mid = id.split(",");
		PrintWriter pw = response.getWriter();
		String Distribute_Email_ID=(String)session.getAttribute("Cuserid");
		String tabcon1="";
		String tabcon2="";
		String tabcon3="";
		try {
			Connection con = (Connection) DBconn.conn();
			String Order_Qty = "", User_Email_ID = "";
			String msg = "Accept Request";
			Statement stRegister12 = (Statement) con.createStatement();
			ResultSet rsLogin12 = stRegister12
					.executeQuery("select * from user_product_info_order where D_Id='"
							+ mid[1] + "'");
			if (rsLogin12.next()) {
				User_Email_ID = rsLogin12
						.getString("User_Email_ID");
				Order_Qty = rsLogin12.getString("Order_Qty");
			}
			Statement stt1 = (Statement) con.createStatement();
			ResultSet rss1 = stt1
					.executeQuery("select * from distribute_product_info where MID='"
							+ mid[0] + "'");
			if (rss1.next()) {
				Statement stT1 = (Statement) con.createStatement();
				ResultSet rsT1 = stT1
						.executeQuery("select * from product_info where Product_No='"
								+ rss1.getString("Product_No") + "'");
				if (rsT1.next()) {
				tabcon1=rsT1.getString("Tab_Contains_First");
				tabcon2=rsT1.getString("Tab_Contains_Second");
				tabcon3=rsT1.getString("Tab_Contains_Third");
				}
			}
			int oldqty = 0;
			String productName = "", CompanyName = "", DescriptionName = "", MFGDate = "", Price = "", ExpiryDate = "", product_No = "";
			Statement stRegister1 = (Statement) con.createStatement();
			ResultSet rsLogin1 = stRegister1
					.executeQuery("select * from distribute_product_info where MID='"
							+ mid[0] + "'");
			if (rsLogin1.next()) {
				productName = rsLogin1.getString("ProductName");
				CompanyName = rsLogin1.getString("CompanyName");
				DescriptionName = rsLogin1.getString("DescriptionName");
				MFGDate = rsLogin1.getString("MFGDate");
				Price = rsLogin1.getString("Price");
				ExpiryDate = rsLogin1.getString("ExpiryDate");
				product_No = rsLogin1.getString("product_No");
				oldqty = rsLogin1.getInt("Qty");
			}

			//
			Statement st101 = con.createStatement();
			int oqty = Integer.parseInt(Order_Qty);
			System.out.println("O_QTY" + oqty + "\t Old Qty" + oldqty);
			if (oqty <= oldqty) {

				int totalqty = oldqty - oqty;
				st101.executeUpdate("update distribute_product_info set Qty='" + totalqty
						+ "' where MId='" + mid[0] + "'");
				Statement stRegister101 = con.createStatement();
				stRegister101
						.executeUpdate("update user_product_info_order set Status_Info='"
								+ msg
								+ "' where D_Id='"
								+ mid[1]
								+ "' and MId='" + mid[0] + "'");

				String Username = User_Email_ID + "_" + mid[0] + "_"
						+ mid[1];
				File finalpath = new File(DBconn.filepath, Username);
				finalpath.mkdir();
				String path = DBconn.filepath + "\\" + Username + "\\"
						+ Username + ".png";
				//System.out.println(path);
				// creating QR code
				String datainfo = productName + "@0@" + CompanyName + "@0@"
						+ DescriptionName + "@0@" + MFGDate + "@0@" + Price
						+ "@0@" + ExpiryDate + "@0@" + product_No+"@0@"+mid[0]+"@0@"+Distribute_Email_ID+"@0@"+User_Email_ID+"@0@"+tabcon1+"@0@"+tabcon2+"@0@"+tabcon3;;
			
				Create_QR.CreateQR(datainfo, path);
				
				pw.println("<html><script>alert('Status Update Successfully');</script><body>");
				pw.println("");
				pw.println("</body></html>");
				response.sendRedirect("U_DistributeDataShow.jsp?Update");
			} else {
				pw.println("<html><script>alert('Out of stock');</script><body>");
				pw.println("");
				pw.println("</body></html>");
				response.sendRedirect("U_DistributeDataShow.jsp?stock");
			}

		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// RequestDispatcher rd = request.getRequestDispatcher("/DataShow.jsp");
		// rd.include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
