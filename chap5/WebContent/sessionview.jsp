<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
ArrayList<String> list = (ArrayList<String>)session.getAttribute("cart");
%>
<table border=1>
    <tr>
        <th>번호</th>
        <th>상품명</th>
        <th></th>
    </tr>
<% for (int i = 0; i < list.size(); i++) { %>
    <tr>
        <td><%=i + 1 %></td>
        <td><%=list.get(i) %></td>
        <td>
        	<a href="sessiondel.jsp?index=<%=i %>">ⓧ</a>
        </td>
    </tr>
<% } %>
</table>
</body>
</html>