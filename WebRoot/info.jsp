<%@ page language="java" import="java.util.*,
								com.pokey.model.*,
								java.sql.Connection,
								java.sql.PreparedStatement,
								java.sql.ResultSet,
								java.sql.*" 
								pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  
    <base href="<%=basePath%>">
    
    <title>Welcome To Pokey's Online Book Shop </title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="pokey,book,shop">
	<meta http-equiv="description" content="simple orange">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<!--  
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<STYLE type=text/css>
		table{ margin:20px auto;}
	</STYLE>
	
	<link href="style.css" rel="stylesheet" type="text/css" />

</head>
 
  <body>
  <div id="templatemo_container">
  <div id="templatemo_site_title_bar">
    <div id="site_title">
      <h1><img src="images/templatemo_logo.jpg" alt="welcome"><span>Pokey的网上书店</span></h1>
    </div>
  </div>
  <!-- end of templatemo_site_title_bar -->
  <div>
  </div>
  <div id="templatemo_menu">
    <ul>
      <li><a href="main.jsp">首页</a></li>
      <li><a href="register.jsp">注册</a></li>
      <li><a href="accountClServlet?type=login" >账户管理</a></li>
      <li><a href="ShoppingClServlet?type=cart">购物车</a></li>
      <li><a href="contact.jsp">联系我们</a></li>
    </ul>
  </div>
  <!-- end of templatemo_menu -->
  <div id="templatemo_content_wrapper">
    <div id="templatemo_content"> 
     
     <div id="side_column">&nbsp;&nbsp;&nbsp;&nbsp;
    	<p><img border="0" src="images/lock.png" width="131" height="125"/>&nbsp; <br /></p>&nbsp;&nbsp;&nbsp; 
   	  <p><img border="0" src="images/reg.png" width="188" height="80"/></p><br /></div>
     <div id="main_column">
     
     <%
     	response.setCharacterEncoding("utf-8");
     	String type = request.getParameter("type");
     	if(type.equals("regfail")){
     		%> 
     		<center>
     		<br>
     		<br>
     		<br>
     		<h1>注册失败！</h1><br>
     		<big>请修改用户名后重新注册，点击<a href="register.jsp">返回</big></a>
     		</center>
     		<%
     	}else if(type.equals("regok")){
     	%>
     		<center>
     		<br>
     		<br>
     		<br>
     		<h1>注册成功！</h1><br>
     		</center>
     		<%
     	}else if(type.equals("payfail"))
     	{
     	%> 
     		<center>
     		<br>
     		<br>
     		<br>
     		<h1>余额不足，付款失败！</h1><br>
     		<big>请充值后重新付款，点击<a href="charge.jsp">充值</big></a>
     		</center>
     		<%
     	}
     	else if(type.equals("payok")){
     	%> 
     		<center>
     		<br>
     		<br>
     		<br>
     		<h1>付款成功！</h1><br>
     		<big>交易已经完成，请等待收货，如有问题请<a href="contact.jsp">与我们联系</a></big>
     		</center>
     		<%
     	}else if(type.equals("accalterok")){
     	%>
     		<center>
     		<br>
     		<br>
     		<br>
     		<h1>修改成功！</h1><br>
     		<big>请<a href="accountClServlet?type=login">重新登录</big></a>
     		</center>
     	<%
     	}else if(type.equals("chargeok")){
     	%>
     		<center>
     		<br>
     		<br>
     		<br>
     		<h1>充值成功！</h1><br>
     		<big>点击<a href="accountClServlet?type=login">查看</big></a>
     		</center>
     		<%
     	}else if(type.equals("timeout")){
     	%>
     		<center>
     		<br>
     		<br>
     		<br>
     		<h1>操作超时！</h1><br>
     		<big>请重新登录</big></a>
     		<form action="loginClServlet" method="post">
		        <big><table width="374" border="0">
		      <tr>
		        <td align="right" width="95" height="66">用户名：</td>
		        <td width="269"><span id="sprytextfield1">
		          <input name="username" type="text" class="inputfield" id="username" />
		          <span class="textfieldRequiredMsg">需要提供一个值。</span></span></td>
		      </tr>
		      <tr>
		        <td align="right" height="63">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
		        <td><span id="sprypassword1">
		          <input name="passwd" type="password" class="inputfield" id="passwd" />
		          <span class="passwordRequiredMsg">需要输入一个值。</span></span></td>
		      </tr>
		      <tr>
		        <td align="right" height="57"><a href="register.jsp">新用户注册</a></td>
		        <td height="57">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="button" type="submit" class="button_01" id="button" value=" 登  录 " /></td>
		        </tr>
		    </table></big>
			</form>
     		</center>
     		<%
     	}else if(type.equals("delodok")){
     	%>
     		<center>
     		<br>
     		<br>
     		<br>
     		<h1>删除成功！</h1><br>
     
	<%}else if(type.equals("delodfail")){
     	%>
     		<center>
     		<br>
     		<br>
     		<br>
     		<h1>删除失败！</h1><br>
     
	<%} %> 
     
		
     </div>
      <div class="cleaner"></div>
    </div>
    <!-- end of tempaltemo content -->
    
    <div id="templatemo_footer">
      <ul class="footer_menu">
        <li><a href="main.jsp">首页</a></li>
        <li><a href="register.jsp">注册</a></li>
        <li><a href="http://blog.csdn.net/pokey20082666">我的博客</a></li>
        <li class="last_menu"><a href="contact.jsp">联系我们</a></li>
      </ul>
      Copyright © 2011  20082666| Designed by pokey</div>
    <div class="cleaner"></div>
  </div>
  <!-- end of templatemo_content_wrapper -->
</div>
<!-- end of templatemo_container -->

  </body>
</html>
