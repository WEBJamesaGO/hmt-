<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="scau.ifour.*"%>
<jsp:useBean id="sqlconnection" scope="page" class="scau.ifour.MqlConnectionOfLibrary"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>借阅结果</title>
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
	<div class="banner">
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
		<!-- banner -->
<!-- registration -->
	<div class="main-1">
		<div class="container">
			<div class="register">
		  	 
				 <div class="register-top-grid">
<%
request.setCharacterEncoding("utf-8");
%>
<center>
<%
String sql=null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String bookid=request.getParameter("n");;
int num=0;
String aa="";

	try{
sql="select bookid from borrow where bookid='"+bookid+"' and cardid='"+cardid10+"' and sdate is null";
pstmt = sqlconnection.conn.prepareStatement(sql);
rs=pstmt.executeQuery();
while(rs.next()){
	num=1;
	}
	}catch(Exception e){}
if(num==1){
%>
借阅失败！<br /><br />
原因：你已经借阅该本书了！<br /><br />
<%
}else{
	try{
sql="insert into borrow(bookid,cardid,bdate,sdate) values('"+bookid+"','"+cardid10+"',curdate(),null)";
pstmt = sqlconnection.conn.prepareStatement(sql);
pstmt.executeUpdate();
	}catch(Exception e){
		aa="发生了未知错误！";
		}
		if(aa.equals("")){
try{
sql="update book set qty=qty-1 where bookid='"+bookid+"'";
pstmt = sqlconnection.conn.prepareStatement(sql);
pstmt.executeUpdate();
%>
借阅成功！
<%
	}catch(Exception e){
		
		}
		}
%>
<%=aa%><br /><br />
<%
}
%>
<a href="index.jsp">返回首页</a>
</center>
					 <div class="wow fadeInLeft" data-wow-delay="0.4s">
				 
		   </div>
		 </div>
	</div></div>
    
    
    
<!-- registration -->
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
				<th width="33.3%"><a href="http://www.scau.edu.cn/" target="_blank">华南农业大学</a></th>
                <th width="33.3%"><a href="http://hometown.scau.edu.cn/bbs/">华南农业大学红满堂论坛</a></th>
                <th width="33.3%"><a href="http://hometown.scau.edu.cn/official/">红满堂工作室官网</a></th>
        </table>
<div class="clearfix"> </div>
		</div></div>
	
	<div class="footer-bottom">
			<div class="container">
			  <p>© 2016 Studio books management system</p>
			</div>
		</div>
	<!-- footer -->
</body>
</html>