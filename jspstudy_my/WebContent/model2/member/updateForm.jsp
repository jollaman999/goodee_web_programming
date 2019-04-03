<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.MemberDao" %>
<%@page import="model.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정 화면</title>
    <script type="text/javascript">
        function input_check(f) {
            <c:if test="${sessionScope.login != 'admin'}">
            if (f.pass.value == "") {
                alert("비밀번호를 입력하세요");
                f.pass.focus();
                return false;
            }
            </c:if>
            return true;
        }

        function passchg_winopen() {
            var op = "width=500, height=230, left=50,top=150";
            open("passwordForm.me", "", op);
        }

        function win_upload() {
            var op = "width=500, height=150, left=50, top=150";
            open("pictureimgForm.me", "", op);
        }
    </script>
</head>
<body>
<%--
    update.me 기능
    1. 모든 파라미터를 mybatisjava.Member 객체에 저장
    2. 비밀번호 검증
        - 비밀번호 일치 : db수정
            수정 성공 : 수정 성공 메시지 출력. main.me 로 페이지 이동
            수정 실패 : 수정 실패 메시지 출력. updateForm.me 페이지 이동
        - 비밀번호 불일치 : 비밀번호 오류 메시지 출력, updateForm.me로 페이지 이동
--%>
<form action="update.me" name="f" method="post"
      onsubmit="return input_check(this)">
    <input type="hidden" name="picture"
           value="${mem.picture}">
    <table>
        <caption>회원 정보 수정</caption>
        <tr>
            <td rowspan="4" valign="bottom">
                <img src="img/${mem.picture}" width="110" id="pic" class="w3-round"><br>
                <font size="1"><a href="javascript:win_upload()">사진수정</a></font>
            </td>
            <td>아이디</td>
            <td><input type="text" name="id" value="${mem.id}" readonly>
            </td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr>
            <td>이름</td>
            <td><input type="text" name="name" value="${mem.name }"></td>
        </tr>
        <tr>
            <td>성별</td>
            <td><input type="radio" name="gender" value="1"
            ${mem.gender == 1 ? "checked" : "" }>남
                <input type="radio" name="gender" value="2"
                ${mem.gender == 2 ? "checked" : "" }>여
            </td>
        </tr>
        <tr>
            <td>전화번호</td>
            <td colspan="2"><input type="text" name="tel" value="${mem.tel}"></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td colspan="2"><input type="text" name="email" value="${mem.email}"></td>
        </tr>
        <tr>
            <td colspan="3"><input type="submit" value="회원수정">
                <input type="button" value="비밀번호수정"
                       onclick="passchg_winopen()">
            </td>
        </tr>
    </table>
</form>
</body>
</html>