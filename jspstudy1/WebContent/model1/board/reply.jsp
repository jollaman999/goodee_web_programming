<%@page import="java.util.List"%>
<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
Board 객체
	원글정보 : num, ref, reflevel, refstep
	답글정보 : name, pass, subject, content
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String uploadpath = application.getRealPath("/") + "model1/board/file";
int size = 10 * 1024 * 1024;
MultipartRequest multi = new MultipartRequest
      (request, uploadpath, size, "utf-8");
Board board = new Board(); 
board.setName(multi.getParameter("name"));
board.setPass(multi.getParameter("pass"));
board.setSubject(multi.getParameter("subject"));
board.setContent(multi.getParameter("content"));
board.setFile1(multi.getFilesystemName("file1"));

int ref = Integer.parseInt(multi.getParameter("ref"));
int reflevel = Integer.parseInt(multi.getParameter("reflevel")) + 1;
int refstep = Integer.parseInt(multi.getParameter("refstep"));

board.setRef(ref);
board.setReflevel(reflevel);

/*
List<Board> list_reply = new BoardDao().list_reply(Integer.parseInt(multi.getParameter("ref")));

for (int i = refstep + 1; i < list_reply.size(); i++) {
	Board b = list_reply.get(i);
	b.setRefstep(b.getRefstep() + 1);
	list_reply.set(i, b);
}

new BoardDao().update_reply(list_reply);
*/
new BoardDao().refstepadd(ref, refstep);

board.setRefstep(refstep + 1);

BoardDao dao = new BoardDao();
int num = dao.maxnum();
String msg = "게시물 등록 실패";
String url = "replyForm.jsp?num=" + multi.getParameter("num");
board.setNum(++num);
if(dao.insert(board)) {
   msg = "게시물 등록 성공";
   url = "list.jsp";
}
%>
<script>
   alert("<%=msg%>");
   location.href="<%=url%>";
</script>
</body>
</html>