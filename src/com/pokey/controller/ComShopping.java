package com.pokey.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pokey.model.MyCart;
import com.pokey.model.UserBean;
import com.pokey.model.UserBeanBo;

public class ComShopping extends HttpServlet {

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

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		//判断用户是否登录过
		
		UserBean loginUser=(UserBean)request.getSession().getAttribute("loginUserinfo");
		
		
		if(loginUser==null){
			
			//说明没有登录过,进入第二个步骤
			request.getRequestDispatcher("cart_1.jsp").forward(request, response);
		}else{
			
			
			//说明登录过，直接进入第三个步骤
			
			
			//把要显示的购物车商品内容放入request
			MyCart mc=(MyCart)request.getSession().getAttribute("mycart");
			request.setAttribute("mycartInfo", mc.showAllMyCart());
			request.getRequestDispatcher("cart_2.jsp").forward(request, response);
		}
		
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
