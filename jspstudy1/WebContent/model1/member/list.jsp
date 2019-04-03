<%@page import="java.util.List"%>
<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/jspstudy1/css/main.css">
</head>
<script type="text/javascript">
function delete_confirm(url) {
	if (confirm("정말 탈퇴 하시겠습니까?")) {
		location.href=url;
	} else {
		alert("탈퇴가 취소 되었습니다.");
	}
}
</script>
<body>
<%
String login = (String)session.getAttribute("login");

if (login == null || login.length() == 0) {
%>
	<script type="text/javascript">
		alert("잘못 된 접근!");
		location.href="loginForm.jsp";
	</script>
<%
	return;
} else if (!login.equals("admin")) {
%>
	<script type="text/javascript">
		alert("관리자만 접근이 가능합니다!");
		location.href="main.jsp"
	</script>
<%
	return;
}
%>

<%
List<Member> list = new MemberDao().list();
if (list == null) { %>
	<script type="text/javascript">
		alert("회원정보를 가져올 수 없습니다!");
		location.href="main.jsp"
	</script>
<% } %>
<table>
	<caption>MODEL1 회원 목록</caption>
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>성별</th>
		<th>전화</th>
		<th>이메일</th>
		<th>&nbsp;</th>
	</tr>
	<% for (Member m : list) { %>
	<tr>
		<td><a href="info.jsp?id=<%= m.getId() %>"><%= m.getId() %></a></td>
		<td><%= m.getName() %></td>
		<td><%= m.getGender()==1?"남자":"여자" %></td>
		<td><%= m.getTel() %></td>
		<td><%= m.getEmail() %></td>
		<td><a href="updateForm.jsp?id=<%= m.getId() %>">[수정]</a>
<%
		if (!m.getId().equals("admin")) {
%>
         <a href="javascript:delete_confirm('delete.jsp?id=<%= m.getId() %>')">[강제탈퇴]</a>
 <%
		}
%>
		</td>
	</tr>
	<% } %>
</table>

<%--
<%  try {
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection
			("jdbc:mariadb://127.0.0.1:3306/model1", "model1", "1234");
	PreparedStatement pstmt = null;

	pstmt = conn.prepareStatement("select * from member");
	if (pstmt != null) {
		ResultSet rs = pstmt.executeQuery();
		ResultSetMetaData rsmt = rs.getMetaData();
%>
	<table>
	<caption>MODEL1 회원 목록</caption>
	<tr>
		<% for (int i = 1; i <= rsmt.getColumnCount(); i++) { %>
			<th><%= rsmt.getColumnName(i) %></th>
		<% } %>
	</tr>
		<% while(rs.next()) { %><tr>
			<% for (int i = 1; i <= rsmt.getColumnCount(); i++) { %>
				<td>
				<% if (i == 1) { %>
					<a href="info.jsp?id=<%= rs.getString(i) %>"><%= rs.getString(i) %></a>
				<% } else { %>
					<%= rs.getString(i) %>
				<% } %>
				</td>
			<% } %></tr>
		<% } %>
		</table>
	<% } } catch (SQLException e) { %>
		<script type="text/javascript">
		alert("<%= e.getMessage() %>"); // 에러 메세지 알림창 띄우기
		location.href="main.jsp";
		</script>
		<% e.printStackTrace(); // 콘솔에 에러 메세지 출력 %>
	<% } %>
--%>
</body>
</html>