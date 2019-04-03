<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><decorator:title /></title>
    <decorator:head />
    <link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
<table>
    <tr>
        <td colspan="3" align="right">Model2 프로그램 연습</td>
    </tr>
    <tr>
        <td width="15%">
            <a href="${path}/model2/member/main.me">회원관리</a><br>
            <a href="${path}/model2/board/list.do">게시판</a><br>
        </td>
        <td colspan="2" style="text-align: left; vertical-align: top">
            <decorator:body />
        </td>
    </tr>
    <tr>
        <td colspan="3">구디아카데미 Since 2016</td>
    </tr>
</table>
</body>
</html>
