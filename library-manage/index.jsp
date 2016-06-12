<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="scau.ifour.*"%>
<jsp:useBean id="sqlconnection" scope="page" class="scau.ifour.MqlConnectionOfLibrary"></jsp:useBean>
<!DOCTYPE HTML>
<html>
<head>
<title>工作室图书管理系统</title>
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
		<div class="banner-info">
			<div class="container">
				<div class="details-1"><form action="result.jsp" method="post">
					<div class="col-md-10 dropdown-buttons">    		
						<div class="col-md-3 dropdown-button col-lg-6">           	
                       
							<div class="input-group">
								<input class="form-control has-dark-background" name="slider-name" id="slider-name" placeholder="关键字" type="text" required>
							</div>
						</div>
						<!---strat-date-piker---->
							<link rel="stylesheet" href="css/jquery-ui.css" />
							<script src="js/jquery-ui.js"></script>
							  <script>
									  $(function() {
										$( "#datepicker,#datepicker1" ).datepicker();
									  });
							  </script>
						<!---/End-date-piker---->

					  
					  <div class="col-md-3 dropdown-button col-lg-offset-1 col-lg-3">
					    <div class="section_1">
							 <select id="country" onchange="change_country(this.value)" class="frm-field required" name="sort1">
								<option value="bookname">书名</option>
								<option value="editor">作者</option>         
								<option value="publish">出版社</option>
							 </select>
						  </div>
						</div>
						<div class="clearfix"> </div>
					</div> 
					<div class="col-md-2 submit_button"> 
						
							<input type="submit" value="搜索"></div>
						</form>
					
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
	</div>		
	<!-- banner -->
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
				<th width="33.3%" ><a href="http://www.scau.edu.cn/" target="_blank">华南农业大学</a></th>
                <th width="33.3%" ><a href="http://hometown.scau.edu.cn/bbs/" target="_blank">华南农业大学红满堂论坛</a></th>
                <th width="33.3%" ><a href="http://hometown.scau.edu.cn/official/" target="_blank">红满堂工作室官网</a></th>
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