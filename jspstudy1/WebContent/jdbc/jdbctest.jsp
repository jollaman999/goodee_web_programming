<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jdbc Test</title>
<link rel="stylesheet" href="/jspstudy1/css/main.css">
<script type="text/javascript">
function view_table(f) {
	f.run.value = 1;
	f.submit();
}
</script>
</head>
<body>
<form action="jdbctest.jsp" method="post">
<textarea name="input" cols="100%" rows="8"><% if (request.getParameter("input") != null && request.getParameter("input").length() != 0) { %><%= request.getParameter("input") %><% } %></textarea>
<input type="button" value="실행" onclick="view_table(this.form)">
<input type="hidden" name="run" value="0">
</form>
<%-- request.getParameter("input").trim().equals(""); // 내용 비어있는지 확인 및 공백 제거 --%>
<% if (request.getParameter("run") != null &&
	request.getParameter("input") != null && request.getParameter("input").length() != 0 &&
	request.getParameter("run").equals("1")) { try {%>
<%
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection
			("jdbc:mariadb://127.0.0.1:3306/bigdb", "scott", "tiger");
	PreparedStatement pstmt = null;

	pstmt = conn.prepareStatement(request.getParameter("input"));
	if (pstmt != null) {
		// int records = 0;
		
		ResultSet rs = pstmt.executeQuery();
		ResultSet rs2 = pstmt.executeQuery("select count(*) from (" +
							request.getParameter("input") + ") a");
		// while(rs.next()) { records++; }
		
		ResultSetMetaData rsmt = rs.getMetaData();
		rs2.next();
%>
<br>
<h1>조회된 컬럼수 : <%= rsmt.getColumnCount() %>&nbsp;&nbsp;&nbsp;&nbsp;조회된 레코드수 : <%= rs2.getInt(1) %></h1>
	<table>
	<tr>
		<%-- <% rs = pstmt.executeQuery(); %> --%>
		<% for (int i = 1; i <= rsmt.getColumnCount(); i++) { %>
			<th><%= rsmt.getColumnName(i) %></th>
		<% } %>
	</tr>
		<% while(rs.next()) { %><tr>
			<% for (int i = 1; i <= rsmt.getColumnCount(); i++) { %>
			<td><%= rs.getString(i) %></td>
			<% } %></tr>
		<% } %>
		</table>
	<% } } catch (SQLException e) { %>
		<script type="text/javascript">
		alert("<%= e.getMessage() %>"); // 에러 메세지 알림창 띄우기
		location.href="jdbctest.jsp";
		</script>
		<% e.printStackTrace(); // 콘솔에 에러 메세지 출력 %>
		<% } %>
	}
<% } %>
</body>
</html>