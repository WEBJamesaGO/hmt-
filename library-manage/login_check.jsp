<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.sql.*"%>
<%@ page import="scau.ifour.*"%>
<jsp:useBean id="sqlconnection" scope="page" class="scau.ifour.MqlConnectionOfLibrary"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
<%
String cardid=null,pwd=null,sql=null,cardid1=null,pwd1=null,error=null,error1=null;
PreparedStatement pstmt = null;
ResultSet rs = null;
request.setCharacterEncoding("utf-8");
cardid=request.getParameter("cardid");
pwd=request.getParameter("pwd");
sql="select * from reader where cardid='"+cardid+"'";
try{
pstmt = sqlconnection.conn.prepareStatement(sql);
rs = pstmt.executeQuery();
while(rs.next()){
	cardid1=rs.getString(1);
	pwd1=rs.getString(2);
	}
}catch (Exception e) {}	

	if(cardid1==null){
		error="账号不存在，请重新输入！";
		
%>
<jsp:forward page="login.jsp">
<jsp:param name="error" value="<%=error%>" ></jsp:param>
</jsp:forward>
<%
	}
	else if(!(pwd.equals(pwd1))){
		error1="密码错误！";
		
%>
<jsp:forward page="login.jsp">
<jsp:param name="error1" value="<%=error1%>" ></jsp:param>
</jsp:forward>
<%
		}else{
			session.setAttribute("cardid10",cardid);
			
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
			}
	
%>
</body>
</html>