<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
1. 로그인 후에 보여지는 페이지
	=> 로그인 여부 확인 => 로그인 상태가 아닌 경우, loginForm.jsp 로 페이지 이동하기
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>

</head>
<body>
<%
	String id = (String)session.getAttribute("login");
	String msg = "";

	if (id == null || id.length() == 0) {
		msg = "로그인 정보를 확인 할 수 없습니다!"; %>
		<script type="text/javascript">
		alert("<%= msg %>");
		location.href="loginForm.jsp";
		</script>
<%
		//response.sendRedirect 는 위의 내용들이 무시됨.
		//response.sendRedirect("loginForm.jsp");
		return;
	} else {
		Member mem = new MemberDao().selectOne(id);
		msg = mem.getName() + "님이 로그인 중입니다.";
	}
%>
<h3><%= msg %></h3>
<h3><a href="logout.jsp">로그아웃</a></h3>
<h3><a href="info.jsp?id=<%= id %>">회원 정보 보기</a></h3>
<% if (id != null && id.equals("admin")) { %>
<h3><a href="list.jsp">회원 목록 보기</a></h3>
<% } %>
</body>
</html>