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
      <li><a href="#" class="current">首页</a></li>
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
			 int bookid = 0;
			
			%>
			
			 <%
			while(rs.next()){
				bookid = rs.getInt(1);
				bookname = rs.getString(2);
				%>
				<big><%=i++%></big>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="bookdetail.jsp?bookid=<%=bookid%>"><%=bookname%></a><br>
				<%
			}
			%>
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
          <form action="result.jsp" method="post">
            <input type="text"  name="q" size="10" class="inputfield" title="请输入内容" />
            <input type="submit" name="Search" value="搜索" alt="Search" class="submitbutton" title="搜索" />
          </form>
        </div>
      </div>
      <!-- end of side column -->
      <div id="main_column">
        <div class="main_column_section">
          <h2>欢迎来到我的网上书店 Simple Orange</h2> 
          <div class="section_w280 fl"><a href="http://blog.csdn.net/pokey20082666"><img border="0" src="images/pokey20082666.jpg" width="227" height="180"/></a>
           </div>
           <div class="section_w280 fr">
		         <big> 欢迎观临我的小站，本网上书店是我网络课程设计的辛苦的结晶，虽然由于时间有限，
		           书目与功能都不是很全面，有待改进，但是相关开发技术类似，通过本次课程设计，
		           完成了我的第一个网上购物网站，从中获得了很多宝贵的经验，如果有朋友需要引用
		           本网站的一些内容，请点击右边的图片进入我的博客与我联系，希望大家可以多多交
		           流，互相学习！</big>
           </div>
          <div class="cleaner_h30"></div>
          <div class="cleaner"></div>
        </div>
        <div class="cleaner_h60"></div>
        <div class="main_column_section">
          <h2>请选择书籍分类</h2>
          
          <div class="section_w280 fl"> <img class="image_wrapper fl_image" src="images/novel.png" alt="小说" width="117" height="93"/>
            <h3>
            <p><a href="subclass.jsp?class=11">悬疑</a> &nbsp; <a href="subclass.jsp?class=12">言情</a> &nbsp; 魔幻</p><p>科幻 &nbsp; 武侠&nbsp; 军事</p><p><a href="class.jsp?class=1">Read All...</a></p>
            </h3>
          </div>
          
          <div class="section_w280 fr"> <img class="image_wrapper fl_image" src="images/life.png" alt="生活" width="114" height="91"/>
            <h3>
            <p><a href="subclass.jsp?class=21">美食</a>&nbsp; <a href="subclass.jsp?class=22">旅游</a>&nbsp; 保健</p><p>家教&nbsp; 服饰<br /></p><p><a href="class.jsp?class=2">Read All...</a></p>
            </h3>
          </div>
          
          <div class="cleaner_h30"></div>
          
          <div class="section_w280 fl"> <img class="image_wrapper fl_image" src="images/tech.png" alt="科技" width="118" height="94"/>
            <h3>
            <p><a href="subclass.jsp?class=31">计算机</a>&nbsp; <a href="subclass.jsp?class=32">科普</a>&nbsp; 建筑</p><p>医学&nbsp; 工业&nbsp; 通信<br /></p><p><a href="class.jsp?class=3">Read All...</a></p>
            </h3>
          </div>
          
          <div class="section_w280 fr"> <img class="image_wrapper fl_image" src="images/art.png" alt="文艺" width="116" height="92"/>
            <h3>
            <p>文学&nbsp; 传记&nbsp; 艺术</a></p><p>摄影<br /></p><p>Read All...</p>
            </h3>
          </div>
        </div>
        <div class="cleaner"></div>
      </div>
      <!-- end of main column -->
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
