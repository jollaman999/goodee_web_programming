<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 도시 목록</title>
</head>
<body>
<%
pageContext.include("Seoul.jsp");
%>
<hr>
<%
pageContext.include("Busan.jsp");
%>
<hr>
<h4>전체 도시 목록입니다....</h4>
<%--
request : 요청객체. 파라미터정보. header 정보 ...
response : 응답객체. 브라우저에 전달되는  객체다.
pageContext : page 영역담당 객체. 해당 페이지의 정보를 저장.
--%>
</body>
</html>