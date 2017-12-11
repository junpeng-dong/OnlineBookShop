<%@ page language="java" import="java.util.*,com.pokey.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
OrderInfoBean oib=(OrderInfoBean)request.getAttribute("orderinfobean");
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

	<script language="javascript" type="text/javascript">
	</script>
  </head>
 
  <body>
    <div id="templatemo_container">
  <div id="templatemo_site_title_bar">
    <div id="site_title">
      <h1><img src="images/templatemo_logo.jpg" alt="welcome"><span>Pokey的网上书店</span></h1>
    </div>
  </div>
  <!-- end of templatemo_site_title_bar -->
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
    
    
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="comm">
      <tr>
        <td colspan="9" align="center"><img src="images/cartnavi-4.gif" width="599" height="49" /></td>
      </tr>
      <tr>
        <td height="34" colspan="9" align="center">订单详细信息</td>
      </tr>
      <tr>
        <td width="9%" height="32" align="center">订单号</td>
        <td width="11%" align="center">收货人</td>
        <td width="14%">收货地址</td>
        <td width="8%">邮编</td>
        <td width="11%">电话</td>
        <td width="9%">总价</td>
        <td width="11%">用户名</td>
        <td width="20%">电子邮件</td>
      </tr>
      <tr><%
      if(oib!= null) 
      {
      %>
        <td height="34" align="center"><%=oib.getOrdersId() %></td>
        <td align="center"><%=oib.getTruename() %></td>
        <td><%=oib.getAddress() %></td>
        <td><%=oib.getPostcode() %></td>
        <td><%=oib.getPhone() %></td>
        <td>¥<%=oib.getTotalPrice() %></td>
        <td><%=oib.getUsername() %></td>
        <td><%=oib.getEmail() %></td>
        
      </tr>

      <tr>
        <td height="56" colspan="9" align="center"><br/>          
          您的订单已经完成，请仔细审核订单信息，并<a href="payedClServlet?orderid=<%=oib.getOrdersId() %>">确认付款</a></td>
        </tr>
        <%}else{ %>
        <tr>
        <td align="center">无订单！</td>
        </tr>
         <%} %>
    </table>
    
    
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
