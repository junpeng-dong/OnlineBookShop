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
ArrayList al=(ArrayList)request.getAttribute("mycartGoods");
MyCart mc=(MyCart)request.getSession().getAttribute("mycart");
float total = 0f;
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
	function clearText(field)
	{
		if (field.defaultValue == field.value) field.value = '';
		else if (field.value == '') field.value = field.defaultValue;
	}
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
      <li><a href="ShoppingClServlet?type=cart" class="current">购物车</a></li>
      <li><a href="contact.jsp">联系我们</a></li>
    </ul>
  </div>
  <!-- end of templatemo_menu -->
  <div id="templatemo_content_wrapper">
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p><center><img border="0" src="images/cartnavi-1.gif" /></center></p>
    
 <form action="ShoppingClServlet?type=alter" method="post">
  <table width="601"  border="0" cellpadding="0" cellspacing="0" class="com" height="131">
      <tr>
        <td  width="20%" align="center">编号</td>
        <td width="27%" align="center">名称</td>
        <td width="26%" align="center">单价</td>
        <td colspan="3">数量</td>
      </tr>
	 	<tr><td colspan="6" bgcolor="#CCCCCC" height="5"></td></tr>
      
      <%
      
      
      	for(int i=0;i<al.size();i++){
      		
      		//取出GoodsBean
      		GoodsBean gb=(GoodsBean)al.get(i);
      		int num = Integer.parseInt(mc.goodsNum(gb.getGoodsId()+""));
      		total = total + gb.getGoodsPrice()*num;
      		%>
      		<tr>
	        <td align="center"><%=i%></td>
	        <td align="center"><a href="bookdetail.jsp?bookid=<%=gb.getGoodsId()%>"><%=gb.getGoodsName() %></a></td>
	        <td align="center">￥<%=gb.getGoodsPrice() %> </td>
	        <td width="10%"><input name="bookid" type="hidden" value="<%=gb.getGoodsId()%>" /><input name="num" type="text" size="6" value="<%=mc.goodsNum(gb.getGoodsId()+"") %>" /></td>
	        <%
	        	String goodsid = gb.getGoodsId()+""; 
	        	String href = "ShoppingClServlet?type=del&goodsIdpokey="+goodsid;
	        %>
	        <td width="10%" align="center"><a href="<%=href%>">删除</a></td>
	        <td width="7%" align="center"><a href="bookdetail.jsp?bookid=<%=gb.getGoodsId()%>">查看</a></td>
     		</tr>
	  		<tr><td colspan="6" bgcolor="#CCCCCC" height="5"></td></tr>
      		 <%
      	}
      
       %>
      
      <tr>
        <td><input name="bookid" type="hidden" value="0"/><input name="num" type="hidden" value="0"/></td>
        <td align="center"><a href="ShoppingClServlet?type=delall">删除全部书籍</a></td>
        <td align="center"><input name="Submit2" type="submit" class="button_01" value="修 改 数 量" /></td>
        <td colspan="3" align="right"><a href="ComShopping"><img border="0" src="images/cartnext.gif" width="87" height="20" /></a></td>
      </tr>
    </table>
 </form>
 <center>
 	<h3>
 		当前总价：￥<%=total %>，点击<a href="main.jsp">此处</a>继续购物
 	</h3>
 </center>
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
