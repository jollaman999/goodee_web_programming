<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session을 이용한 장바구니</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String product = request.getParameter("product");
	
	// session.getAttribute("cart") :
	// sesison 객체에 등록된 속성 중 이름이 cart인 객체 리턴.
	ArrayList<String> list = (ArrayList<String>)session.getAttribute("cart");
	if (list == null) {
		list = new ArrayList<String>();
		// session.setAttribute("cart", list) :
		// session 객체에 cart 이름을 가진 속성에 list 객체를 저장.
		session.setAttribute("cart", list);
	}
	list.add(product);
%>
<script type="text/javascript">
	alert("<%=product%>이(가) 추가 되었습니다.");
	location.href="sessionForm.jsp"; // 앞 페이지로 이동하기
</script>
</body>
</html>