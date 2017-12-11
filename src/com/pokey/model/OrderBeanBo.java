package com.pokey.model;
import java.util.*;
import java.sql.*;
public class OrderBeanBo {

	private Connection ct=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private ResultSet rs2=null;
	private int orderId=0;
	
	
	public int getOrderId(){
		return  this.orderId;
	}
	//得到订单
public OrderBean getOrderBean(String id){
		
		OrderBean odb=new OrderBean();
		
		try {
			
			String sql="select * from orders where ordersId="+id;
			
			ct=new ConnDB().getConn();
			ps=ct.prepareStatement(sql);
			rs=ps.executeQuery();
			
			if(rs.next()){
				
				odb.setOrdersId(rs.getInt(1));
				odb.setUserId(rs.getInt(2));
				odb.setOrderDate(rs.getDate(3));
				odb.setIsPayed(rs.getByte(4));
				odb.setTotalPrice(rs.getFloat(5));
				
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			
			this.close();
		}
		
		return odb;
	}
	
	public boolean delOrder(String id){
		
		boolean del = false;
		try {
					
				String sql="delete from orderdetail where ordersId="+id;
				
				ct=new ConnDB().getConn();
				ps=ct.prepareStatement(sql);
				ps.executeUpdate();
				
				String sql2="delete from orders where ordersId="+id;
				
				ps=ct.prepareStatement(sql2);
				ps.executeUpdate();
				
				del = true;
					
				} catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}finally{
					
					this.close();
				}
				return del;
				
	}
	
	
	//得到订单的信息
	public OrderInfoBean getOrderInfoBean(){
		
		OrderInfoBean oib=new OrderInfoBean();
		
		try {
			
			String sql="select ordersId ,truename,address,postcode,phone,totalPrice,userName,email from users,orders"+ 
			" where ordersId=? and users.userId = (select orders.userId from orders where ordersId=?)";
			
			ct=new ConnDB().getConn();
			ps=ct.prepareStatement(sql);
			ps.setInt(1, this.orderId);
			ps.setInt(2, this.orderId);
			rs=ps.executeQuery();
			
			if(rs.next()){
				
				oib.setOrdersId(rs.getInt(1));
				oib.setTruename(rs.getString(2));
				oib.setAddress(rs.getString(3));
				oib.setPostcode(rs.getString(4));
				oib.setPhone(rs.getString(5));
				oib.setTotalPrice(rs.getFloat(6));
				oib.setUsername(rs.getString(7));
				oib.setEmail(rs.getString(8));
				
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			
			this.close();
		}
		
		return oib;
	}
	
	
	//增加订单
	public boolean addOrder(int userId,int isPay,float totalPrice,MyCart mc){
		
		boolean b=false;
		String sql="insert into orders (userId,isPayed,totalPrice) values(?,?,?)";	
		try {
			
			ct=new ConnDB().getConn();
			
			ps=ct.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setInt(2, isPay);
			ps.setFloat(3, totalPrice);
			
			
			
			if(ps.executeUpdate()==1){
				
				//得到刚刚插入的id
				sql="select max(ordersId) id from orders";
				
				ps=ct.prepareStatement(sql);
				
				rs=ps.executeQuery();
				
				if(rs.next()){
					
					
					this.orderId=rs.getInt(1);
					
					//Statement .准备整体提交
					Statement sm=ct.createStatement();
					
					
					ArrayList al=mc.showAllMyCart();
					
					
					for(int i=0;i<al.size();i++){
						
						GoodsBean gb=(GoodsBean)al.get(i);
						//得到购物车中的id,和数量
						int goodsId=gb.getGoodsId();
						String goodsname = gb.getGoodsName();
						String num=mc.goodsNum(goodsId+"");
						
						sql="insert into orderdetail(ordersId,goodsId,num,goodsName) values('"+orderId+"','"+goodsId+"','"+num+"','"+goodsname+"')";
						
						sm.addBatch(sql);
						
						
						
					}
					
					//整体提交
					sm.executeBatch();
					
					//for(int i=0;i<re.length;i++){
						
						//System.out.println("返回的结果是:"+re[i]);
					//}
				}
				
				b=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			
			this.close();
		}
		
		return b;
	}
	
	public void pay(String orderid,String userid){
		try{
			int remain = 0;
			int consump = 0;
			ct=new ConnDB().getConn();
			
			String sql1="select * from users where userId ="+userid;
			ps=ct.prepareStatement(sql1);
			rs = ps.executeQuery();
			if(rs.next()){
				
				remain = rs.getInt(11);
				consump = rs.getInt(10);
				//System.out.println(remain);
				//System.out.println(consump);
			
			}
			
			String sql2="select * from orders where ordersId ="+orderid;
			ps=ct.prepareStatement(sql2);
			rs = ps.executeQuery();
			if(rs.next()){
			
				remain = remain - rs.getInt(5);
				consump = consump + rs.getInt(5);
				//System.out.println(remain);
				//System.out.println(consump);
			}
			
			String sql4="update users set consumption = "+consump+" where userId ="+userid;
			
			ps=ct.prepareStatement(sql4);
			
			ps.executeUpdate();
			
			int grade = consump/1000;
			
			String sql9="update users set grade = "+grade+" where userId ="+userid;
			
			ps=ct.prepareStatement(sql9);
			
			ps.executeUpdate();
			
			String sql5="update users set accountRemain = "+remain+" where userId ="+userid;
			
			ps=ct.prepareStatement(sql5);
			
			ps.executeUpdate();
			
			String sql3="update orders set isPayed = 1 where ordersId ="+orderid;
			
			ps=ct.prepareStatement(sql3);
			
			ps.executeUpdate();
			String sql6="select * from orderdetail where ordersId ="+orderid;
			ps=ct.prepareStatement(sql6);
			rs = ps.executeQuery();
			while(rs.next()){
				
				int goodsid = rs.getInt(3);
				int goodsnum = rs.getInt(4);
				int newgoodsnum = 0;
				String sql8="select * from books where bookId ="+goodsid;
				ps=ct.prepareStatement(sql8);
				rs2 = ps.executeQuery();
				if(rs2.next()){
					
					newgoodsnum = rs2.getInt(4)-goodsnum;
				}
				String sql7="update books set rest="+newgoodsnum+" where bookId ="+goodsid;
				ps=ct.prepareStatement(sql7);
				ps.executeUpdate();
			
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			
			this.close();
		}
	}
	
	public ArrayList myOrderContent(int orderid){
			
			
			ArrayList al=new ArrayList();
		
			try{
				String sql="select * from orderdetail where ordersId=?";
				
				ct=new ConnDB().getConn();
				ps=ct.prepareStatement(sql);
				ps.setInt(1, orderid);
				rs=ps.executeQuery();
				
				while(rs.next()){
					OrderDetailBean oddb = new OrderDetailBean();
					oddb.setGoodsId(rs.getInt(3));
					oddb.setNums(rs.getInt(4));
					oddb.setGoodsName(rs.getString(5));
					al.add(oddb);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}finally{
				
				this.close();
			}
			return al;
	}
	
	public ArrayList myOrders(int userid){
		
		
		ArrayList al=new ArrayList();

		try{
			String sql="select * from orders where userId=?";
			
			ct=new ConnDB().getConn();
			ps=ct.prepareStatement(sql);
			ps.setInt(1, userid);
			rs=ps.executeQuery();
			
			while(rs.next()){
				OrderBean odb = new OrderBean();
				odb.setOrdersId(rs.getInt(1));
				odb.setUserId(rs.getInt(2));
				odb.setOrderDate(rs.getDate(3));
				odb.setIsPayed(rs.getByte(4));
				odb.setTotalPrice(rs.getFloat(5));
				al.add(odb);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			
			this.close();
		}
		return al;
}
	
	
	
//	关闭资源
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
