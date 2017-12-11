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
UserBean ub=(UserBean)session.getAttribute("loginUserinfo");
ArrayList al=(ArrayList)request.getAttribute("mycartInfo");
MyCart mc=(MyCart)session.getAttribute("mycart");
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
      <li><a href="main.jsp" >首页</a></li>
      <li><a href="register.jsp">注册</a></li>
      <li><a href="accountClServlet?type=login" >账户管理</a></li>
      <li><a href="ShoppingClServlet?type=cart" class="current">购物车</a></li>
      <li><a href="contact.jsp">联系我们</a></li>
    </ul>
  </div>
  <!-- end of templatemo_menu -->
  <div id="templatemo_content_wrapper">
    <div id="templatemo_content">
    <big>
    <table width="615" border="0" height="688">
  <tr>
    <td><tr>
        <td height="42" align="center"><img src="images/cartnavi-3.gif" width="599" height="49" /></td>
      </tr>
      <tr>
        <td height="97"><table width="67%" border="0" align="center" cellpadding="0" cellspacing="0" class="comm" style="width: 559px;">
          <tr>
            <td height="32" colspan="2" align="center">收货人的信息</td>
          </tr>
          <tr>
            <td height="29" align="right">用 户 名：</td>
            <td width="52%"><input name="textfield" type="text" class="inputfield" value="<%=ub.getUsername() %>" /></td>
          </tr>
          <tr>
            <td height="28" align="right"><span style="color: red;">*</span>真实姓名：</td>
            <td><input name="textfield2"  type="text" class="inputfield" value="<%=ub.getTruename() %>" /></td>
          </tr>
          <tr>
            <td height="27" align="right"><span style="color: red;">*</span>联系地址：</td>
            <td><input name="textfield3" type="text" class="inputfield" value="<%=ub.getAddress() %>" /></td>
          </tr>
          <tr>
            <td height="31" align="right"><span style="color: red;">*</span>联系电话：</td>
            <td><input name="textfield4" type="text" class="inputfield" value="<%=ub.getPhone() %>" /></td>
          </tr>
          <tr>
            <td height="28" align="right"><span style="color: red;">*</span>电子邮件：</td>
            <td><input name="textfield5" type="text" class="inputfield" value="<%=ub.getEmail() %>" /></td>
          </tr>
          <tr>
            <td height="38" align="right"><span style="color: red;">*</span>邮　　编：</td>
            <td><input name="textfield6" type="text" class="inputfield" value="<%=ub.getPostcode() %>" /></td>
          </tr>
          <tr>
            <td height="58" colspan="2" align="right">
            <center>
            信息有误？请到<a href="accountClServlet?type=login">账户管理</a>修改
            </center>
            </td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td><center><table width="68%" border="0" align="center" cellpadding="0" cellspacing="0" class="comm">
          <tr>
            <td height="39" colspan="4" align="center">我的购物车</td>
          </tr>
          <tr>
            <td height="24" align="center">编号</td>
            <td align="center">商品名称</td>
            <td align="center">单价</td>
            <td align="center">数量</td>
          </tr>
          <%
          
          	for(int i=0;i<al.size();i++){
          	GoodsBean gb=(GoodsBean)al.get(i);
          		%>
          		<tr>
	            <td height="27" align="center"><%=gb.getGoodsId() %></td>
	            <td align="center"><%=gb.getGoodsName() %></td>
	            <td>¥<%=gb.getGoodsPrice() %></td>
	            <td><%=mc.goodsNum(gb.getGoodsId()+"") %></td>
          		</tr>
          		<%
          	}
           %>
          <tr>
            <td height="31" colspan="4">您共选择了价值¥<%=mc.getAllPrice() %>的商品。</td>
          </tr>
          <tr>
            <td height="40" colspan="4" align="center"><a href="ShoppingClServlet?type=cart">返回更改购物车</a></td>
          </tr>
        </table></center></td>
      </tr>
      <tr>
        <td align="right"><a href="payClServlet"><img border="0" src="images/cartnext.gif" /></a></td>
      </tr>
    </table></td>
  </tr></td>
  </tr>
</table></big>
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
