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

int index = Integer.parseInt(request.getParameter("index"));
list.remove(index);
%>
<script type="text/javascript">
location.href="sessionview.jsp"
</script>
</body>
</html>