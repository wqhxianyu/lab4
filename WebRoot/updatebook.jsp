<%@page import="action.DaoCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新界面</title>
</head>
<body>
<center>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "book" class = "test.UpBook"></jsp:useBean>
<jsp:setProperty property="*" name="book"/>
<%
	String authorid = null;	//定义作者id
	//查询id
	try{
	DaoCon dao = new DaoCon();
	Connection con = dao.GetConn();
	Statement stmt = con.createStatement() ; 
	String sql = "select authorid from author where name ='"+book.getAuthor()+"'";
	//out.print(sql);
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
		authorid = rs.getString("authorid");
	}
	rs.close();
	stmt.close();
	con.close();
	}catch(Exception e){
		e.printStackTrace();
		out.println("更新失败，请确认作者名是否正确！！");
	}
	try{
	DaoCon dao = new DaoCon();
	Connection con = dao.GetConn();
	Statement stmt = con.createStatement() ;
	String sql = "update book set authorid ="+authorid+",publisher='"+book.getPublisher()+
			"',publishdate='"+book.getPublishdate()+"',price='"+book.getPrice()+"' where title='"+book.getBookname()+"'";
	stmt.executeUpdate(sql) ;		// 执行数据库更新操作
	//out.print(sql);
	stmt.close();
	con.close();
	out.println("更新成功！！");
	}catch(Exception e){
		e.printStackTrace();
		out.println("更新失败！！");
	}
%>
<br>
<h3>
	<a href="index.jsp">返回主界面</a>
</h3>
</center>
</body>
</html>