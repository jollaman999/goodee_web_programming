<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/chap7/book.jsp --%>
<%--
writer, title, content 파라미터 3개
--%>
<% request.setCharacterEncoding("euc-kr"); %>
<%-- <jsp:useBean /> : useBean 액션태그. chap7.Book 클래스 객체화
자바 : book = new chap7.Book();
--%>
<jsp:useBean id="book" class="chap7.Book" />
<%--
<jsp:setProperty .. /> : setProperty 액션태그
	property="*" : 파라미터 이름과 프로퍼티 이름이 같은 것을 설정
	name="book" : book 객체를 사용.
자바 :
	book.setWriter(request.getParameter('writer'))
	book.setTitle(request.getParameter('title'))
	book.setContent(request.getParameter('content'))
set 프로퍼티
	setWriter(..) : writer 프로퍼티.
--%>
<jsp:setProperty property="*" name="book" />
<%--
	book.setWriter(request.getParameter("name"));
--%>
<%-- <jsp:setProperty property="writer" param="name" name="book" />--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>방명록 결과</title>
<link rel="stylesheet" href="/jspstudy1/css/main.css">
</head>
<body>
<table>
<tr><td>방문자</td>
   <td><jsp:getProperty property="writer" name="book" /></td>
   <td><%= book.getWriter() %></td>
   </tr>
<tr><td>제목</td>
   <td><jsp:getProperty property="title" name="book" /></td>
   <td><%= book.getTitle() %></td>
   </tr>
<tr><td>내용</td>
   <td><jsp:getProperty property="content" name="book" /></td>
   <td><%= book.getContent() %></td>
   </tr>
</table>
</body>
</html>