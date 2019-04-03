<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl 연습</title>
</head>
<body>
<form name="f" method="post">
이름 : <input type="text" name="name"><br>
나이 : <input type="text" name="age"><br>
성별 : <input type="radio" name="gender" value="1" checked>남
<input type="radio" name="gender" value="2">여<br>
구구단 : <input type="text" name="gugudan"><br>
취미 : <input type="checkbox" name="hobby" value="여행">여행
<input type="checkbox" name="hobby" value="독서">독서
<input type="submit" value="전송">
</form>
<br><br>
<h2>문제 : 위의 파라미터를 이름:입력값... 성별:남자또는여자로 출력하기</h2><br><br>
<h3>
이름 : ${param.name}<br>
나이 : ${param.age}<br>
성별 : 
<c:choose>
	<c:when test="${param.gender == 1}">
	남
	</c:when>
	<c:when test="${param.gender == 2}">
	여
	</c:when>
</c:choose>
<br>
취미 : <c:forEach var="h" items="${paramValues.hobby}">${h}&nbsp;&nbsp;&nbsp;</c:forEach>
</h3>
<br><br>
<h2>나이가 10살 미만인 경우 : 10살 미만, 나이가 10대인 경우 : 10대... 나이가 60이상인 경우 60대 이상 으로 출력하기</h2>
<br>
<h3>
<c:choose>
	<c:when test="${param.age < 10}">
	10살 미만
	</c:when>
	<c:when test="${param.age >= 60}">
	60대 이상
	</c:when>
</c:choose>
</h3>
<br><br>
<h2>입력된 숫자에 해당하는 구구단을 출력하기</h2>
<h3>
${param.gugudan}단<br>
<c:forEach var="i" begin="1" end="9">
	${param.gugudan} x ${i} = ${param.gugudan * i}<br>
</c:forEach>
</h3>
</body>
</html>