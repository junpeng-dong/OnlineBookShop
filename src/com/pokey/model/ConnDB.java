//�õ����ݿ������
package com.pokey.model;


import java.sql.*;
public class ConnDB {

	private Connection ct=null;
	
	public Connection getConn(){
		
		
		try {
			
//			1.��������
	    	Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
	    	//2.�õ�����
	    	ct=DriverManager.getConnection("jdbc:microsoft:sqlserver://127.0.0.1:1433;databaseName=OnlineBookShop","sa","123");
	  
		} catch (Exception e) {
			//һ��д��..
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return ct;
	}
}
