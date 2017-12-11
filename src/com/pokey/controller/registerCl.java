package com.pokey.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.pokey.model.*;
public class registerCl extends HttpServlet {
	
	private Connection ct=null;
	private PreparedStatement ps=null;
	private PreparedStatement sql=null;
	private ResultSet rs=null;

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
		
		//接收用户名和密码
		String username=Tools.getNewString(request.getParameter("username"));
		String passwd=Tools.getNewString(request.getParameter("passwd"));
		String truename=Tools.getNewString(request.getParameter("truename"));
		String email=Tools.getNewString(request.getParameter("email"));
		String phone=Tools.getNewString(request.getParameter("phone"));
		String addr=Tools.getNewString(request.getParameter("addr"));
		String post=Tools.getNewString(request.getParameter("post"));
		try {
			String sql1="select * from users where username = '"+username+"'";
			
			ct=new ConnDB().getConn();
			
			ps=ct.prepareStatement(sql1);
			
			rs=ps.executeQuery();
			
			if(rs.next()){

				//request.setAttribute("type", "regfail");
				response.sendRedirect("info.jsp?type=regfail");
				
			}else{
				String sql2 = "insert into users(userName,truename,passwd,email,phone,address,postcode)values " +"("+"'"+username+"'"+","+"'"+truename+"'"+","+"'"+passwd+"'"+","+"'"+email+"'"+","+"'"+phone+"'"+","+"'"+addr+"'"+","+"'"+post+"'"+")";
				
				sql =ct.prepareStatement(sql2);
				
				sql.executeUpdate();

				response.sendRedirect("info.jsp?type=regok");

				//request.setAttribute("type", "regok");
			}
			
			//request.getRequestDispatcher("info.jsp");
				
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			
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
