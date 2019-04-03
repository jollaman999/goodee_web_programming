<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 화면</title>
<link rel="stylesheet" href="/jspstudy1/css/main.css">
</head>
<script type="text/javascript">
function do_update(f) {
	f.run_update.value = 1;
	f.submit();
}

function do_changepw(f) {
	f.run_update.value = 2;
	f.submit();
}

/*
function input_check(f) {
	if (f.pass.value == "") {
		alert("비밀번호를 입력하세요!");
		f.pass.focus();
		return false;
	}
	return true;
}
*/

function passchg_winopen() {
	var op = "width=500, height=230, left=50, top=150"
	open("passwordForm.jsp?id=<%= request.getParameter("id") %>", "", op);
}
</script>
<body>
<%
Member mem = null;
String login = (String)session.getAttribute("login");

if (login == null || login.length() == 0) {
%>
	<script type="text/javascript">
		alert("잘못 된 접근!");
		location.href="info.jsp";
	</script>
<%
	return;
} else if (!login.equals("admin") && request.getParameter("id") != null &&
		!login.equals(request.getParameter("id"))) {
%>
	<script type="text/javascript">
		alert("자신의 정보만 수정이 가능합니다!");
		location.href="info.jsp"
	</script>
<%
	return;
}

if (login.equals("admin") &&
		request.getParameter("id") != null && request.getParameter("id").length() != 0) {
	mem = new MemberDao().selectOne(request.getParameter("id"));
} else {
	mem = new MemberDao().selectOne(login);
}
if (mem == null) {
	%>
<script type="text/javascript">
	alert("회원 정보를 가져올 수 없습니다!");
	location.href="info.jsp";
</script>
<%
	return;
}

String pass_admin = "";
String checked_boy = "";
String checked_girl = "";

if (login.equals("admin"))
	pass_admin = "readonly";

if (mem.getGender() == 1)
	checked_boy = "checked";
else if (mem.getGender() == 2)
	checked_girl = "checked";
%>
<input type="hidden" name="picture" value="">
<form action="update.jsp" method="post">
<!-- onsubmit="return input_check(this)"-->
<input type="hidden" name="run_update" value="0">
	<table>
		<caption>MODEL1 회원 정보 수정</caption>
		<tr>
			<td rowspan="4" valign="bottom">
				<img src="img/<%= mem.getPicture() %>" width="100" height="120"><br>
				<font size="1"><a href="#">사진수정</a></font>
			</td>
			<td>아이디</td>
			<td><input type="text" name="id" value="<%= mem.getId() %>" readonly></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pass" <%= pass_admin %>></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%= mem.getName() %>"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type="radio" name="gender" value="1" <%= checked_boy %>>남
			<input type="radio" name="gender" value="2" <%= checked_girl %>>여</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td colspan="2"><input type="text" name="tel" value="<%= mem.getTel() %>"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td colspan="2"><input type="text" name="email" value="<%= mem.getEmail() %>"></td>
		</tr>
		<tr>
			<td colspan="3"><input type="button" name="updatemember" value="회원수정" onclick="do_update(this.form)">
			<input type="button" name="changepassword" value="비밀번호 수정" onclick="passchg_winopen()"></td>
		</tr>
	</table>
</form>
</body>
</html>