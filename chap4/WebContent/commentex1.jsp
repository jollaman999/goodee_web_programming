<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 기본 요소의 주석 설명</title>
</head>
<body>
<h1>jsp 패이지 에서 사용되는 주석 3가지</h1>
<ol>
	<li>jsp 주석 : &lt;%-- jsp 주석표현 --%&gt;</li>
	<%-- jsp 주석 입니다. jsp 페이지에서만 보여집니다. 서블릿에서는 보이지 않습니다. --%>
	<li>자바 주석 : &lt;% // java 주석표현 %&gt;</li>
	<% // 한 줄 주석입니다.
	/* 여러줄 주석입니다. 자바 주석은 서블릿에서 볼 수 있습니다. */
	String msg = "주석예제 ";
	%>
	<li>HTML 주석 : &lt;!-- HTML 주석표현 --&gt;<br>
	JSP 페이지나, 서블릿에서는 주석이 아닙니다. 브라우저의 소스보기에서 볼 수 있습니다.
	<!-- <%=msg%> HTML 주석입니다. 브라우저에서 주석으로 인식합니다. -->
	</li>
</ol>
</body>
</html>