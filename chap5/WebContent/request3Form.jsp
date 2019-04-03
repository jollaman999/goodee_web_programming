<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>간단한 사칙연산</title>
<script type="text/javascript">
function calc(op, f) {
	f.operator.value = op;
	f.submit();
}
</script>
</head>
<body>
<form action="request3.jsp" method="post">
숫자1 : <input type="text" name="num1">&nbsp;
숫자2 : <input type="text" name="num2"><br>
<input type="hidden" name="operator">
<input type="button" value="+" onclick="calc('+', this.form);">
<input type="button" value="-" onclick="calc('-', this.form);">
<input type="button" value="*" onclick="calc('*', this.form);">
<input type="button" value="/" onclick="calc('/', this.form);">
</form>
</body>
</html>