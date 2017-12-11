package com.pokey.model;

import java.util.*;
import java.sql.*;

import com.pokey.model.ConnDB;
import com.pokey.model.GoodsBean;
public class MyCart {
	
	private HashMap hm=new HashMap();
	private Connection ct=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private float allPrice=0.0f;
	
	
	
	//通过商品的id得到数量
	public String goodsNum(String goodsId){
		
		return hm.get(goodsId).toString();
	}
	
	//添加商品

	public void addGoods(String goodsId,String num){
		
		hm.put(goodsId, num);
	}
	
	
	//删除商品
	
	public void delGoods(String goodsId){
		
		hm.remove(goodsId);
	}
	//清空购物车
	public void clearMyCart(){
		
		hm.clear();
	}
	
	//修改商品
	public void updGoods(String goodsId,String newNum){
		//为了程序的稳定，我们先判断书籍是否存在
		if(hm.containsKey(goodsId)){
			hm.put(goodsId, newNum);
		}
	}
	//计算总价的函数
	
	public float getAllPrice(){
		

		
		try {
			
			
			//把allprice
			this.allPrice=0.0f;
			ct=new ConnDB().getConn();
			
			String sql="select * from books where bookId in(";

			
			//将hm中的key值取出
			Iterator it=hm.keySet().iterator();
			
			//看看hashmap中有没有书籍
			if(it.hasNext()==false){
				
				return 0.0f;
			}
		
			
			while(it.hasNext()){
				
				//取出goodsId
				String goodsId=it.next().toString();
				
				//判断是不是最后一个goodsId
				if(it.hasNext()){
					
					sql+=goodsId+",";
				}else{
					
					sql+=goodsId+")";
				}

			}
			
			
			ps=ct.prepareStatement(sql);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
			
				//通过bookId,取出hm的书的数量
				String goodsNum=hm.get(rs.getInt(1)+"").toString();
				//得到该商品的单价
				float price=rs.getFloat(3);
				
				this.allPrice=this.allPrice+price*Integer.parseInt(goodsNum);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			
			//关闭资源
			this.close();
		}
		
		return this.allPrice;
		
	}
	
	
	public ArrayList showAllMyCart(){
		
		ArrayList al=new ArrayList();
		
		try {
			
			
			ct=new ConnDB().getConn();
			
			String sql="select * from books where bookId in(";
			
			
			
			
			
			//将hm中的key值取出
			Iterator it=hm.keySet().iterator();
			
			//看看hashmap中有没有书籍
			if(it.hasNext()==false){
				
				return al;
			}
		
			
			while(it.hasNext()){
				
				//取出goodsId
				String goodsId=it.next().toString();
				
				//判断是不是最后一个goodsId
				if(it.hasNext()){
					
					sql+=goodsId+",";
				}else{
					
					sql+=goodsId+")";
				}

			}
			
			//System.out.println("sqlll=="+sql);
			
			ps=ct.prepareStatement(sql);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
				GoodsBean gb=new GoodsBean();
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
				
				al.add(gb);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			
			//关闭资源
			this.close();
		}
		
		return al;
	}
	
	public void close(){
		
		try {
			if(rs!=null){
				
				rs.close();
				
			}
			if(ps!=null){
				
				ps.close();
			}
			if(ct!=null){
				
				ct.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}

}
