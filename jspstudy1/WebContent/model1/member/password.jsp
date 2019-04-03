<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%--
	1. 로그인 상태임. 다른 사용자의 비밀번호 변경 불가.
		로그아웃 상태인 경우. 로그인 하세요. 메세지 출력.
			opener 페이지를 loginForm.jsp 페이지 이동.
			현재페이지 닫기.
	2. pass, chgpass 파라미터 값 지정
	3. pass 비밀번호가 db에 저장된 비밀번호와 틀리면
		비밀번호 오류 메세지 출력. passwordForm.jsp 페이지 이동
	4. pass 비밀번호가 db에 저장된 비밀번호와 같으면,
		비밀번호 수정. opener 페이지를 info.jsp 페이지 이동.
		현재페이지 닫기.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
<%
Member mem = null;
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
		location.href="passwordForm.jsp?=<%= request.getParameter("id") %>"
	</script>
<%
		return;
}

String current_pass = request.getParameter("pass");
String chg_pass = request.getParameter("chgpass");
String id = request.getParameter("id");

mem = new MemberDao().selectOne(id);
if (mem == null) {
%>
<script type="text/javascript">
	alert("회원 정보를 가져올 수 없습니다!");
	opener.location.href="updateForm.jsp?id=<%= id %>";
</script>
<%
	return;
}

if (!login.equals("admin") &&
		!current_pass.equals(mem.getPass())) {
%>
	<script type="text/javascript">
		alert("현재 비밀번호가 맞지 않습니다!");
		location.href="passwordForm.jsp?=<%= id %>"
	</script>
<%
} else {
	if (new MemberDao().updatePass(id, chg_pass) > 0) {
%>
		<script type="text/javascript">
			alert("비밀번호가 변경 되었습니다.");
			opener.location.href="info.jsp?id=<%= id %>";
			self.close();
		</script>
<%
	} else {
		%>
		<script type="text/javascript">
			alert("비밀번호를 변경하는 중 오류가 발생하였습니다!");
			location.href="passwordForm.jsp?=<%= id %>";
		</script>
<%
	}
}
%>
</body>
</html>