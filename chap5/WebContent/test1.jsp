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
request.setCharacterEncoding("utf-8");

int input = Integer.parseInt(request.getParameter("input"));
int sum = 0;

for (int i = 1; i <= input; i++)
	sum += i;
%>
<h1><b><%=input %>까지의 합:<%=sum %></b></h1>
</body>
</html>