<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 파라미터 정보 출력하기</title>
</head>
<body>
<h2>요청 파라미터 정보</h2>
<%
	// 요청파라미터의 인코딩방식을 설정 :
	// 기본 인코딩 방식 : iso-8859, 8859_1 방식. 스페인어.
	// utf-8 인코딩 방식 변경 => method=post 인 경우만 처리됨.
	request.setCharacterEncoding("utf-8");
	
	// <input type="text" name="name"> : name의 속성값이 파라미터 이름임.
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String[] hobby = request.getParameterValues("hobby");
	String year = request.getParameter("year");
%>
이름 : <%=name %><br>
나이 : <%=age %><br>
성별 : <%=gender.equals("1")?"남":"여" %><br>
취미 : 
<% for (int i = 0; i < hobby.length - 1; i++) { %>
<%=hobby[i]%>
<% } %>
<%=hobby[hobby.length - 1]%><br>
출생년도 : <%=year %><br>

<h2>모든 요청 파라미터의 모든 값 조회하기</h2>
<table>
	<tr><th>파라미터이름</th><th>파라미터값</th></tr>
<%
// Iterator의 구버젼 : 반복자. 
Enumeration e = request.getParameterNames();
	while (e.hasMoreElements()) {
		String paramName = (String)e.nextElement();
		String[] paramValues = request.getParameterValues(paramName);
%>
<tr><td><%=paramName %></td>
	<td><% for(String v : paramValues) { %>
	 <%=v%><%}%></td>
	 </tr><% } %>
</table>
</body>
</html>