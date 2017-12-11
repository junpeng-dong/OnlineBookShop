//得到数据库的连接
package com.pokey.model;


import java.sql.*;
public class ConnDB {

	private Connection ct=null;
	
	public Connection getConn(){
		
		
		try {
			
//			1.加载驱动
	    	Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
	    	//2.得到链接
	    	ct=DriverManager.getConnection("jdbc:microsoft:sqlserver://127.0.0.1:1433;databaseName=OnlineBookShop","sa","123");
	  
		} catch (Exception e) {
			//一定写上..
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return ct;
	}
}
