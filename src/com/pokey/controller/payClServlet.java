package com.pokey.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pokey.model.MyCart;
import com.pokey.model.UserBean;
import com.pokey.model.*;

public class payClServlet extends HttpServlet {

		public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			
			MyCart mc=(MyCart)request.getSession().getAttribute("mycart");
			UserBean ub= (UserBean)request.getSession().getAttribute("loginUserinfo");
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			String type=request.getParameter("type");
			
			OrderBeanBo obb = new OrderBeanBo();
			obb.addOrder(ub.getUserid(), 0, mc.getAllPrice(), mc);
			OrderInfoBean oib = obb.getOrderInfoBean();
			request.setAttribute("orderinfobean",oib);
			
			request.getRequestDispatcher("pay.jsp").forward(request, response);

				
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
