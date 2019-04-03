<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator</title>
</head>
<body>
<%
double num1 = Double.parseDouble(request.getParameter("num1"));
double num2 = Double.parseDouble(request.getParameter("num2"));
String operator = request.getParameter("operator");
double result = 0;

switch (operator) {
case "+":
	result = num1 + num2;
	break;
case "-":
	result = num1 - num2;
	break;
case "*":
	result = num1 * num2;
	break;
case "/":
	result = num1 / num2;
	break;
}
%>
<%=num1 %><%=operator %><%=num2 %>=<%=result %>
</body>
</html>