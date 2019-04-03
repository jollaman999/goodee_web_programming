<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String date = "";
if (session.getAttribute("date") == null) { %>
<script type="text/javascript">
alert("date 속성이 제거되었습니다. date1.jsp 에서 재등록 해주세요! date1.jsp로 돌아갑니다.");
//history.go(-1);
location.href="date1.jsp";
</script>
<% } else {
	date = (String)session.getAttribute("date");
	session.invalidate();
}
%>
<%=date %>
</body>
</html>