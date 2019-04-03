<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 탈퇴 비밀번호 확인</title>
    <link rel="stylesheet" href="/jspstudy2/css/main.css">
</head>
<body>
<form name="f" action="delete.me" method="post">
    <input type="hidden" name="id" value="${param.id}">
    <table>
        <caption>회원 정보 비밀번호 입력</caption>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="탈퇴하기"></td>
        </tr>
    </table>
</form>
</body>
</html>