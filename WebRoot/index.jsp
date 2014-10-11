<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.text.SimpleDateFormat"%>
    <%@page import="java.util.Date"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询界面</title>
</head>
<body>

<center>欢迎使用溪风图书查询工具<br><br><br>
 	<!-- 定义form表单提交作者姓名 用于查询数据库 -->
 	<form name="myForm" action="get" method="post">
   	<h2 align="center">输入作者的姓名：
	   	<input type = "text" name = "author" size = "45%" style=height:25px>	&nbsp;&nbsp;
	    <input type = "submit" value = "查 询" name="mySubmit" style="width: 85px; height: 30px;"  >
    </h2>
    </form> 
    </center>
</body>
</html>