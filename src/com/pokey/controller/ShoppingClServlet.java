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
			//�õ�bookId,��Ҫ����Ļ�����ӵ����ﳵ
			String goodsId=request.getParameter("goodsIdpokey");
			
			//��session��ȡ�����ﳵ
			MyCart mc=(MyCart)request.getSession().getAttribute("mycart");
			
			if(mc==null){
				
				//˵��û�е�¼��,��ʱ�Ϳ��Դ���һ�����ﳵ��������session
				mc=new MyCart();
				request.getSession().setAttribute("mycart", mc);
			}
			
			//���ﳵ�����ѡ�еĻ���
			mc.addGoods(goodsId, "1");
			
			//ȡ�����׼����ʾ
			request.setAttribute("mycartGoods", mc.showAllMyCart());
		}else if(type.equals("alter")){
			//�õ�bookId,��Ҫ����Ļ�����ӵ����ﳵ
			String goodsid[] = request.getParameterValues("bookid");
			String num[]=request.getParameterValues("num");
			MyCart mc=(MyCart)request.getSession().getAttribute("mycart");
			//System.out.println(goodsid[0]);
			//System.out.println(goodsid.length);
			if(goodsid.length!=1)
			{
				//��session��ȡ�����ﳵ
				
				for(int i=0;i<goodsid.length-1;i++)
				{
				//���ﳵ�����ѡ�еĻ���
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
			//ȡ�����׼����ʾ
			request.setAttribute("mycartGoods", mc.showAllMyCart());
		}else if(type.equals("cart")){
			
			//��session��ȡ�����ﳵ
			MyCart mc=(MyCart)request.getSession().getAttribute("mycart");
			
			if(mc==null){
				
				mc = new MyCart();
				request.getSession().setAttribute("mycart", mc);
			}
			//ȡ�����׼����ʾ
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
