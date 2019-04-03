<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>합계 결과 보기</title>
</head>
<body>
<%
int num = Integer.parseInt(request.getParameter("num")); // 입력된 숫자
String kind = request.getParameter("kind"); // 0 : 전체합, 1 : 홀수합, 2 : 짝수합
int sum = 0;
boolean error = false;

if (kind.equals("0")) {
	for (int i = 1; i <= num; i++)
		sum += i;
} else if (kind.equals("1")) {
	for (int i = 1; i <= num; i++) {
		if (i % 2 != 0)
			sum += i;
	}
} else if (kind.equals("2")) {
	for (int i = 1; i <= num; i++) {
		if (i % 2 == 0)
			sum += i;
	}
} else {
	error = true;
}
%>
<%
if (error) { %><h1>
	잘못 된 kind!
<% } else { %>
	<%=num%>까지의 <%= (kind.equals("0")?"전체":(kind.equals("1")?"홀수":"짝수")) %>합: <%=sum%>
<% } %></h1>
</body>
</html>