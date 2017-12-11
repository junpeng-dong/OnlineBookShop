package com.pokey.model;

import java.util.*;
import java.sql.*;
public class GoodsBeanBo {

	private Connection ct=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	
	private int  pageSize=6;
	private int  rowCount=0;//��ֵ�����ݿ��ѯ
	private int  pageCount=0;//��ֵ��ͨ��pageSize��rowCount
	private boolean checknum = true;
	
	//����id�õ��������Ϣ
	public GoodsBean getGoodsBeanById(String id){
		
		GoodsBean gb=new GoodsBean();
		
		try {
			
			//�õ�����
			ct=new ConnDB().getConn();
			
			ps=ct.prepareStatement("select * from books where bookId=?");
			ps.setString(1, id);
			// ��ѯ
  			rs=ps.executeQuery();
  		 			
  			if(rs.next()){
  				
  				gb.setGoodsId(rs.getInt(1));
  				gb.setGoodsName(rs.getString(2));
  				gb.setGoodsPrice(rs.getFloat(3));
  				gb.setGoodsNum(rs.getInt(4));
  				gb.setPhoto(rs.getString(5));
  				gb.setFans(rs.getInt(6));
  				gb.setPublisher(rs.getString(7));
  				gb.setGoodsType(rs.getString(8));
  				gb.setAuthor(rs.getString(9));
  				gb.setGoodsIntro(rs.getString(10));
  				gb.setBirth(rs.getString(11));
  				gb.setSubClassType(rs.getString(12));
  			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			
			this.close();
		}
		return gb;
		
	}
	public boolean checkNum(String id,String num){
						
			int number = Integer.parseInt(num);
			try {
				
				//�õ�����
				ct=new ConnDB().getConn();
				
				ps=ct.prepareStatement("select * from books where bookId=?");
				ps.setString(1, id);
				// ��ѯ
	  			rs=ps.executeQuery();
	  		 			
	  			if(rs.next()){
	  				
	  				if(number>rs.getInt(4)){
	  					checknum = false;
	  				}else{
	  					checknum = true;
	  				}
	  			}
				
				
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}finally{
				
				this.close();
			}
			return checknum;
		}
		

	
	//	�ر���Դ
	public void close(){
		
		try {
			
			if(rs!=null){
				
				rs.close();
				rs=null;
			}
			if(ps!=null){
				
				ps.close();
				ps=null;
			}
			if(ct!=null){
				
				ct.close();
				ct=null;
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
