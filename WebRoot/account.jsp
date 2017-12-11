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
UserBean ub = (UserBean)request.getSession().getAttribute("loginUserinfo");
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

	<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
	<script src="SpryAssets/SpryValidationPassword.js" type="text/javascript"></script>
	<script language="javascript" type="text/javascript">
	function clearText(field)
	{
		if (field.defaultValue == field.value) field.value = '';
		else if (field.value == '') field.value = field.defaultValue;
	}
	</script>
  <link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css" />
  <link href="SpryAssets/SpryValidationPassword.css" rel="stylesheet" type="text/css" />
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
      <li><a href="login.jsp" class="current">账户管理</a></li>
      <li><a href="ShoppingClServlet?type=cart">购物车</a></li>
      <li><a href="contact.jsp">联系我们</a></li>
    </ul>
  </div>
  <!-- end of templatemo_menu -->
  <div id="templatemo_content_wrapper">
    <div id="templatemo_content">
    <big><form action="accountClServlet?type=alter" method="post">
    <table width="591" height="560" border="0">
    <tr>
    <td align="center" width="500"><a href="pay.jsp">继续付款？请点击付款</a></td>
  </tr>
  <tr>
    
    <td width="280">
    <tr>
      	<td > 当前显示的账户信息：</td>
      	<td >账户名称：<%=ub.getUsername() %></td>
    </tr>
    	</td>
    <td>（输入新值以修改）</td>
  </tr>
  <tr>
    <td align="right">登录密码：</td>
    <td width="252"><span id="sprypassword1">
      <input name="passwd" type="password" class="inputfield" id="passwd" value="<%=ub.getPasswd() %>"/>
      <span class="passwordRequiredMsg">需要输入一个值。</span></span></td>
  </tr>
  <tr>
    <td align="right">真实姓名：</td>
    <td><span id="sprytextfield2">
      <input name="truename" type="text" class="inputfield" id="truename" value="<%=ub.getTruename() %>"/>
      <span class="textfieldRequiredMsg">需要提供一个值。</span></span></td>
  </tr>
  <tr>
    <td align="right">电子邮件：</td>
    <td><span id="sprytextfield3">
      <input name="email" type="text" class="inputfield" id="email" value="<%=ub.getEmail() %>"/>
      <span class="textfieldRequiredMsg">需要提供一个值。</span></span></td>
  </tr>
  <tr>
    <td align="right">联系电话：</td>
    <td><span id="sprytextfield4">
      <input name="phone" type="text" class="inputfield" id="phone" value="<%=ub.getPhone() %>"/>
      <span class="textfieldRequiredMsg">需要提供一个值。</span></span></td>
  </tr>
  <tr>
    <td align="right">联系地址：</td>
    <td><span id="sprytextfield5">
      <input name="addr" type="text" class="inputfield" id="addr" value="<%=ub.getAddress() %>"/>
      <span class="textfieldRequiredMsg">需要提供一个值。</span></span></td>
  </tr>
  <tr>
    <td align="right">邮政编码：</td>
    <td><span id="sprytextfield6">
      <input name="postcode" type="text" class="inputfield" id="postcode" value="<%=ub.getPostcode() %>"/>
      <span class="textfieldRequiredMsg">需要提供一个值。</span></span></td>
  </tr>
  <tr>
    <td align="right">用户级别：</td>
    <td><%=ub.getGrade() %></td>
  </tr>
  <tr>
    <td align="right">累计消费：</td>
    <td><%=ub.getConsuption() %></td>
  </tr>
  <tr>
    <td align="right">账户余额：</td>
    <td><%=ub.getAccRemain() %></td>
  </tr>
  <tr>
  	<td align="right">点击<input type="submit" name="button" id="button" value="修改资料" /></td>
  	<td ><a href="charge.jsp">账户充值</a></td>
  </tr>
  </table>
</form>
</big>
<hr />
<table border="0">
  <tr>
    <td align="center" colspan="2"><big>我的订单</big></td>
  </tr>
    </table>



		
	<%
		int userid = ub.getUserid();
		OrderBeanBo odbb = new OrderBeanBo();
		ArrayList orderal = odbb.myOrders(userid);
		
		for(int i=0;i<orderal.size();i++){
		  	OrderBean odb=(OrderBean)orderal.get(i);
		  	%>
		  	<table width="679" height="139" border="1">
		  	<tr>
		    <td width="120" height="32" align="center">订单号</td>
		    <td width="138" align="center">总价</td>
		    <td width="260" align="center">状态</td>
		    <td width="143" align="center">日期</td>
		  	</tr>
		  	<tr>
			    <td height="30" align="center"><%=odb.getOrdersId()%></td>
	        <td align="center">¥<%=odb.getTotalPrice()%></td>
			    <td align="center"><%
				    if(odb.getIsPayed()==1){
				    %>
				    已付款
				    <%
				    }else{
				    %>
				   待付款<div class="button_01" title="付款"><a href="payedClServlet2?orderid=<%=odb.getOrdersId() %>">付款</a></div>
				   
				   <%} %>
				   <a href="accountClServlet?type=delorder&orderid=<%=odb.getOrdersId() %>">删除</a>
				</td>
			    <td align="center"><%=odb.getOrderDate()%></td>
		    <tr>
		  		<td height="29" align="center">&nbsp;</td>
			    <td align="center">书号</td>
		  		<td align="center">书名</td>
			    <td align="center">数量</td>
		  	</tr>
		  	<%
		  		ArrayList ordercontental = odbb.myOrderContent(odb.getOrdersId());
		  		for(int j=0;j<ordercontental.size();j++){
		  		OrderDetailBean oddb = (OrderDetailBean)ordercontental.get(j);
		  	%>
		  	<tr>
		  		<td height="29" align="center">&nbsp;</td>
			    <td align="center"><%=oddb.getGoodsId()%></td>
		  		<td align="center"><%=oddb.getGoodsName()%></td>
			    <td align="center"><%=oddb.getNums()%></td>
		  	</tr>
		  	<%
		  	}%>
		  	</table>
		  	<%
		  	}
		  	 %>

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
