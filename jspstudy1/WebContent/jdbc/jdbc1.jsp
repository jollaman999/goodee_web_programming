<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jdbc 예제1</title>
<link rel="stylesheet" href="/jspstudy1/css/main.css">
</head>
<body>
<%
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection
			("jdbc:mariadb://127.0.0.1:3306/bigdb", "scott", "tiger");
	PreparedStatement pstmt = conn.prepareStatement
			("select * from student");
	ResultSet rs = pstmt.executeQuery();
	ResultSetMetaData rsmt = rs.getMetaData();
%>
<table>
<tr>
	<% for (int i = 1; i <= rsmt.getColumnCount(); i++) { %>
		<th><%= rsmt.getColumnName(i) %></th>
	<% } %>
</tr>
<% while(rs.next()) { %><tr>
	<% for (int i = 1; i <= rsmt.getColumnCount(); i++) { %>
	<td><%= rs.getString(i) %></td>
	<% } %></tr>
<% } %>
</table>
</body>
</html>