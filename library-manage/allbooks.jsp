
<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="scau.ifour.*"%>
<jsp:useBean id="sqlconnection" scope="page" class="scau.ifour.MqlConnectionOfLibrary"></jsp:useBean>
<!DOCTYPE HTML>
<html>
<head>
<title>书库</title>
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
	function f3(){
		alert(请先登录);
		}
	
	</script>
    <script>
function f(){
	alert("对不起，您无权操作此功能！");
	}

</script>
</head>
<body>
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
<%
String cardid10=(String)session.getAttribute("cardid10");

%>
						<!--/.navbar-header-->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li class="active"><a href="index.jsp">主页</a></li>
								<li><a href="allbooks.jsp">书库</a></li>
								<li><a href="returnbook.jsp">借/还图书</a></li>
<%
if(cardid10!=null&&cardid10.equals("admin")){
%>
                                <li><a href="addbook.html">增/删图书</a></li>
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
	String error=null;
	String sql=null;
	int count=0;
	int count1=0;
	int n=0;
	
	String bookid[]=null;
	String bookname[]=null;
	String editor[]=null;
	String price[]=null;
	String publish[]=null;
	String pubdate[]=null;
	String qty[]=null;
	String summary[]=null;
    String photo[]=null;
	int bb=0;
	

%>
<%
 request.setCharacterEncoding("utf-8");
%>
<%


sql="select bookid from book";

try{
	pstmt = sqlconnection.conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
	while(rs.next()) {
		count++;
	}}catch (Exception e) {}	
	if(count!=0){
	bookid=new String[count];
	bookname=new String[count];
	editor=new String[count];
	price=new String[count];
	publish=new String[count];
	pubdate=new String[count];
	qty=new String[count];
	summary=new String[count];
	photo=new String[count];
	}else error="无搜索结果！";
	
sql="select * from book";

try{
	pstmt = sqlconnection.conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
	while(rs.next()) {
		bookid[count1]=rs.getString(1);
		bookname[count1]=rs.getString(2);
		editor[count1]=rs.getString(3);
		price[count1]=rs.getString(4);
		publish[count1]=rs.getString(5);
		pubdate[count1]=rs.getString(6);
		qty[count1]=rs.getString(7);
		summary[count1]=rs.getString(8);
		if(summary[count1].length()>20){
			summary[count1]=summary[count1].substring(0,19)+"...";
			}
		photo[count1]="photo/"+rs.getString(9);
		count1++;
		if(count1==count) break;
	}}catch (Exception e) {}	
%>




    
    
    
    	
		<!-- banner -->
<!-- offers -->
	<div class="offers">
		<div class="container">
        <h4>一共有<font color="#FF0000"><%=count%></font>个结果</h4><br>
<%
        for(int i=0;i<count;i++){
		
%>
			<div class="col-md-4 offers-left">
				<h3><%=bookname[i]%></h3>
				<img src="<%=photo[i]%>" style="width:100px; height:120px" class="img-responsive" alt="">
				<h4>书号：<%=bookid[i]%></h4>
				<p>作者：<%=editor[i]%></p>
                <p>价格：<%=price[i]%></p>
                <p>出版社：<%=publish[i]%></p>
                <p>出版日期：<%=pubdate[i]%></p>
                <p>库存：<%=qty[i]%></p>
                <p>简介：<%=summary[i]%></p>
                <%
				if(qty[i].equals("0")){
				%>
                <a class="hvr-shutter-in-horizontal" onClick="return false;"><font color="#FFFFFF">库存为空</font></a>
                <%
				}else{
					if(cardid10==null){
				%>
                <a onClick="return false;" class="hvr-shutter-in-horizontal" href="#"><font color="#FFFFFF">登录后即可借阅</font></a>
                
                <%
					}else{
				%>
				<a class="hvr-shutter-in-horizontal" href="borrowsuccess.jsp?n=<%=bookid[i+n]%>"><font color="#FFFFFF">借阅</font></a>
                
                
                <%
				}}
				%>
			</div>
            
           
				<%
		}
			%>
			<div class="clearfix"></div>
			<div class="offer-btm">
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