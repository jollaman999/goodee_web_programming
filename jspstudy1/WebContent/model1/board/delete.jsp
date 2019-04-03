<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
int num = Integer.parseInt(request.getParameter("num"));
String pass = request.getParameter("pass");
String msg = "비밀번호가 틀렸습니다!";
String url = "deleteForm.jsp?num=" + num;

BoardDao dao = new BoardDao();
Board board = dao.selectOne(num);

if (pass.equals(board.getPass())) {
	if (dao.delete(num)) {
		msg = "게시글이 성공적으로 삭제되었습니다.";
		url = "list.jsp";
	} else {
		msg = "게시글 삭제를 실패하였습니다!";
		url = "info.jsp?num=" + num;
	}
}
%>
<script type="text/javascript">
	alert("<%= msg %>");
	location.href="<%= url %>";
</script>