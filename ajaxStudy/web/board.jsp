<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:requestEncoding value="utf-8" />
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
                   url="jdbc:mariadb://127.0.0.1:3306/model1"
                   user="model1" password="1234" />
<sql:query var="rs" dataSource="${conn}">
    select * from board where ${param.column} like ?
    <sql:param>%${param.find}%</sql:param>
</sql:query>


<table border="1" style="border-collapse: collapse">
    <tr>
        <th>번호</th>
        <th>글쓴이</th>
        <th>제목</th>
        <th>내용</th>
        <th>등록일</th>
        <th>조회수</th>
    </tr>
    <c:forEach var="data" items="${rs.rows}">
        <tr>
            <td>
                ${data.num}
            </td>
            <td>
                    ${fn:substring(data.name, 0, 15)}
                <c:if test="${fn:length(data.name) > 10}">.....</c:if>
            </td>
            <td>
                ${fn:substring(data.subject, 0, 15)}
                <c:if test="${fn:length(data.subject) > 10}">.....</c:if>
            </td>
            <td>
                ${fn:substring(data.content, 0, 15)}
                <c:if test="${fn:length(data.content) > 10}">.....</c:if>
            </td>
            <td>
                ${data.regdate}
            </td>
            <td>
                ${data.readcnt}
            </td>
        </tr>
    </c:forEach>
</table>