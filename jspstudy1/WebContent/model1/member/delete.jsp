<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 탈퇴</title>
</head>
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
		alert("관리자를 제외한 자신만 탈퇴가 가능합니다!");
		location.href="info.jsp"
	</script>
<%
	return;
}

if (request.getParameter("id") == null ||
request.getParameter("id").length() == 0) {
%>
<script type="text/javascript">
	alert("회원 ID 정보를 가져 올 수 없습니다!");
</script>
<%
	return;
}
%>
<script type="text/javascript">
	delete_confirm();
</script>
<%
String id = request.getParameter("id");

new MemberDao().delete(id);
%>
<script type="text/javascript">
	alert("<%= id %>의 탈퇴가 완료 되었습니다!");
</script>
<%
if (login.equals("admin")) {
%>
	<script type="text/javascript">
		location.href="list.jsp";
	</script>
<%
	return;
} else {
	session.invalidate();
%>
	<script type="text/javascript">
		location.href="loginForm.jsp";
	</script>
<% } %>
</body>
</html>