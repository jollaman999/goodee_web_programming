<%@page import="model.MemberDao" %>
<%@page import="model.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
	1. id 파라미터 값 저장하기
	2. 로그인 상태 검증.
		로그아웃 상태 : 로그인이 필요합니다. 메세지 출력하고, loginForm.jsp 페이지 이동
	3. 로그인 상태
		3-1 : id 파라미터정보와 login 정보를 비교해서 다르면
		자신의 정보만 조회 가능합니다. 메세지 출력. main.jsp 페이지 이동.
		3-2 : id 파라미터 정보와 login 정보를 비교하여 다르지만 login이 관리자인 경우와
		id 와 로그인 정보가 같은 경우 화면에 내용 출력하기
		MemverDao().selectOne(id) 메서드를 이용하여 db 내용 조회하기
	4. 관리자로 로그인 한 경우나, 자신정보 조회시 화면에 출력하기
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보보기</title>
    <link rel="stylesheet" href="/jspstudy2/css/main.css">
</head>
<body>
<table>
    <caption>MODEL2 회원 정보 보기</caption>
    <tr>
        <td rowspan="6">
            <img src="img/${mem.picture}" width="100" height="120">
        </td>
        <td>아이디</td>
        <td>${mem.id}</td>
    </tr>
    <tr>
        <td>이름</td>
        <td>${mem.name}</td>
    </tr>
    <tr>
        <td>성별</td>
        <td>${mem.gender == 1?"남":"여"}</td>
    </tr>
    <tr>
        <td>전화</td>
        <td>${mem.tel}</td>
    </tr>
    <tr>
        <td>이메일</td>
        <td>${mem.email}</td>
    </tr>
    <tr>
        <td colspan="2">
            <a href="updateForm.me?id=${mem.id}">[수정]</a>
            <c:if test="${mem.id != 'admin'}">
                <a href="deleteForm.me?id=${mem.id}">[탈퇴]</a>
            </c:if>
        </td>
    </tr>
</table>
</body>
</html>