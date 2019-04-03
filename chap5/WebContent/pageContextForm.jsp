<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pageContext 객체를 이용하여 forward 연습하기</title>
</head>
<script type="text/javascript">
function city_select(c) {
	location.href='city.jsp?c=' + c;
}
</script>
<body>
<select id="city">
	<option>Seoul</option>
	<option>Busan</option>
</select>
<input type="button" value="도시조회" onclick="city_select(city.value)">
<input type="button" value="전체 도시 조회" onclick="location.href='cityAll.jsp'">
</body>
</html>