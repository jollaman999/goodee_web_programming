<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	1. id 파라미터 값 저장하기
	2. 로그인 상태 검증.
		로그아웃 상태 : 로그인이 필요합니다. 메세지 출력하고, loginForm.jsp 페이지 이동
	3. 로그인 상태
		3-1 : id 파라미터정보와 login 정보를 비교해서 다르면
		자신의 정보만 조회 가능합니다. 메세지 출력. main.jsp 페이지 이동.
		3-2 : id 파라미터 정보와 login 정보를 비교하여 다르지만 login이 관리자인 경우와
		id 와 로그인 정보가 같은 경우 화면에 내용 출력하기
		MemverDao().selectOne(id) 메서드를 이용하여 db 내용 조회하기
	4. 관리자로 로그인 한 경우나, 자신정보 조회시 화면에 출력하기
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 보기</title>
<link rel="stylesheet" href="/jspstudy1/css/main.css">
</head>
<body>
<%
Member mem = null;
String login = (String)session.getAttribute("login");
String id = request.getParameter("id");

if (login == null || login.length() == 0) {
%>
	<script type="text/javascript">
		alert("로그인이 필요합니다. 로그인 하세요!");
		location.href="loginForm.jsp"
	</script>
<%
	return;
} else if (!login.equals("admin") && !login.equals(id)) {
%>
	<script type="text/javascript">
		alert("자신의 정보만 조회가 가능합니다!");
		location.href="main.jsp"
	</script>
<%
	return;
} else {
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
			location.href="main.jsp"
		</script>
<%
		return;
	}
}
%>
<table border="1">
	<caption>MODEL1 회원 정보 보기</caption>
	<tr>
		<td rowspan="6">
			<img src="img/<%= mem.getPicture() %>" width="100" height="120">
		</td>
		<td>아이디</td>
		<td><%= mem.getId() %></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%= mem.getName() %></td>
	</tr>
	<tr>
		<td>성별</td>
		<td><%= mem.getGender()==1?"남":"여" %></td>
	</tr>
	<tr>
		<td>전화</td>
		<td><%= mem.getTel() %></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><%= mem.getEmail() %></td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="updateForm.jsp?id=<%= mem.getId() %>">[수정]</a>
			<% if (!id.equals("admin")) { %>
			<a href="delete.jsp?id=<%= mem.getId() %>">[탈퇴]</a>
			<% } %>
		</td>
	</tr>
</table>
</body>
</html>