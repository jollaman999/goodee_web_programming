<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 사진 등록</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css" >
</head>
<body>
<h3>업로드</h3>
<form action="pictureimg.jsp" method="post" enctype="multipart/form-data">
  <input type="file" name="picture">
  <input type="submit" value="사진등록">
</form>
</body>
</html>