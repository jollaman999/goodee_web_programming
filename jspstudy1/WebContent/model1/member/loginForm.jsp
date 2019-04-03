<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/jspstudy1/css/main.css">
</head>
<body>
<form action="login.jsp" method="post">
<table>
	<caption>MODEL1 로그인</caption>
	<tr>
		<th>아이디</th>
		<td><input type="text" name="id"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="pass"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="로그인">
			<input type="button" value="회원가입" onclick="location.href='joinForm.jsp'">
		</td>
	</tr>
</table>
</form>
</body>
</html>