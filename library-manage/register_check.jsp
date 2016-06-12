<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="scau.ifour.*"%>
<jsp:useBean id="sqlconnection" scope="page" class="scau.ifour.MqlConnectionOfLibrary"></jsp:useBean>
<html>
<head>

<title>mysql数据库连接</title>
</head>
<body>
   
	<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String error=null;
	String sql=null;
	String cardid=null;
	String pwd=null;
	String pwd1=null;
	
	%>
    
<%
 request.setCharacterEncoding("utf-8");
%>
<%
cardid=request.getParameter("cardid");
pwd=request.getParameter("pwd");
pwd1=request.getParameter("pwd1");
if(cardid.equals("")||pwd.equals("")||pwd1.equals("")){
	error="未输入账号或密码！";
%>
<jsp:forward page="register_failure.jsp">
<jsp:param name="error" value="<%=error%>" />
</jsp:forward>

<%
}
else if(cardid.length()<6||pwd.length()<6){
	error="账号或密码的长度太短！（账号或密码必须不小于6个字符）";
%>
<jsp:forward page="register_failure.jsp">
<jsp:param name="error" value="<%=error%>" />
</jsp:forward>
<%	
}else if(!(pwd.equals(pwd1))){
	error="两次密码输入不一致！";
%>
<jsp:forward page="register_failure.jsp">
<jsp:param name="error" value="<%=error%>" />
</jsp:forward>	
    
<%
}
try{
sql="select cardid from reader where cardid='"+cardid+"'";
pstmt = sqlconnection.conn.prepareStatement(sql);
rs = pstmt.executeQuery();
}catch (Exception e) {}	
while(rs.next()) {
error="账号"+rs.getString(1)+"已存在！";

%>
<jsp:forward page="register_failure.jsp">
<jsp:param name="error" value="<%=error%>" />
</jsp:forward>

<%
}
try{
sql="insert into reader(cardid,pwd) values('"+cardid+"','"+pwd+"')";
pstmt = sqlconnection.conn.prepareStatement(sql);
pstmt.executeUpdate();
session.setAttribute("cardid10",cardid);

}catch (Exception e) {}	
%>
<jsp:forward page="index.jsp"></jsp:forward>

</body>
</html>
