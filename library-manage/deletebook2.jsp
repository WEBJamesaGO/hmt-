<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.sql.*"%>
<%@ page import="scau.ifour.*"%>
<jsp:useBean id="sqlconnection" scope="page" class="scau.ifour.MqlConnectionOfLibrary"></jsp:useBean>
<!DOCTYPE HTML>
<html>
<head>
<title>增/删图书</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="图书,管理系统, 红满堂, 华农" />
<script type="applijewelleryion/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" />	
<script src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script>
function f(){
	alert("对不起，您无权操作此功能！");
	}

</script>
</head>
<body>
<%
String cardid10=(String)session.getAttribute("cardid10");

%>

<!-- banner -->
	<div class="banner1">
		<div class="header">
			<div class="container">
				<div class="logo">
					<h1><a href="index.jsp">工作室图书管理系统</a></h1>
				</div>
					<nav class="navbar navbar-default" role="navigation">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<!--/.navbar-header-->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li class="active"><a href="index.jsp">主页</a></li>
								<li><a href="allbooks.jsp">书库</a></li>
								<li><a href="returnbook.jsp">借/还图书</a></li>
                               <%
if(cardid10!=null&&cardid10.equals("admin")){
%>
                                <li><a href="addbook.jsp">增/删图书</a></li>
<%
}else{
%>   
           <li><a href="#" onClick="f()">增/删图书</a></li><%
}
%>                      
<%
if(cardid10==null){
%>
								<li><a href="login.jsp">登录/注册</a></li>
                                
<%
}else{
%> 
<li><a href="#" onClick="return false;">欢迎你，<%=cardid10%></a></li>
<li><a href="logout.jsp">退出</a></li>
<%
}
%>
							</ul>
						</div>
						<!--/.navbar-collapse-->
					</nav>
					<div class="clearfix"> </div>
			</div>
		</div>
	</div>	
    
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
request.setCharacterEncoding("utf-8");
String sql=null,id=null,id1=null,name=null,editor=null,price=null,publish=null,pubdate=null,summary=null,photo=null;
int qty=0;
id=request.getParameter("id");
sql="select * from book where bookid='"+id+"'";
try{
pstmt = sqlconnection.conn.prepareStatement(sql);
rs = pstmt.executeQuery();
while(rs.next()){
	id1=rs.getString(1);
	name=rs.getString(2);
	editor=rs.getString(3);
	price=rs.getString(4);
	publish=rs.getString(5);
	pubdate=rs.getString(6);
	qty=rs.getInt(7);
	summary=rs.getString(8);
	photo="photo/"+rs.getString(9);
	
	}
}catch (Exception e) {}	
%>
    
    	
		<!-- banner -->
<!-- offers -->
	<div class="offers">
		<div class="container">
		  <div class="clearfix"></div>
			<div class="offer-btm">
            
<%
if(id1==null){
%>
    <center>
    书号为<%=id%>的书籍不存在！<br><br>
    <a href="deletebook.jsp">返回</a>
    
    </center>
    <%
}else{
	%>
              <center>
             <form action="deletebook3.jsp" method="post">
             书号：<input type="text" name="id" value="<%=id%>" required readonly><br><br>
             书名：<input type="text" name="name" value="<%=name%>" required readonly><br><br>
             作者：<input type="text" name="editor" value="<%=editor%>" required readonly><br><br>
             价格：<input type="text" name="price" value="<%=price%>" required readonly><br><br>
             出版社：<input type="text" name="publish" value="<%=publish%>" required readonly><br><br>
             出版日期：<input type="text" name="pubdate" value="<%=pubdate%>" required readonly><br><br>
             库存：<input type="text" name="qty" value="<%=qty%>" required readonly><br><br>
             简介：<input type="text" name="summary" value="<%=summary%>" required readonly><br><br>
             <img src="<%=photo%>" style="max-height:300px; max-width:250px"><br><br>
             <input type="submit" value="删除"><br>
            <font color="#FF0000"> 注意：删除书籍会连带删除该书的借阅记录</font>
             <br><br>
             </form> 
            </center>  
              
              
<%
}
%>
			  <div class="clearfix"></div>
			</div>
		 </div>
	</div>
<!-- offers -->
<!-- footer -->
	<div class="footer">
		<div class="container">
       <table width="100%">
	  <caption><h4><b>友情链接：</b></h4></caption> 
      <style type="text/css">
      a:link {color: #ffccff} 
      a:visited {color: #660066} 
      a:hover {color: #33cccc} 
      a:active {color: #ffff33} 
      </style>
				<th width="33.3%"><a href="http://www.scau.edu.cn/">华南农业大学</a></th>
                <th width="33.3%"><a href="http://hometown.scau.edu.cn/bbs/">华南农业大学红满堂论坛</a></th>
                <th width="33.3%"><a href="http://hometown.scau.edu.cn/official/">红满堂工作室官网</a></th>
        </table>
<div class="clearfix"> </div>
		</div>
	</div>
	<div class="footer-bottom">
			<div class="container">
			  <p>© 2016 Studio books management system</p>
			</div>
		</div>
	<!-- footer -->
</body>
</html>