<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>형식화 태그 예제</title>
</head>
<body>
<h3>숫자 관련 형식 지정하기</h3>
<%-- type="currency" : 해당 지역의 화폐단위를 표시. --%>
<fmt:formatNumber value="500000" type="currency"/><br>
<%-- fmt:setLocale : 지역 설정 태그 --%>
<fmt:setLocale value="en_US" />
<fmt:formatNumber value="500000" type="currency"/><br>
<fmt:setLocale value="ko_KR" />
<fmt:formatNumber value="0.15" type="percent"/><br>
<fmt:formatNumber value="500000.12345" pattern="###,###.00"/><br>
<h3>날짜 관련 형식 지정하기</h3>
<jsp:useBean id="today" class="java.util.Date" />
년월일 <fmt:formatDate value="${today}" type="date"/><br>
시분초 <fmt:formatDate value="${today}" type="time"/><br>
일시 : <fmt:formatDate value="${today}" type="both"/><br>
형식지정 : <fmt:formatDate value="${today}" pattern="yyyy-MM-dd HH:mm:ss a"/><br>
<br>
일시1 : <fmt:formatDate value="${today}" type="both" timeStyle="short" dateStyle="short"/><br>
일시2 : <fmt:formatDate value="${today}" type="both" timeStyle="Long" dateStyle="Long"/><br>
일시3 : <fmt:formatDate value="${today}" type="both" timeStyle="full" dateStyle="full"/><br>
일시4 : <fmt:formatDate value="${today}" type="both" timeStyle="full" dateStyle="full" timeZone="GMT"/><br>
</body>
</html>