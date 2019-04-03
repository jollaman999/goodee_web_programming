<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String regdate = date.format(new Date());
%>
<table border="1">
	<caption>방명록</caption>
	<tr>
		<td>방문자</td>
		<td><%=request.getParameter("name") %>
	</tr>
	<tr>
		<td>제목</td>
		<td><%=request.getParameter("title") %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><%=request.getParameter("textarea") %></td>
	</tr>
	<tr>
		<td>등록일</td>
		<td><%=regdate %></td>
	</tr>
</table>
</body>
</html>