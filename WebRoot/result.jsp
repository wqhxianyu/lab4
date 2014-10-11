<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri = "/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>结果输出</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <br>
  <center>
  <h2>查询${author}所写的图书结果</h2>
  <br><br><br><br>
    <table align="center" border="1" cellspacing="0" cellpadding="0" >
    <tr align="center" valign="middle">
    	<td><b>书名</b></td>
    	<td><b>删除</b></td>
    	<td><b>更新</b></td>
    </tr>
    <c:forEach  var="bookname" items="${bookname}" begin = "0" end = "${num}" varStatus="status">
    	<tr>
    	<!-- 书籍的详细信息 -->
    	<td align="center" style="width:180px; height: 25px;" valign="middle"> 
    	<a href="detailinfo.jsp?bookname=${bookname}">${bookname}</a></td>
	    <td align="center" style="width:180px; height: 25px;" valign="middle"> 
	    
	    	<!-- 删除该书 --><form action="detele" method="post">
	    	<br>
	    		<input type = "hidden" name = "title" value = "${bookname}">
	    		<input type = "submit" name = "sub" value = "  删 除  " >
	    	</form>
	    </td>
	    <td align="center" style="width:180px; height: 25px;" valign="middle"> 
	    
	    	<!-- 更新书 --><form  method="post">
	    	<br>
	    		<a href="update.jsp?bookname=${bookname}">
	    		<input type = "button" name = "sub" value = "  更 新  " ></a>
	    	</form>
	    </td>
    	</tr>
    </c:forEach>
    </table> 
  </center> 
  </body>
</html>
