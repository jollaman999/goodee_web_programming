<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 화면</title>
<link rel="stylesheet" href="/jspstudy1/css/main.css">
</head>
<body>
<%--
입력된 내용이 join.jsp 에 출력되도록 join.jsp 프로그램 작성하기
단 useBean 액션태그, setProperty 액션태그, 를 반드시 사용하기.
사용되는 Bean 클래스 chap7.mybatisjava.Member
--%>
<form action="join.jsp" method="post">
	<table>
		<caption>회원가입</caption>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="text" name="password"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type="radio" name="gender" value="1">남
			<input type="radio" name="gender" value="2">여</td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="text" name="age"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="회원가입"></td>
		</tr>
	</table>
</form>
</body>
</html>