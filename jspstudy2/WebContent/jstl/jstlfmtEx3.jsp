<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fmt 태그 문제</title>
</head>
<body>
<fmt:requestEncoding value="utf-8" />
<form method="post" name="f">
	이름 : <input type="text" name="name" value="${param.name}"><br>
	입사일 : <input type="text" name="hiredate" value="${param.hiredate}">yyyy-MM-dd 형태로 입력<br>
	급여 : <input type="text" name="salary" value="${param.salary}"><br>
	<script type="text/javascript">
		document.f.salary.value = '<fmt:formatNumber value="${param.salary}" pattern="#,###,###" />';
	</script>
	<input type="submit" value="전송">
</form>
<hr>
<h3>문제 : 입사일은 yyyy년 MM월 dd일 E요일 형태로 출력<br>
급여는 세자리마다 ,를 출력<br>
급여 * 12 로 연봉을 계산하고, 세자리 마다 , 출력 하기</h3>
이름 : ${param.name}<br>
<fmt:parseDate value="${param.hiredate}" pattern="yyyy-MM-dd" var="day" />
입사일 : <fmt:formatDate value="${day}" pattern="yyyy년 MM월 dd일 E요일" /><br>
급여 : <fmt:formatNumber value="${param.salary}" pattern="#,###,###" /><br>
연봉 : <fmt:formatNumber value="${param.salary * 12}" pattern="#,###,###" /><br>
</body>
</html>