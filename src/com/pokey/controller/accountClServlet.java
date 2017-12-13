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

public class accountClServlet extends HttpServlet {

		public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			String type = request.getParameter("type");
			
			if(type.equals("login")){
				
				request.getSession().removeAttribute("mycart");
				request.getSession().removeAttribute("loginUserinfo");
				
				response.sendRedirect("login.jsp");
				
			}else if(type.equals("alter")){
				
				String passwd = request.getParameter("passwd");
				String truename = request.getParameter("truename");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				String addr = request.getParameter("addr");
				String postcode = request.getParameter("postcode");
				UserBean ub = (UserBean)request.getSession().getAttribute("loginUserinfo");
				int userId = ub.getUserid();
				UserBeanBo ubb = new UserBeanBo();
				
				UserBean newub = new UserBean();
				
				newub.setUserid(userId);
				newub.setPasswd(passwd);
				newub.setTruename(truename);
				newub.setEmail(email);
				newub.setPhone(phone);
				newub.setAddress(addr);
				newub.setPostcode(postcode);
				ubb.alter(newub);
				
				response.sendRedirect("info.jsp?type=accalterok");
				
			}else if(type.equals("charge")){
				
				UserBean ub = (UserBean)request.getSession().getAttribute("loginUserinfo");
				
				String money = request.getParameter("money");
				
				UserBeanBo ubb = new UserBeanBo();
				
				ubb.charge(ub.getUserid(),money);
				
				response.sendRedirect("info.jsp?type=chargeok");
			}else if(type.equals("delorder")){
				String id = request.getParameter("orderid");
				
				OrderBeanBo odbb = new OrderBeanBo();
				
				if(odbb.delOrder(id)){
				
				response.sendRedirect("info.jsp?type=delodok");
				
				}else{
					
				response.sendRedirect("info.jsp?type=delodfail");	
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
		
		public void test() {
		}
		}

}
