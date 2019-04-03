<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 화면</title>
<link rel="stylesheet" href="/jspstudy1/css/main.css">
<script type="text/javascript">
function chgpass_check(f) {
	if (f.pass.value.length == 0) {
		alert("현재 비밀번호를 입력해 주십시오!");
		f.chgpass.focus();
		return false;
	} else if (f.chgpass.value.length == 0) {
		alert("변경할 비밀번호를 입력해 주십시오!");
		f.chgpass.focus();
		return false;
	} else if (f.chgpass2.value.length == 0) {
		alert("변경할 비밀번호를 재입력해 주십시오!");
		f.chgpass2.focus();
		return false;
	} else if (f.chgpass.value != f.chgpass2.value) {
		alert("변경할 비밀번호의 두 비밀번호가 다릅니다!");
		f.chgpass2.value="";
		f.chgpass2.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>
<%
String login = (String)session.getAttribute("login");

if (login == null || login.length() == 0) {
%>
	<script type="text/javascript">
		alert("로그인 되어 있지 않습니다! 로그인 하세요!");
		opener.location.href="loginForm.jsp"
		self.close();
	</script>
<%
	return;
}

if (request.getParameter("id") == null ||
	request.getParameter("id").length() == 0) {
	%>
	<script type="text/javascript">
		alert("회원 ID 정보를 가져 올 수 없습니다!");
		self.close();
	</script>
<%
	return;	
}
%>
<form action="password.jsp?id=<%= request.getParameter("id") %>" method="post" name="f" onsubmit="return chgpass_check(this)">
<table>
	<caption>비밀번호 변경</caption>
<% if (!login.equals("admin")) { %>
	<tr>
		<td>현재 비밀번호</td>
		<td><input type="password" name="pass"></td>
	</tr>
<% } %>
	<tr>
		<td>변경 비밀번호</td>
		<td><input type="password" name="chgpass"></td>
	</tr>
	<tr>
		<td>변경 비밀번호 재입력</td>
		<td><input type="password" name="chgpass2"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="비밀번호 변경"></td>
	</tr>
</table>
</form>
</body>
</html>