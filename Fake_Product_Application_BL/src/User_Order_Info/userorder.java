package User_Order_Info;

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
import javax.servlet.http.HttpSession;

import com.user.DBconn;

/**
 * Servlet implementation class userorder
 */
@WebServlet("/userorder")
public class userorder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static int noofnode=4;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userorder() {
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
		HttpSession session = request.getSession(false);
		String id = request.getParameter("id");
		String product_No = request.getParameter("product_No");
		String qty = request.getParameter("qty");
String user_Email_ID=(String)session.getAttribute("userid");
String user_Mobile_No=(String)session.getAttribute("mobile");
		try {
			Connection con = DBconn.conn();

			Statement st = (Statement) con.createStatement();
			String query = "select * from distribute_product_info where MID='" + id
					+ "'";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			if (rs.next()) {
				String productName=rs.getString("ProductName");
				String CompanyName=rs.getString("CompanyName");
				st.executeUpdate("insert into user_product_info_order(User_Email_ID, Product_No,ProductName,CompanyName,Order_Qty,MId,User_Mobile_No,Status_Info) values ('"
						+ user_Email_ID
						+ "','"
						+ product_No
						+ "','"
						+ productName
						+ "','"
						+ CompanyName
						+ "','"
						+ qty
						+ "','"
						+ id
						+ "','"
						+ user_Mobile_No
						+ "','0')");

			//	String datainfo=user_Email_ID+product_No+productName+CompanyName+qty+id+user_Mobile_No;
				//ptop.ptopverify(noofnode,datainfo);
				
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		pw.println("<html><script>alert('Order Product Save Successfully');</script><body>");
		pw.println("");
		pw.println("</body></html>");
		response.sendRedirect("U_OrderShow.jsp?Order");

	}

}
