<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= Integer.parseInt("bbb") %>
</body>
</html>
<%--
	error 페이지 처리 방법. 우선순위
	1. 해당 페이지 별로 <%@ page errorPage="..jsp" %>로 설정
	2. web.xml 에 예외 객체별로 처리
	3. web.xml 에 예외 코드별로 처리
	4. 톰캣(웹 어플리케이션 서버, 웹 컨테이너)에서 기본으로 제공되는 에러 페이지. 에러 처리 안함.
--%>