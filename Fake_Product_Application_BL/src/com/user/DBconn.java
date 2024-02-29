package com.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBconn {

	public static String filepath = "D:\\Code\\new_code\\FinalCode\\QRCode";
	public static String newfilepath = "G:/QR_Code";
	public static String outputfilepath = "G:/QR_Code/output/";

	public static Connection conn() throws ClassNotFoundException, SQLException {
		Connection con;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3307/fake_product_bl", "root",
				"admin");

		return con;
	}

	public static int productcheck(String productno) {
		int msg = 0;
		Connection con;
		try {
			con = DBconn.conn();

			Statement st = (Statement) con.createStatement();
			ResultSet rs;
			String str = "select * from product_info where Product_No='"
					+ productno + "'";
			rs = ((java.sql.Statement) st).executeQuery(str);
			if (rs.next()) {
				msg=2;
			} else {
				msg=1;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return msg;
	}
	//
	public static int product_Tab_Contains_check(String productno,String tabcon1,String tabcon2,String tabcon3) {
		int msg = 0;
		Connection con;
		String Tabcon1="";
		String Tabcon2="";
		String Tabcon3="";
		try {
			con = DBconn.conn();

			Statement st = (Statement) con.createStatement();
			ResultSet rs;
			String str = "select * from product_info where Product_No='"
					+ productno + "'";
			rs = ((java.sql.Statement) st).executeQuery(str);
			if (rs.next()) {
				 Tabcon1=rs.getString("Tab_Contains_First");
				 Tabcon2=rs.getString("Tab_Contains_Second");
				 Tabcon3=rs.getString("Tab_Contains_Third");
			} else {
				msg=1;
			}
			if(tabcon1.equals(Tabcon1)&&tabcon2.equals(Tabcon2)&&tabcon3.equals(Tabcon3))
			{
				msg=2;
			}
			else{msg=1;}
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return msg;
	}

	public static void main(String args[]) {

	}
}
