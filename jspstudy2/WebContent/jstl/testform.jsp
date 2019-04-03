<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="test.jsp" method="post">
이름 : <input type="text" name="name" value="홍길동"><br>
나이 : <input type="text" name="age" value="10"><br>
성별 : <input type="radio" name="gender" value="1" checked>남
<input type="radio" name="gender" value="2">여<br>
출생연도 : <select name="year">
<% for (int i = 1980; i < 2000; i++) { %>
	<option><%= i %></option>
<% } %></select><br>
<input type="submit" value="전송">
</form>
</body>
</html>