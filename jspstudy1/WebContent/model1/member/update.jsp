<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
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
		alert("자신의 정보만 수정이 가능합니다!");
		location.href="info.jsp"
	</script>
<%
	return;
} else if (request.getParameter("run_update") != null &&
		(request.getParameter("run_update").equals("1") || request.getParameter("run_update").equals("2"))) {
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	String picture = request.getParameter("picture");
	boolean error = false;
	
	if (!login.equals("admin") &&
			(pass == null || pass.length() == 0)) {
%>
		<script type="text/javascript">
			alert("비밀번호가 입력되지 않았습니다!");
			<% error = true; %>
		</script>
<%
	} else if (name == null || name.length() == 0) {
%>
		<script type="text/javascript">
			alert("이름이 입력되지 않았습니다!");
			<% error = true; %>
		</script>
<%
	} else if (gender == null || gender.length() == 0) {
%>
		<script type="text/javascript">
			alert("성별이 선택되지 않았습니다!");
			<% error = true; %>
		</script>
<%
	} else if (tel == null || tel.length() == 0) {
%>
		<script type="text/javascript">
			alert("전화번호가 입력되지 않았습니다!");
			<% error = true; %>
		</script>
<%
	} else if (email == null || email.length() == 0) {
%>
		<script type="text/javascript">
			alert("이메일이 입력되지 않았습니다!");
			<% error = true; %>
		</script>
<%
	}

	if (error) {
%>
		<script type="text/javascript">
			location.href="updateForm.jsp?id=<%= id %>";
		</script>
<%
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
			location.href="updateForm.jsp?id=<%= id %>";
		</script>
<%
			return;
		}
		
		if (!login.equals("admin") &&
				request.getParameter("run_update").equals("1") &&
				!pass.equals(mem.getPass())) {
%>
			<script type="text/javascript">
				alert("비밀번호를 확인해 주십시오!");
				location.href="updateForm.jsp?id=<%= id %>";
			</script>
<%
			return;
		}

		mem.setName(name);
		mem.setGender(Integer.parseInt(gender));
		mem.setTel(tel);
		mem.setEmail(email);
		if (picture == null || picture.length() == 0)
			picture = mem.getPicture();
		mem.setPicture(picture);
		
		MemberDao dao = new MemberDao();
		int result = dao.update(mem);
		
		if (result > 0) {
%>
			<script type="text/javascript">
				alert("<%= name %>님의 정보를 성공적으로 수정하였습니다!");
				location.href="info.jsp?id=<%= id %>";
			</script>
<%
		} else {
			%>
			<script type="text/javascript">
				alert("<%= name %>님의 정보를 수정하는데 실패하였습니다!");
				location.href="main.jsp";
			</script>
<%
		}
	}
}
%>
