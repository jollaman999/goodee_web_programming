<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 객체</title>
</head>
<body>
<h1>session 객체 : 브라우저의 상태 정보를 저장하는 객체</h1>
<%
	session.setMaxInactiveInterval(10 * 60); // session 유지시간. 10초.
%>
<h3>sesison 테스트</h3>
isNew() : <%=session.isNew() %><br>
생성시간 : <%=session.getCreationTime() %><br>
최종접속시간 : <%=session.getLastAccessedTime() %><br>
sessionID : <%=session.getId() %>
</body>
</html>