<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl 조건문 연습</title>
</head>
<body>
<form name="f" method="post">
<input type="hidden" name="sum">
x : <input type="text" name="x"><br>
y : <input type="text" name="y"><br>
<input type="submit" value="더하기">
</form>
<br><br>
<c:set var="sum" value="${param.x + param.y}"/>
합계 : ${sum}
<br>
<h1>
jstl if 태그 사용하여 출력하기<br><br>
<c:if test="${sum > 0}">
양수입니다.
</c:if>
<c:if test="${sum < 0}">
음수입니다.
</c:if>
<c:if test="${sum == 0}">
0 입니다.
</c:if>
<br><br>
jstl choose 태그 사용하여 출력하기<br><br>
<c:choose>
	<c:when test="${sum > 0}">
	양수입니다.
	</c:when>
	<c:when test="${sum < 0}">
	음수입니다.
	</c:when>
	<c:otherwise>
	0 입니다.
	</c:otherwise>
</c:choose>
</h1>
</body>
</html>