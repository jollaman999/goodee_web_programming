<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름 : ${param.name}<br>
나이 : ${param.age}<br>
성별 : 
<c:if test="${param.gender == 1}">
남<br>
</c:if>
<c:if test="${param.gender == 2}">
여<br>
</c:if>
출생년도 : ${param.year}<br>
나이 : 만${2019 - param.year}<br>
</body>
</html>