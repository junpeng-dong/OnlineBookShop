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
    <link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css" />
  	<link href="SpryAssets/SpryValidationPassword.css" rel="stylesheet" type="text/css" />

	<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
	<script src="SpryAssets/SpryValidationPassword.js" type="text/javascript"></script> 
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
      <li><a href="#" class="current">注册</a></li>
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
     	<form action="registerCl" method="post" name="reg" >
     	  <p><h2><center>用户注册</center></h2></p><table border="0" width="200" style="height: 285px; width: 539px;">
			<tbody><tr>
			<td width="145">用户名：</td>
			<td width="384"><span id="sprytextfield1">
			    <input name="username" type="text" class="inputfield" id="username" />
			  <span class="textfieldRequiredMsg">需要提供一个值。</span></span></td></tr>
			<tr>
			<td>密码：</td>
			<td><span id="sprypassword1">
			  <input name="passwd" type="password" class="inputfield" id="passwd" />
			  <span class="passwordRequiredMsg">需要输入一个值。</span></span></td></tr>
			<tr>
			<td>真实姓名：</td>
			<td><span id="sprytextfield2">
			  <input name="truename" type="text" class="inputfield" id="truename" />
			  <span class="textfieldRequiredMsg">需要提供一个值。</span></span></td></tr>
			<tr>
			<td>E-mail：</td>
			<td><span id="sprytextfield3">
			  <input name="email" type="text" class="inputfield" id="email" />
			  <span class="textfieldRequiredMsg">需要提供一个值。</span></span></td></tr>
			<tr>
			<td>联系电话：</td>
			<td><span id="sprytextfield4">
			  <input name="phone" type="text" class="inputfield" id="phone" />
			  <span class="textfieldRequiredMsg">需要提供一个值。</span></span></td></tr>
			<tr>
			<td>联系地址：</td>
			<td><span id="sprytextfield5">
			  <input name="addr" type="text" class="inputfield" id="addr" />
			  <span class="textfieldRequiredMsg">需要提供一个值。</span></span></td></tr>
			<tr>
			<td>邮政编码：</td>
			<td><span id="sprytextfield6">
			  <input name="post" type="text" class="inputfield" id="post" />
			  <span class="textfieldRequiredMsg">需要提供一个值。</span></span></td></tr>
			</tbody></table><p>&nbsp;</p><p>
			  <center><input name="submit" type="submit" class="button_01" id="submit" value="提交" "/></center>
			</p>
			<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p></form>
		
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
  <script type="text/javascript">
<!--
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1");
var sprypassword1 = new Spry.Widget.ValidationPassword("sprypassword1");
var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2");
var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3");
var sprytextfield4 = new Spry.Widget.ValidationTextField("sprytextfield4");
var sprytextfield5 = new Spry.Widget.ValidationTextField("sprytextfield5");
var sprytextfield6 = new Spry.Widget.ValidationTextField("sprytextfield6");
//-->
  </script>
  </body>
</html>
