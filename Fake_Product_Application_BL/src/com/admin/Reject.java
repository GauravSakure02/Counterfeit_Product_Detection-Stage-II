package com.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.DBconn;


@WebServlet("/Reject")
public class Reject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Reject() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println("ID=>"+id);
		String[] mid=id.split(",");
		PrintWriter pw = response.getWriter();
		try {
			Connection con = (Connection) DBconn.conn();
			String msg="Reject Request";
			Statement stRegister101=con.createStatement();
			
			stRegister101.executeUpdate("update product_info_order set Status_Info='"+msg+"' where D_Id='" +mid[1]+ "' and MId='" +mid[0]+ "'");
		
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		pw.println("<html><script>alert('Status Update Successfully');</script><body>");
		pw.println("");
		pw.println("</body></html>");
		response.sendRedirect("DistributeDataShow.jsp?Update");
	}
	

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
