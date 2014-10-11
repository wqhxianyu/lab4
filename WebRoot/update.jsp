<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>获取更新信息</title>
</head>
<body>
<center>
<%request.setCharacterEncoding("UTF-8"); %>
<%	String bookname = request.getParameter("bookname");
%>
	<form action="updatebook.jsp" method="post">
		<h2>更新书籍信息</h2><h4>
			<input type = "hidden" name = "bookname" value = "<%= bookname %>">
			作   者 ：      &nbsp;&nbsp;<input type = "text" name = "author" size = "30%" style=height:18px><br><br>
			出版社 ：   &nbsp;<input type = "text" name = "publisher" size = "30%" style=height:18px><br><br>
			出版日期 ：<input type = "text" name = "publishdate" size = "30%" style=height:18px><br><br>
			价   格 ：         &nbsp;&nbsp;<input type = "text" name = "price" size = "30%" style=height:18px><br><br>
			<input type = "submit" name = "sub" value = "  更 新  " >
			</h4>
	</form>
</center>
</body>
</html>