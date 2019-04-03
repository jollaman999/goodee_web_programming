<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	1. id, pass 파라미터 지정
	2. db에서 id에 해당되는 데이터를 읽어서 mybatisjava.Member 전달 받기
	3. mybatisjava.Member 객체가 null 인 경우 :
		아이디를 확인하세요 메세지 출력.
		loginForm.jsp 페이지 이동
	   mybatisjava.Member 객체가 null 이 아닌 경우 :
	   	화면에서 입력된 비밀번호와 db 비밀번호 검증
	   같은 경우 : 로그인 성공
	   다른 경우 : 비밀번호를 화인하세요.
	   			loginForm.jsp 로 페이지 이동
--%>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	// mem : db에 저장된 회원정보 저장
	Member mem = new MemberDao().selectOne(id);
	String msg = "아이디를 화인하세요";
	String url = "loginForm.jsp";
	if (mem != null) {
		if (pass.equals(mem.getPass())) {
			session.setAttribute("login", id);
			msg = mem.getName() + "님이 로그인 했습니다.";
			url = "main.jsp";
		} else if (pass == null || pass.length() == 0) {
			msg = "비밀번호를 입력 하세요!";
		} else {
			msg = "비밀번호를 확인 하세요!";
		}
	}
%>
<script>
	alert("<%= msg %>");
	location.href="<%= url %>";
</script>