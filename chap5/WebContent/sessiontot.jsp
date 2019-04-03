<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 목록 보기</title>
</head>
<body>
<%
// session.getAttribute("cart") : 속성 조회
// session 객체에서 이름이 cart인 속성의 객체를 리턴
ArrayList<String> list =
	(ArrayList<String>)session.getAttribute("cart");
if (list == null || list.size() == 0) {
%>
	<h3>장바구니에 상품이 없습니다.</h3>
<% } else {
	for (String p : list) { %>
	<h4><%=p %></h4>
<% }
}

// session의 속성을 제거
// session.removeAttirbute("cart");
// session 객체를 새로 설정하기.
session.invalidate();
%>
</body>
</html>