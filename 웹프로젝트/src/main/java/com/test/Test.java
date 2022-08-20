package com.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Test {
   
   public static void main(String[] args) {
      
      //String url = "jdbc:oracle:thin:@oraclecloud_high?TNS_ADMIN=C:/class/wallet";
	   String url = "jdbc:oracle:thin:@oraclecloud_high?TNS_ADMIN=C://class/server/Wallet_OracleCloud";
	   String id = "webPartner";
	   String pw = "JAVAjava1234";
      Connection conn = null;
      Statement stat = null;
      
      try {
         
    	 System.setProperty("oracle.jdbc.fanEnabled","false");

         Class.forName("oracle.jdbc.driver.OracleDriver");
         
         conn = DriverManager.getConnection(url, id, pw);
         
         System.out.println(conn.isClosed());
         
         ResultSet rs = conn.createStatement().executeQuery("select count(*) from tabs");

         rs.next();
         System.out.println(rs.getInt(1));
         
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
   }

}