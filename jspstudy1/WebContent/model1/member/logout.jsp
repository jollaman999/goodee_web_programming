<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = (String)session.getAttribute("login");

if (id != null) {
	Member mem = new MemberDao().selectOne(id);
%>
	<script type="text/javascript">
	alert("<%= mem.getName() %>" + "님 로그아웃 되었습니다!");
	location.href="loginForm.jsp";
	</script>
<%
}
session.invalidate();
%>
</body>
</html>