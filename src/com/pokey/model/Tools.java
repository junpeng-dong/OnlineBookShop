package com.pokey.model;

public class Tools {

	//提供一个方法，将乱码转成 gb2312 , gbk ,utf-8
	public static String getNewString(String input){
		
		String result="";
		try {
			
			result=new String(input.getBytes("iso-8859-1"),"utf-8");
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return result;
	}
}
