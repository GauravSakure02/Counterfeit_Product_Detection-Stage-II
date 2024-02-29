package com.qrcode;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.user.DBconn;

public class product_detection {

	public static int ProductNo(String id)
	{
		int flag=0;
		try {
			Connection con = (Connection) DBconn.conn();
			Statement stRegister1 = (Statement) con.createStatement();
			ResultSet rsLogin1 = stRegister1
					.executeQuery("select * from product_info where Product_No='"+id+"'");
			if (rsLogin1.next()) {
				flag=0;
			}
			else
			{
				flag=1;
			}
		}
		catch(Exception e)
		{}
		
		
		return flag;
	}
	public static int ProductMFGDate(String id,String MFGDate)
	{
		int flag=0;
		try {
			Connection con = (Connection) DBconn.conn();
			Statement stRegister1 = (Statement) con.createStatement();
			ResultSet rsLogin1 = stRegister1
					.executeQuery("select * from product_info where Product_No='"+id+"'");
			if (rsLogin1.next()) {
				int d=Datecheck(MFGDate,rsLogin1.getString("MFGDate"));
				if(d==1)
				{flag=1;
				}
				else
				{
					flag=0;
				}
			}
		}
		catch(Exception e)
		{}
		
		
		return flag;
	}
	public static int ProductExpiryDate(String id,String ExpiryDate)
	{
		int flag=0;
		try {
			Connection con = (Connection) DBconn.conn();
			Statement stRegister1 = (Statement) con.createStatement();
			ResultSet rsLogin1 = stRegister1
					.executeQuery("select * from product_info where Product_No='"+id+"'");
			if (rsLogin1.next()) {
				
				int d=Datecheck(ExpiryDate,rsLogin1.getString("ExpiryDate"));
				if(d==1)
				{flag=1;
				}
				else
				{
					flag=0;
				}
			}
		}
		catch(Exception e)
		{}
		
		
		return flag;
	}
	
	public static int Datecheck(String newdate,String dbdate)
	{
		int data=0;
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
	      Date d1;
		try {
			d1 =  sdformat.parse(newdate);
		
	      Date d2 = sdformat.parse(dbdate);
	      System.out.println("The date 1 is: " + sdformat.format(d1));
	      System.out.println("The date 2 is: " + sdformat.format(d2));
	      if(d1.compareTo(d2) == 0) {
	         System.out.println("Both dates are equal");
	         data=1;
	      }
	      else
	      {
	    	  data=0;
	      }
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return data;
	}
	public static void main(String[] args) {
		ProductExpiryDate("Mob76752","2000-02-02");

	}

}
