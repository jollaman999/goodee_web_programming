<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /WebContent/model1/board/write.jsp 
   1. 파라미터 값을 model1.Board 객체 저장.
   2. 게시물 번호 num 현재 등록된 num의 최대값을 조회. 최대값 + 1 = 등록된 게시물의 번호.  
      db에서 maxnum 을 구해서 +1 값으로 num 설정하기 
   3.  
      
--%>
<% 
//1. 파라미터 값을 model1.Board 객체 저장.
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
//   2. 게시물 번호 num 현재 등록된 num의 최대값을 조회. 최대값 + 1 = 등록된 게시물의 번호.  
//         db에서 maxnum 을 구해서 +1 값으로 num 설정하기 
   BoardDao dao = new BoardDao();
   int num = dao.maxnum();
//   3. board 객체의 내용을 db에 insert 하기.
   String msg = "게시물 등록 실패";   
   String url = "writeForm.jsp";
   board.setNum(++num); 
   board.setRef(num);
   if(dao.insert(board)) {
      msg = "게시물 등록 성공";
      url = "list.jsp";
   }
%>
<script>
   alert("<%=msg%>");
   location.href="<%=url%>";
</script>