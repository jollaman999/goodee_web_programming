<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 사진 등록</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<h3>사진 업로드</h3>
<form action="pictureimg.me" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>
                <input type="file" name="picture">
                <input type="submit" value="사진등록">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
