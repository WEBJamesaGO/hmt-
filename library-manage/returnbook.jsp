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
String sql=null;
String[] id1=null,name=null,editor=null,bdate=null,sdate=null;
int qty=0,n=0;

sql="select bookid from borrow where cardid='"+cardid10+"'";
try{
pstmt = sqlconnection.conn.prepareStatement(sql);
rs = pstmt.executeQuery();
while(rs.next()){
	n++;
	}
}catch (Exception e) {}	
id1=new String[n];
name=new String[n];
editor=new String[n];
bdate=new String[n];
sdate=new String[n];

int n1=0;
sql="select bookid,bdate,sdate from borrow where cardid='"+cardid10+"' order by bdate";

try{
pstmt = sqlconnection.conn.prepareStatement(sql);
rs = pstmt.executeQuery();
while(rs.next()){
	id1[n1]=rs.getString(1);
	bdate[n1]=rs.getString(2);
	sdate[n1]=rs.getString(3);
	if(sdate[n1]==null) sdate[n1]="";
	n1++;
	}
}catch (Exception e) {}	

for(int i=0;i<n;i++){

sql="select bookname,editor from book where bookid='"+id1[i]+"'";
try{
pstmt = sqlconnection.conn.prepareStatement(sql);
rs = pstmt.executeQuery();
while(rs.next()){
	name[i]=rs.getString(1);
	editor[i]=rs.getString(2);
	}
}catch (Exception e) {}	
}




int m=0;
sql="select bookid from borrow where cardid='"+cardid10+"' and sdate is null";  //统计未还书的数量
try{
pstmt = sqlconnection.conn.prepareStatement(sql);
rs = pstmt.executeQuery();
while(rs.next()){
	m++;
	}
}catch (Exception e) {}	


%>	
		<!-- banner -->
<!-- offers -->
	<div class="offers">
		<div class="container">
		  <div class="clearfix"></div>
			<div class="offer-btm">
！        
<center>
你还有<font color="#FF0000"><%=m%></font>本书未还
<table border="1">
<tr><td width="100px"><b>书号</b></td><td width="200px"><b>书名</b></td><td width="90px"><b>作者</b></td><td width="120px"><b>借书日期</b></td><td width="120px"><b>还书日期</b></td>
<td width="120px"><b>备注</b></td>
<td width="100px"><b>操作</b></td></tr>
<%
for(int i=0;i<n;i++){  //循环输出借阅记录
	
%>
<tr><td><%=id1[i]%></td><td><%=name[i]%></td><td><%=editor[i]%></td><td><%=bdate[i]%></td><td><%=sdate[i]%></td>
<td>
<%
if(sdate[i].equals("")){
%>
<font color="#FF0000">未还</font>
<%
}else{
%>
已还
<%
}
%>
</td>
<td>
<%
if(sdate[i].equals("")){
%>


<a href="returnbook_success.jsp?cardid=<%=cardid10%>&bookid=<%=id1[i]%>&bdate=<%=bdate[i]%>"><font color="#0000FF">还书</font></a>
<%
}else{
%>
不可操作
<%
}
%>
</td></tr>

<%
}
%>

</table>

</center>
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