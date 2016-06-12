<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="scau.ifour.*"%>
<jsp:useBean id="sqlconnection" scope="page" class="scau.ifour.MqlConnectionOfLibrary"></jsp:useBean>

<!DOCTYPE HTML>
<html>
<head>
<title>增加图书</title>
<style type="text/css">

.register{
	text-align:center;
}
.picture{
	text-align:center;
	position:absolute;
	left:550px;
	 top: 750px;
	}
.blank{
		color:#333;	
    line-height:normal;
    font-family:"Microsoft YaHei",Tahoma,Verdana,SimSun;
    font-style:normal;
    font-variant:normal;
    font-size-adjust:none;
    font-stretch:normal;
    font-weight:normal;
    margin-top:0px;
    margin-bottom:0px;
    margin-left:0px;
    padding-top:4px;
    padding-right:4px;
    padding-bottom:4px;
    padding-left:4px;
    font-size:15px;
    outline-width:medium;
    outline-style:none;
    outline-color:invert;
    border-top-left-radius:3px;
    border-top-right-radius:3px;
    border-bottom-left-radius:3px;
    border-bottom-right-radius:3px;
    text-shadow:0px 1px 2px #fff;
    background-attachment:scroll;
    background-repeat:repeat-x;
    background-position-x:left;
    background-position-y:top;
    background-size:auto;
    background-origin:padding-box;
    background-clip:border-box;
    	background-color:rgb(255,255,255);
    margin-right:8px;
    border-top-color:#ccc;
    border-right-color:#ccc;
    border-bottom-color:#ccc;
    border-left-color:#ccc;
    border-top-width:1px;
    border-right-width:1px;
    border-bottom-width:1px;
    border-left-width:1px;
    border-top-style:solid;
    border-right-style:solid;
    border-bottom-style:solid;
    border-left-style:solid;
	}
</style>
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
<!-- banner -->
<%
String cardid10=(String)session.getAttribute("cardid10");

%>
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
		<!-- banner -->
<!-- offers -->

           <form action="addbook_check.jsp" method="post" class="register" enctype="multipart/form-data">
         <a href="deletebook.jsp"><font color="#0000FF">删除书籍信息>></font></a><br><br>
			<p>书号:<input type="text" name="bookid" class="blank" required></p>
            <br>
            <p>书名：<input type="text" name="bookname" class="blank" required></p>
             <br>
            <p>作者：<input type="text" name="editor" class="blank" required></p>
             <br>
            <p>价格：<input type="text" name="price" class="blank" required></p>
             <br>
            <p>出版社：<input type="text" name="publish" class="blank" required></p>
             <br>
            <p>出版日期：<input type="date" name="pubdate" class="blank" required></p>
             <br>
            <p>库存：<input type="text" name="qty" class="blank" required></p>
             </br>
            简介：<input type="text" name="summary" class="blank" required><br><br>
           <center> 照片：<input id="viewFiles" type="file" name="photo" accept="image/jpeg"></center><br><br>
           <img id="viewImg" src="photo/nopicture.jpg" style="max-width:300px; max-height:300px"  /><br><br>
               <input type="submit" value="增加">
            </form>
            <script type="text/javascript">
(function () {
    var viewFiles = document.getElementById("viewFiles");
    var viewImg = document.getElementById("viewImg");
    function viewFile (file) {
        //通过file.size可以取得图片大小
        var reader = new FileReader();
        reader.onload = function( evt ){
            viewImg.src = evt.target.result;
        }
        reader.readAsDataURL(file);
    }
    viewFiles.addEventListener("change", function () {
        //通过 this.files 取到 FileList ，这里只有一个
        viewFile(this.files[0]);
    }, false);
})();
</script>
            
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