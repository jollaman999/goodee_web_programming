<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODEL2 연습</title>
</head>
<body>
<h3>숫자 두개를 입력박아 연산의 결과를 result에 소숫점 두자리 까지 출력하기</h3>
<form action="calc.me" method="post">
	<input type="text" name="num1" value="${param.num1}">
	<select name="op">
		<option selected>+</option>
		<option>-</option>
		<option>*</option>
		<option>/</option>
	</select>
	<script type="text/javascript">
		document.forms[0].op.value='${param.op}';
	</script>
	<input type="text" name="num2" value="${param.num2}">
	<input type="submit" value="=">
	<input type="text" name="result"
		value="<fmt:formatNumber value="${result}" pattern="###,###.00"/>">
</form>
</body>
</html>