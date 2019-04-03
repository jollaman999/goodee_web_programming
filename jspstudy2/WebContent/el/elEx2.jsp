<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>elEx1.jsp의 결과 화면</title>
</head>
<body>
<%--
${속성 } 가져오는 순서 : pageContext --> request --> session
--%>
<%
request.setCharacterEncoding("utf-8");
String tel = "010-1111-2222";
pageContext.setAttribute("tel", tel);
pageContext.setAttribute("test", "pageContext 객체의 test 속성값");
%>
<h3>JSP의 스크립트를 이용하여 파라미터와 속성값 출력</h3>
pageContext test 속성값 : <%= pageContext.getAttribute("test") %><br>
session test 속성값 : <%= session.getAttribute("test") %><br>
today 속성값 : <%= session.getAttribute("today") %><br>
name 파라미터값 : <%= request.getParameter("name") %><br>
tel 변수값 : <%= tel %><br>
tel 속성값 : <%= pageContext.getAttribute("tel") %><br>
<h3>JSP의 스크립트를 이용하여 파라미터와 속성값 출력</h3>
pageContext test 속성값 : ${test }<br>
session test 속성값 : ${sessionScope.test }<br>
today 속성값 : ${today }<br>
name 파라미터값 : ${param.name }<br>
tel 변수값 : EL로 표현 못함<br>
tel 속성값 : ${tel }<br>
noAttribute 속성값 : ${noAttribute }<br>
<%--
${test} : 영역담당 객체에 저장된 속성 중 이름이 test인 속성의 값을 리턴.
		pageConext < request < session < application
1. pageContext 객체에 test 속성 검색. 존재하면 속성값 리턴.
2. 1번에 속성이 없으면
	request 객체에 test 속성 검색. 존재하면 속성 값 리턴.
3. 2번에 속성이 없으면
	session 객체에 test 속성 검색. 존재하면 속성 값 리턴.
4. 3번에 속성이 없으면
	application 객체에 test 속성 검색. 존재하면 속성 값 리턴.
5. 4번에 속성이 없으면
	아무것도 출력하지 않는다. null 도 출력하지 않음. 오류발생도 없음.
직접 영역담당 객체를 지정할 수 있다.
	pageContext 객체의 속성 : ${pageScope.test }
	request 객체의 속성 : ${requestScope.test }
	session 객체의 속성 : ${sessionScope.test }
	application 객체의 속성 : ${applicationScope.test }
--%>
</body>
</html>