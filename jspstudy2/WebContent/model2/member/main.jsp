<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
1. 로그인 후에 보여지는 페이지
	=> 로그인 여부 확인 => 로그인 상태가 아닌 경우, loginForm.jsp 로 페이지 이동하기
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원관리 프로그램</title>
</head>
<body>
<h3>${sessionScope.login} 회원님 반갑습니다.</h3>
<h3><a href="logout.me">로그아웃</a></h3>
<h3><a href="info.me?id=${sessionScope.login}">회원정보보기</a></h3>
<c:if test="${sessionScope.login == 'admin' }">
    <h3><a href="list.me">회원목록보기</a></h3>
</c:if>
</body>
</html>