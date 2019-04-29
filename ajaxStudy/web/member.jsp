<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%-- 파라미터 name 의 값을 포함하는 member 목록을 전송 --%>

<fmt:requestEncoding value="utf-8" />
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
                   url="jdbc:mariadb://127.0.0.1:3306/model1"
                   user="model1" password="1234" />
<%-- rs : ResultSet 객체. 결과 저장 객체 --%>
<sql:query var="rs" dataSource="${conn}">
    select * from member where name like ?
    <sql:param>%${param.name}%</sql:param>
</sql:query>

<table border="1" style="border-collapse: collapse">
    <tr>
        <th>아이디</th>
        <th>이름</th>
        <th>전화</th>
        <th>이메일</th>
        <th>성별</th>
    </tr>
    <c:forEach var="data" items="${rs.rows}">
        <tr>
            <td>
                ${data.id}
            </td>
            <td>
                ${data.name}
            </td>
            <td>
                ${data.tel}
            </td>
            <td>
                ${data.email}
            </td>
            <td>
                ${data.gender == 1 ? '남자' : '여자'}
            </td>
        </tr>
    </c:forEach>
</table>