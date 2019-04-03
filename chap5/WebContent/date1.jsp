<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜를 session에 등록하기</title>
</head>
<body>
<%
	Date today = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss E");
	String date = sdf.format(today);
	session.setAttribute("date", date); // 속성등록
%>
반갑습니다 등록된 날짜 : <%=date %>
<a href="date2.jsp">date2.jsp로 가서 date 속성값 조회하고, 삭제하기</a>
</body>
</html>