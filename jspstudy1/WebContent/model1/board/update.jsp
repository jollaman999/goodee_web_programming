<%@page import="model.BoardDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	1. 파라미터 정보들을 Board 객체에 저장.
	2. 비밀번호 검증
		비밀번호 일치 : 수정으로.
		비밀번호 불일치 : 비밀번호 오류 메세지 출력하고, updateForm.jsp 로 페이지 이동
	3. 수정성공 : 수정성공 메세지 출력 후 list.jsp 페이지 이동
	       수정 실패 : 수정실패 메세지 출력 후 updateForm.jsp 페이지 이동
--%>
<%
Board board = new Board();
String path = application.getRealPath("/") + "model1/board/file/";
MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "utf-8");

board.setNum(Integer.parseInt(multi.getParameter("num")));
board.setName(multi.getParameter("name"));
board.setPass(multi.getParameter("pass"));
board.setSubject(multi.getParameter("subject"));
board.setContent(multi.getParameter("content"));
board.setFile1(multi.getFilesystemName("file1"));
if (board.getFile1() == null || board.getFile1().equals("")) {
	board.setFile1(multi.getParameter("file2"));
}

// 비밀번호 검증
BoardDao dao = new BoardDao();
Board dbBoard = dao.selectOne(board.getNum());

String msg = "비밀번호가 틀렸습니다!";
String url = "updateForm.jsp?num=" + board.getNum();
if (board.getPass().equals(dbBoard.getPass())) {
	if (dao.update(board)) {
		msg = "게시물 수정 완료";
		url = "list.jsp";
	} else {
		msg = "게시물 수정 실패!";
	}
}
%>
<script type="text/javascript">
	alert("<%= msg %>");
	location.href = "<%= url %>";
</script>