<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML>
<html>
<head>
<title>登录界面</title>
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
 request.setCharacterEncoding("utf-8");
String error=request.getParameter("error");
String error1=request.getParameter("error1");
if(error==null) error="";
if(error1==null) error1="";
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
                                <li><a href="#" onClick="f()">增/删图书</a></li>
								<li><a href="login.jsp">注册/登录</a></li>
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
		  	  <form action="login_check.jsp" method="post"> 
				 <div class="register-top-grid">
					<h3>用户登录</h3>
					 <div class="wow fadeInLeft" data-wow-delay="0.4s">
						<span>帐号<label>*</label></span>
						<input type="text"  maxlength="16" name="cardid" required><br><font color="#FF0000"><%=error%>
					</font> </div>
                     <br><br><br><br> <br>
							 <div class="wow fadeInLeft" data-wow-delay="0.4s">
								<span>密码<label>*</label></span>
								<input type="password" maxlength="16" name="pwd" required><br><font color="#FF0000"> <%=error1%></font>
							 </div>
                             <br><br><br><br>
					 </div>
				
				<div class="clearfix"> </div>
				<div class="register-but">
					   <input type="submit" value="登录">&nbsp;&nbsp;
                       <a href="register.html" >注册新账号</a>
					   <div class="clearfix"> </div>
				   </form>
				</div>
		   </div>
		 </div>
	
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
                <th width="33.3%"><a href="http://hometown.scau.edu.cn/bbs/" target="_blank">华南农业大学红满堂论坛</a></th>
                <th width="33.3%"><a href="http://hometown.scau.edu.cn/official/" target="_blank">红满堂工作室官网</a></th>
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