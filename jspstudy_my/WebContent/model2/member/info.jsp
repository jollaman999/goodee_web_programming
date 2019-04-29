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
</head>
<body>
<div class="w3-card w3-round w3-white">
    <div class="w3-container">
        <div style="margin-top: 25px; margin-bottom: 25px;">
            <h4 class="w3-center">회원 정보 보기</h4>
            <p class="w3-center">
                <c:choose>
                    <c:when test="${mem.picture.length() == 0}">
                        <img src="img/noimage.png" class="w3-circle" style="height:150px; width:150px">
                    </c:when>
                    <c:otherwise>
                        <img src="img/${mem.picture}" class="w3-circle" style="height:150px; width:150px">
                    </c:otherwise>
                </c:choose>
            </p>
            <hr>
            <div class="w3-bar-block" style="margin-top: 40px; margin-left: 35%">
                <p><i class="fa fa-user-o fa-fw w3-margin-right w3-text-theme"></i>${mem.id}</p>
                <p><i class="fa fa-vcard-o fa-fw w3-margin-right w3-text-theme"></i>${mem.name}</p>
                <p>
                    <c:choose>
                        <c:when test="${mem.gender == 1}">
                            <i class="fa fa-mars fa-fw w3-margin-right w3-text-theme"></i>남
                        </c:when>
                        <c:otherwise>
                            <i class="fa fa-venus fa-fw w3-margin-right w3-text-theme"></i>여
                        </c:otherwise>
                    </c:choose>
                </p>
                <p><i class="fa fa-phone fa-fw w3-margin-right w3-text-theme"></i>${mem.tel}</p>
                <p><i class="fa fa-envelope-o fa-fw w3-margin-right w3-text-theme"></i>${mem.email}</p>
            </div>
            <table>
                <tr>
                    <td colspan="2" class="no_border">
                        <a href="updateForm.me?id=${mem.id}" class="w3-button w3-black">수정</a>
                        &nbsp;&nbsp;
                        <c:if test="${mem.id != 'admin'}">
                            <a href="deleteForm.me?id=${mem.id}" class="w3-button w3-black">탈퇴</a>
                        </c:if>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
</html>