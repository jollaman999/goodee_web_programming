<%@page import="model.Board"%>
<%@page import="java.util.List"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	1. pageNum 파라미터 존재. pageNum 파라미터 없으면 1로 설정.
	2. 10건의 게시물 출력
		=> db에서 해당 페이지에 출력되는 게시물만 조회. 순서 : 최근 게시물 순으로
	3. 화면에 출력
--%>
<%
	int pageNum = 1;
	try {
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	} catch (NumberFormatException e) {}
	
	int limit = 15;
	BoardDao dao = new BoardDao();
	int boardcount = dao.boardCount(); // 등록된 전체 게시물의 수
	List<Board> list = dao.list(pageNum, limit); // 화면에 출력된 게시물 데이터

	int endpage = boardcount / limit;
	if (boardcount % limit != 0)
		endpage++;
	int startpage = 1; // 시작 페이지 번호 설정
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록 보기</title>
<link rel="stylesheet" href="/jspstudy1/css/main.css">
</head>
<body>
<table>
	<caption>MODEL1 게시판 목록</caption>
	<% if (boardcount == 0) { %>
	<tr>
		<td colspan="5">등록된 게시글이 없습니다!</td>
	</tr>
	<% } else { // 등록된 게시물 존재 %>
		<tr>
			<td colspan="5" style="text-align:right">글개수 :<%= boardcount  %></td>
		</tr>
		<tr>
			<th width="8%">번호</th>
			<th width="50%">제목</th>
			<th width="14%">작성자</th>
			<th width="17%">등록일</th>
			<th width="11%">조회수</th>
		</tr>
		<% int boardnum = boardcount - (pageNum - 1) * limit; %>
		<% for (Board b : list) { %>
			<tr>
				<td><%= boardnum-- %></td>
				<td style="text-align: left;">
				<% if (b.getReflevel() > 0) {
					for (int i = 0; i < b.getReflevel(); i++) { %>
					&nbsp;&nbsp;&nbsp;
					<% } %>
					└
				<% } %>
				<% if (b.getFile1() != null && b.getFile1().length() != 0) { %>
					<a href="file/<%= b.getFile1() %>" target="_blank" style="text-decoration: none;"><img src="img/file.png" width="15" height="15">&nbsp;</a>
				<% } %>
				<a href="info.jsp?num=<%= b.getNum() %>"><%= b.getSubject() %></a></td>
				<td><%= b.getName() %></td>
				<td><%= b.getRegdate() %></td>
				<td><%= b.getReadcnt() %></td>
			</tr>
		<% } %>
		<%-- 페이지 처리 부분 --%>
		<tr>
			<td colspan="5">
			<% if (pageNum <= 1) { %>[이전]<% } else { %>
			<a href="list.jsp?pageNum=<%= pageNum - 1 %>">[이전]</a><% } %>
			<% for (int a = startpage; a <= endpage; a++) { %>
				<% if (a == pageNum) { %>
					[<%= a %>]
				<% } else { %>
					<a href="list.jsp?pageNum=<%= a %>">[<%= a %>]</a>
				<% } %>
			<% } %>
			<% if (pageNum >= endpage) { %>
				[다음]
			<% } else { %>
				<a href="list.jsp?pageNum=<%= pageNum + 1 %>">[다음]</a>
			<% } %>
			</td>
		</tr>
	<% } %>
	<tr>
		<td colspan="5" style="text-align:right">
			<a href="writeForm.jsp">[글쓰기]</a>
		</td>
	</tr> 
</table>
</body>
</html>