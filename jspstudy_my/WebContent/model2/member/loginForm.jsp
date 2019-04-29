<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 화면</title>
</head>
<body>
<form action="login.me" method="post">
    <table>
        <caption>로그인</caption>
        <tr>
            <th>아이디</th>
            <td><input type="text" name="id"></td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="로그인" class="w3-button w3-black">&nbsp;&nbsp;&nbsp;
                <input type="button" value="회원가입" class="w3-button w3-black" onclick="location.href='joinForm.me'">
            </td>
        </tr>
    </table>
</form>
</body>
</html>