<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core 태그 연습 : 반복 구문</title>
</head>
<body>
<h3>반복관련 태그 : forEach</h3>
<c:forEach var="test" begin="1" end="10" step="2">
${test}&nbsp;&nbsp;&nbsp;
</c:forEach>
<h3>forEach 태그를 이용하여 1부터 100까지의 합을 구하기</h3>
<c:forEach var="i" begin="1" end="100">
	<c:set var="sum" value="${sum+i}"/>
</c:forEach>
1부터 100까지의 합 : ${sum}
<h3>forEach 태그를 이용하여 2단부터 9단까지의 구구단 출력하기</h3>
<table border="1" cellspacing="0" cellpadding="0">
<caption>구구단</caption>
<tr>
	<c:forEach var="i" begin="2" end="9">
		<th>${i}단</th>
	</c:forEach>
</tr>
<c:forEach var="i" begin="1" end="9">
	<tr>
		<c:forEach var="j" begin="2" end="9">
			<td>
				${j} x ${i} = ${i * j}
			</td>
		</c:forEach>
	</tr>
</c:forEach>
</table>
<h3>forEach 태그를 이용하여 List 객체 출력하기</h3>
<%
	List<Integer> list = new ArrayList<Integer>();
	for (int i = 1; i < 10; i++)
		list.add(i * 10);
	pageContext.setAttribute("list", list);
	
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("name", "홍길동");
	map.put("today", new Date());
	map.put("age", 20);
	pageContext.setAttribute("map", map);
%>
<c:forEach var="i" items="${list}">
	${i}&nbsp;&nbsp;&nbsp;
</c:forEach>
<c:forEach var="i" items="${list}" varStatus="stat">
	<c:if test="${stat.index == 0}">
		<h4>forEach 태그의 varStatus 속성 연습</h4>
	</c:if>
	${stat.count}:${i}<br>
</c:forEach>
<h3>forEach 태그를 이용하여 Map 객체 출력하기</h3>
<c:forEach var="m" items="${map}" varStatus="stat">
	${stat.count}:${m.key}=${m.value}<br>
</c:forEach>
<h3>EL을 이용하여 Map 객체 출력하기</h3>
name=${map.name}<br>
today=${map.today}<br>
age=${map.age}<br>
<c:set var="arr" value="<%=new int[]{10, 20, 30, 40, 50} %>"/>
<h3>배열 객체의 요소 출력</h3>
<c:forEach var="s" items="${arr}" varStatus="stat">
	arr[${stat.index}]=${s}<br>
</c:forEach>
<h4>배열 객체의 두번째 요소부터 세번째 요소까지 출력하기</h4>
<c:forEach var="s" items="${arr}" varStatus="stat" begin="1" end="2">
	arr[${stat.index}]=${s}<br>
</c:forEach>
<h4>배열 객체의 짝수 첨자 기준으로 출력하기</h4>
<c:forEach var="s" items="${arr}" varStatus="stat" step="2">
	arr[${stat.index}]=${s}<br>
</c:forEach>
<h4>배열 객체의 홀수 첨자 기준으로 출력하기</h4>
<c:forEach var="s" items="${arr}" varStatus="stat" begin="1" step="2">
	arr[${stat.index}]=${s}<br>
</c:forEach>
</body>
</html>