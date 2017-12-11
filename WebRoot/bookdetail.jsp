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

	<script language="javascript" type="text/javascript">
	function clearText(field)
	{
		if (field.defaultValue == field.value) field.value = '';
		else if (field.value == '') field.value = field.defaultValue;
	}
	</script>
    
    <script type="text/javascript">
		//响应用户购买商品的请求
		function addGoods(goodsId){
			
			//看看是否得到了书号//向servlet发出请求
			window.open("ShoppingClServlet?type=add&goodsIdpokey="+goodsId,"_self");
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
      <li><a href="ShoppingClServlet?type=cart">购物车</a></li>
      <li><a href="contact.jsp">联系我们</a></li>
    </ul>
  </div>
  <!-- end of templatemo_menu -->
  
  <div id="templatemo_content_wrapper">
    <div id="templatemo_content">
      <div id="side_column">
        <div class="side_column_box">
          <h2>畅销书排行榜</h2>
         
          <div class="news_section">
            <%
    	 Connection ct=null;
		 PreparedStatement ps=null;
		 ResultSet rs=null;
		 String bookname;
    	try {
			
			String sql="select top 10 * from books order by fans desc";
			
			 ct=new ConnDB().getConn();
			
			 ps=ct.prepareStatement(sql);
			
			 rs=ps.executeQuery();
			 int i = 1;
			 int bookid=0;
			
			%>
			<!-- 
			<center>
			 -->
			 <%
			while(rs.next()){
				bookid = rs.getInt(1);
				bookname = rs.getString(2);
				%>
				<big><%=i++%></big>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="bookdetail.jsp?bookid=<%=bookid%>"><%=bookname%></a><br>
				<%
			}
			%>
			<!--  
			</center>
			-->
			 <%
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
		
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
		}
    	
    %>
				
			
          </div>
          <div class="button_01" title="查看全部"><a href="allbooks.jsp">全部书籍</a></div>
        </div>
        <div class="side_column_box news_letter_box">
          <h2>搜书</h2>
          <form action="" method="post">
            <input type="text" value="请输入内容" name="q" size="10" class="inputfield" title="请输入内容" onfocus="clearText(this)" onblur="clearText(this)" />
            <input type="submit" name="Search" value="搜索" alt="Search" class="submitbutton" title="搜索" />
          </form>
        </div>
      </div>
      <!-- end of side column -->
      
      <div id="main_column">
        <div class="main_column_section">
       <%
       	Connection ct1=null;
		 PreparedStatement ps1=null;
		 ResultSet rs1=null;
		 String bookid = "0";
		 request.setCharacterEncoding("UTF-8");
		 bookid = request.getParameter("bookid");
    	try {
			
			String sql="select * from books where bookId = '"+bookid+"'";
			//String sql="select * from books where bookId = '1'";
			 ct=new ConnDB().getConn();
			
			 ps=ct.prepareStatement(sql);
			
			 rs=ps.executeQuery();
			
			%>
			<!-- 
			<center>
			 -->
			<%
			while(rs.next()){
				%>
				
				<table width="520" height="338" border="0">
  <tr>
    <td><img src="imgs/<%=rs.getString(5)%>"></td>
    <td><table width="299" height="245" border="0">
      <tr>
        <td><h2><%=rs.getString(2) %></h2></td>
      </tr>
      <tr>
        <td><%=rs.getString(9)%>&nbsp;著/出版日期：<%=rs.getString(11)%>/<%=rs.getString(7) %><br>
                       类别：<%=rs.getString(8) %>-<%=rs.getString(12) %><br>
      	 价格：<%=rs.getFloat(3) %>
        </td>
      </tr>
      <tr>
        <td>存货：<%=rs.getInt(4) %></td>
      </tr>
      <tr>
        <td><p>书籍相关：<%=rs.getString(10) %></p>
          <p>&nbsp;</p></td>
      </tr>
    </table></td>
  </tr>
  <tr>
	  <%
	 if(rs.getInt(4)> 0){
	   %>
    <td><input type="button" class="button_01" onClick="addGoods(<%=bookid%>);"  value="购买" /></td>
    
    <%}else{ %>
    <td><input type="button" class="button_01"  value="无法购买" /></td>
    <%} %>
    <td><a href="main.jsp">返回首页</a></td>
  </tr>
          </table>
<%
			}
			%>
			 <%
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
		
			if(rs1!=null){
				
				rs1.close();
				rs1=null;
			}
			if(ps1!=null){
				
				ps1.close();
				ps1=null;
			}
			if(ct1!=null){
				
				ct1.close();
				ct1=null;
		}
		}
       
        %> 
        
        
        </div>
        <div class="cleaner"></div>
      </div>
      <!-- end of main column -->
      
      <div class="cleaner"></div>
    </div>
    <!-- end of tempaltemo content -->
    
    <div id="templatemo_footer">
      <ul class="footer_menu">
        <li><a href="">首页</a></li>
        <li><a href="">注册</a></li>
        <li><a href="">我的博客</a></li>
        <li class="last_menu"><a href="">联系我们</a></li>
      </ul>
      Copyright © 2011  20082666| Designed by pokey</div>
    <div class="cleaner"></div>
  </div>
  <!-- end of templatemo_content_wrapper -->
</div>
<!-- end of templatemo_container -->
  </body>
</html>
