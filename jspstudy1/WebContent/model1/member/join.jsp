<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	1. 파라미터 정보를 mybatisjava.Member 객체 저장
	2. mybatisjava.Member 객체에 저장된 내용을 db 저장하기 => model 부분
	3. 성공 : loginForm.jsp 페이지 이동
	       실패 : joinForm.jsp 페이지 이동 
--%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="mem" class="model.Member" />
<jsp:setProperty property="*" name="mem" />
<%
	MemberDao dao = new MemberDao();
	// 1 인 경우 : insert 성공
	// 2 인 경우 : insert 실패
	int result = dao.insert(mem);
	String msg = null;
	String url = null;
	
	if (result > 0) { // 가입 성공
		msg = mem.getName() + "님의 회원 가입이 완료 되었습니다.";
		url = "loginForm.jsp";
	} else {
		msg = "회원 가입 실패.";
		url = "joinForm.jsp";
	}
%>
<script>
	alert("<%= msg %>");
	location.href="<%= url %>";
</script>