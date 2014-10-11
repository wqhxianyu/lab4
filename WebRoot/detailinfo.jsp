<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="action.DaoCon" %>
    <%@ page import="java.sql.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>详细信息</title>
</head>
<body>
<%	String bookname = request.getParameter("bookname");
%>
<%
	String[] author = new String[3];
	String[] book = new String[4];
	String authorid = null ;
	try{
	DaoCon dao = new DaoCon();
	Connection con = dao.GetConn();
	Statement stmt = con.createStatement() ;
	 String sql = "select * from book where title = '"+bookname+"'";
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
		book[0] = rs.getString("isbn");
		authorid = rs.getString("authorid");
		book[1] = rs.getString("publisher");
		book[2] = rs.getString("publishdate");
		book[3] = rs.getString("price");
		}
	rs.close();
	stmt.close();
    con.close();
	} catch (Exception e) {
		// TODO 自动生成的 catch 块
		e.printStackTrace();
	}
	
	try{
		DaoCon dao = new DaoCon();
		Connection con = dao.GetConn();
		Statement stmt = con.createStatement() ;
		String sql = "select * from author where authorid = "+authorid;
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			author[0] = rs.getString("name");
			author[1] = rs.getString("country");
			author[2] = rs.getString("age");
		}
		rs.close();
		stmt.close();
        con.close();
	} catch (Exception e) {
		// TODO 自动生成的 catch 块
		e.printStackTrace();
	}
	
%>
<h1>《<%= bookname %>》的详细信息</h1>
<br><br><br>
<h2>作者详细信息</h2>
	<ul>
		<li>姓名 ： <%= author[0] %></li>
		<li>城市 ：  <%=  author[1] %></li>
		<li>年龄 ： <%= author[2] %></li>
	</ul>
	<br><br>
	<h2>书籍详细信息</h2>
	<ul>
		<li>ISBN ：   <%= book[0] %></li>
		<li>出版商 ：   <%= book[1] %></li>
		<li>出版日期 ：<%= book[2] %></li>
		<li>价   钱 ：       <%= book[3] %></li>
	</ul>
</body>
</html>