<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>이 페이지의 내용은 나타나지 않습니다.</h1>
<%
String city = request.getParameter("c");
pageContext.forward(city + ".jsp");
%>
</body>
</html>