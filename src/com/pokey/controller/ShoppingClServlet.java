package com.pokey.controller;

import com.pokey.model.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ShoppingClServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String type = request.getParameter("type");
		
		if(type.equals("delall")){
			MyCart mc=(MyCart)request.getSession().getAttribute("mycart");
			mc.clearMyCart();
			request.setAttribute("mycartGoods", mc.showAllMyCart());
			
		}else if(type.equals("del")){
			MyCart mc=(MyCart)request.getSession().getAttribute("mycart");
			String goodsId=request.getParameter("goodsIdpokey");
			mc.delGoods(goodsId);
			request.setAttribute("mycartGoods", mc.showAllMyCart());
			
		}else if(type.equals("add")){
			//得到bookId,将要购买的货物添加到购物车
			String goodsId=request.getParameter("goodsIdpokey");
			
			//从session中取出购物车
			MyCart mc=(MyCart)request.getSession().getAttribute("mycart");
			
			if(mc==null){
				
				//说明没有登录过,这时就可以创建一个购物车，并放入session
				mc=new MyCart();
				request.getSession().setAttribute("mycart", mc);
			}
			
			//向购物车中添加选中的货物
			mc.addGoods(goodsId, "1");
			
			//取出货物，准备显示
			request.setAttribute("mycartGoods", mc.showAllMyCart());
		}else if(type.equals("alter")){
			//得到bookId,将要购买的货物添加到购物车
			String goodsid[] = request.getParameterValues("bookid");
			String num[]=request.getParameterValues("num");
			MyCart mc=(MyCart)request.getSession().getAttribute("mycart");
			//System.out.println(goodsid[0]);
			//System.out.println(goodsid.length);
			if(goodsid.length!=1)
			{
				//从session中取出购物车
				
				for(int i=0;i<goodsid.length-1;i++)
				{
				//向购物车中添加选中的货物
					GoodsBeanBo gbo = new GoodsBeanBo();
					if(gbo.checkNum(goodsid[i], num[i]))
					{
						mc.updGoods(goodsid[i], num[i]);
					}else{
						GoodsBean gb = gbo.getGoodsBeanById(goodsid[i]);
						mc.updGoods(goodsid[i], gb.getGoodsNum()+"");
					}
				}
			}
			//取出货物，准备显示
			request.setAttribute("mycartGoods", mc.showAllMyCart());
		}else if(type.equals("cart")){
			
			//从session中取出购物车
			MyCart mc=(MyCart)request.getSession().getAttribute("mycart");
			
			if(mc==null){
				
				mc = new MyCart();
				request.getSession().setAttribute("mycart", mc);
			}
			//取出货物，准备显示
			request.setAttribute("mycartGoods", mc.showAllMyCart());
		}
		
		request.getRequestDispatcher("cart.jsp").forward(request, response);
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
