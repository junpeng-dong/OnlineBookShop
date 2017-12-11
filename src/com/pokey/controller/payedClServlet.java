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

public class payedClServlet extends HttpServlet {

		public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			
			MyCart mc=(MyCart)request.getSession().getAttribute("mycart");
			UserBean ub= (UserBean)request.getSession().getAttribute("loginUserinfo");
			if(ub == null){
				
				response.sendRedirect("info.jsp?type=timeout");
			}else{
				
				response.setContentType("text/html");
				response.setCharacterEncoding("utf-8");
				PrintWriter out = response.getWriter();
				
				String orderid=request.getParameter("orderid");
				String userid = ub.getUserid()+"";
				if(mc.getAllPrice()>ub.getAccRemain()){
					
					response.sendRedirect("info.jsp?type=payfail");
					
				}else{
					
					OrderBeanBo obb = new OrderBeanBo();
					
					obb.pay(orderid,userid);
					
					response.sendRedirect("info.jsp?type=payok");
				}
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
