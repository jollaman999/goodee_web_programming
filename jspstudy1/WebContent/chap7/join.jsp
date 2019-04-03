<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="join" class="model.Member" />
<jsp:setProperty property="*" name="join"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/jspstudy1/css/main.css">
</head>
<body>
<table>
    <tr>
    	<td>아이디</td>
        <td><%= join.getId() %></td>
    </tr>
    <tr>
    	<td>비밀번호</td>
    	<td><%= join.getPass() %></td>
    </tr>
    <tr>
    	<td>이름</td>
    	<td><%= join.getName() %></td>
    </tr>
    <tr>
    	<td>성별</td>
    	<td>
    	<%
    	int gender = join.getGender();
    	switch (gender) {
    		case 1: %>
	    		남
	    	<% break;
    		case 2: %>
	    		여
	    	<% break;
    		default: %>
    			잘못된 성별
    		<% break;
    	} %>
    	<%-- <%= join.getGender() == 1?"남":"여" --%>
    	</td>
    </tr>
    <tr>
    	<td>전화번호</td>
    	<td><%= join.getTel() %></td>
    </tr>
    <tr>
    	<td>이메일</td>
    	<td><%= join.getEmail() %></td>
    </tr>
</table>
</body>
</html>