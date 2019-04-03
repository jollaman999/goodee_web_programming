<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pageContext 내장 객체 예제</title>
</head>
<body>
<h1>pageContext 객체 : 현재 페이지의 자원을 관리하는 객체</h1>
<% if (request == pageContext.getRequest()) { %>
	request == pageContext.getRequest();
<% } else { %>
	request != pageContext.getRequest();
<% } %>
<h1>pageContext 객체 : page 영역 담당 객체</h1>
</body>
</html>