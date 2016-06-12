<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="scau.ifour.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<jsp:useBean id="sqlconnection" scope="page"
	class="scau.ifour.MqlConnectionOfLibrary"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
<%
        PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		String fileName = "default.jpg";
		String photo = null;
		String error = null;
		int i = 0;
		String sql = null;
		int count=0;
		String count1=null;
		int id = 0;
		int n = 0;
		String[] a = new String[8];
		
		
		File file = null; //定义保存的文件
		InputStream input = null; //定义文件的输入流，用于读取源文件
		OutputStream output = null;
		List<FileItem> items = null;
		Iterator<FileItem> iter = null;
	%>

	<%
		request.setCharacterEncoding("utf-8");
	%>


	<%
		//创建磁盘工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();
		//设置临时文件夹
		factory.setRepository(new File(this.getServletContext().getRealPath("/Studio books management system/") + "temp"));
		//创建处理工具
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("utf-8");
		try {
			//设置最大上传文件大小为3MB
			upload.setFileSizeMax(3145728);
			//接收全部内容
			items = upload.parseRequest(request);
			//将全部内容变为Iterator实例
			iter = items.iterator();
		} catch (Exception e) {
	%>
	<jsp:forward page="addbook_failure.jsp">
		<jsp:param name="error" value="图片太大！"></jsp:param>
	</jsp:forward>
	<%
		}
		//依次取出每一个内容
		while (iter.hasNext()) {
			//取出每一个上传的文件
			FileItem item = iter.next();
			//得到表单控件的名称
			String fieldName = item.getFieldName();
			//不是普通的文本数据，是上传文件
			if (!item.isFormField()) {
	
				try {
					sql = "select bookid from book where bookid='" + a[0]
							+ "'";
					pstmt = sqlconnection.conn.prepareStatement(sql);
					rs = pstmt.executeQuery();

					if (rs.next()) {
						String s ="书号为"+ a[0] + "的书本已存在！";
	%>
	<jsp:forward page="addbook_failure.jsp">
		<jsp:param name="error" value="<%=s%>"></jsp:param>
	</jsp:forward>

	<%
		}
				} catch (Exception e) {
					System.out.println(e);
				}

				try {
					//定义文件的输出流，用于保存文件
					input = item.getInputStream();
					//取得上传文件的输入流
					if (item.getName().split("\\.")[1].equals("jpg"))
						fileName = a[0] + "."+ item.getName().split("\\.")[1];
					else {
	%>
	<jsp:forward page="addbook_failure.jsp">
		<jsp:param name="error" value="图片格式错误！" />
	</jsp:forward>

	<%
		}} catch (Exception e) {
					fileName = "nopicture.jpg";
					i = 1;
				}
				
try{
					//定义输出文件路径
			output = new FileOutputStream(new File(this.getServletContext().getRealPath("/Studio books management system/")+ "photo"+ File.separator+ a[0]+ "."+ item.getName().split("\\.")[1]));
				} catch (Exception e) {
					
				}	

				byte data[] = new byte[512]; //分块保存
				int temp = 0;

				while ((temp = input.read(data, 0, 512)) != -1) {//依次读取内容
					output.write(data); //保存内容
				}
				input.close();
				if (i == 0) //关闭输入流
					output.close(); //关闭输出流
			} else {
				a[n] = item.getString(); //取得表单内容
				a[n] = new String(
						(item.getString("iso8859-1")).getBytes("iso8859-1"),
						"UTF-8");
				n = n + 1;
			}
		}
	
		try {
			String sql1 = "insert into book(bookid,bookname,editor,price,publish,pubdate,qty,summary,photo) values('"
					+ a[0]
					+ "','"
					+ a[1]
					+ "','"
					+ a[2]
					+ "','"
					+ a[3]
					+ "','"+a[4]+"','"+a[5]+"','"+a[6]+"','"+a[7]+"','" + fileName + "')";
			pstmt = sqlconnection.conn.prepareStatement(sql1);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
			error = "未知错误！";
%>
<jsp:forward page="addbook_failure.jsp">
<jsp:param name="error" value="未知错误！" />
</jsp:forward>

<%	
		} finally {
			try {
				rs.close();
				pstmt.close();
				sqlconnection.conn.close();
			} catch (Exception e) {
			}
		}
	%>
    
    <jsp:forward page="addbook_success.jsp">
    <jsp:param name="bookid" value="<%=a[0]%>"></jsp:param>
    <jsp:param name="bookname" value="<%=a[1]%>"></jsp:param>
    </jsp:forward>
</body>
</html>