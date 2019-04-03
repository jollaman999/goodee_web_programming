<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션을 이용한 장바구니 예제</title>
</head>
<!--
sessionForm.jsp
sessionadd.jsp
sessiontot.jsp
3개의 jsp 파일들이 session 객체를 공유함.
 -->
<body>
<h2>상품 선택</h2>
<form name="f" method="post" action="sessionadd.jsp">
	<select name="product">
		<option>사과</option>
		<option>배</option>
		<option>귤</option>
		<option>자몽</option>
		<option>감</option>
		<option>딸기</option>
	</select>
	<input type="submit" value="장바구니 추가">
	<input type="button" value="장바구니 비우기">
</form>
<a href="sessionview.jsp">장바구니 보기</a>
</body>
</html>