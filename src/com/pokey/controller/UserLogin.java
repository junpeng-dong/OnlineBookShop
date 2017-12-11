package com.pokey.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.pokey.model.*;
public class UserLogin extends HttpServlet {

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
		
		//�����û���������
		String u=Tools.getNewString(request.getParameter("username"));
		String p=request.getParameter("passwd");
		
		UserBeanBo ubb=new UserBeanBo();
		
		if(ubb.checkUser(u, p)){
			//����һ��userbean,�����뵽session
			UserBean ub=ubb.getUserBean(u);			
			request.getSession().setAttribute("loginUserinfo", ub);
			//��Ҫ��ʾ�Ĺ��ﳵ��Ʒ���ݷ���request
			MyCart mc=(MyCart)request.getSession().getAttribute("mycart");
			request.setAttribute("mycartInfo", mc.showAllMyCart());
			request.getRequestDispatcher("cart_2.jsp").forward(request, response);
		}else{
			
			//����ҳ��
			request.getRequestDispatcher("cart_1.jsp").forward(request, response);
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
