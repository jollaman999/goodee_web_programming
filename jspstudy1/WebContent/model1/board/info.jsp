<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	1. num 파라미터를 이용하여 db에 해당 게시물 조회
		new BoardDao.selectOne(num);
	2. 조회 수 증가 시키기
		readcnt + 1
		new BoardDao().readcntadd(num);
	3. 1번에서 조회 한 게시물 데이터를 화면에 출력하기 
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
<link rel="stylesheet" href="/jspstudy1/css/main.css">
</head>
<body>
<%
if (request.getParameter("num") == null) {
%>
<script type="text/javascript">
	alert("num 파라미터 정보를 가져올 수 없습니다!");
</script>
<%
} else {
	int num = Integer.parseInt(request.getParameter("num"));
	Board board = new BoardDao().selectOne(num);
	
	if (board == null) {
%>
<script type="text/javascript">
	alert("게시글 정보를 가져올 수 없습니다!");
</script>
<%
	} else {
		new BoardDao().readcntadd(num);
%>
		<table>
		<caption>MODEL1 게시물 상세 보기</caption>
		<tr>
			<td width="20%">글쓴이</td>
			<td width="80%" style="text-align: left"><%= board.getName() %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td style="text-align: left"><%= board.getSubject() %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<table style="width: 100%; height: 250px;">
				<tr>
					<td style="border-width: 0px; vertical-align: top; text-align: left;"><%= board.getContent() %></pre></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<%
				if (board.getFile1() == null) {
					out.print("");
				} else {
				%>
				<a href="file/<%= board.getFile1() %>" target="_blank"><%= board.getFile1() %></a>
				<%
				}
				%>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="replyForm.jsp?num=<%= num %>">[답변]</a>
				<a href="updateForm.jsp?num=<%= num %>">[수정]</a>
				<a href="deleteForm.jsp?num=<%= num %>">[삭제]</a>
				<a href="list.jsp">[목록]</a>
			</td>
		</tr>
		</table>
<%
	}
}
%>
</body>
</html>