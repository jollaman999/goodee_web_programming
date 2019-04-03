<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 글쓰기</title>
<style type="text/css">
.content { 
	margin: 0;
	width: 300px;
	height: 200px;
}
</style>
</head>
<body>
<form action="book2.jsp" method="post">
<table>
	<tr>
		<td>방문자</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title"></td>
	</tr>
	<tr>
		<td>내용</td>
		<!-- <td><textarea name="textarea" class="content"></textarea></td> -->
		<td><textarea rows="10" cols="60" name="textarea"></textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="글쓰기">
		</td>
	</tr>
</table>
</form>
</body>
</html>