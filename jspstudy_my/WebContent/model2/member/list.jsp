<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 목록 조회</title>
    <script type="text/javascript">
        function del(id) {
            if (confirm(id + "님을 탈퇴하시겠습니까?")) {
                location.href = "delete.me?id=" + id;
            }
        }
    </script>
</head>
<body>
<form action="search.me" method="post" name="sf">
    <table class="w3-striped">
        <tr>
            <td style="border-width: 0px">
                <select name="column">
                    <option value="">선택하세요</option>
                    <option value="id">아이디</option>
                    <option value="name">이름</option>
                    <option value="tel">전화</option>
                </select>
                <script>
                    document.sf.column.value = "${param.column}";
                </script>
                <input type="text" name="find" value="${param.find}" style="width: 300px" ;>
                <input type="submit" value="검색">&nbsp;
                <c:choose>
                    <c:when test="${param.ignorecase != null}">
                        <c:set var="ignorecase_checked" value="checked"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="ignorecase_checked" value=""/>
                    </c:otherwise>
                </c:choose>
                <input type="checkbox" name="ignorecase" ${ignorecase_checked}>대소문자 구분
            </td>
        </tr>
    </table>
    <table>
        <caption>회원 목록</caption>
        <tr>
            <th>사진</th>
            <th>아이디</th>
            <th>이름</th>
            <th>성별</th>
            <th>전화</th>
            <th>&nbsp;</th>
        </tr>
        <c:forEach var="m" items="${list}">
            <tr>
                <td>
                    <c:choose>
                        <c:when test="${m.picture.length() == 0}">
                            <img src="img/noimage.png" width="80" class="w3-round">
                        </c:when>
                        <c:otherwise>
                            <img src="img/${m.picture}" width="80" class="w3-round">
                        </c:otherwise>
                    </c:choose>
                </td>
                <td><a href="info.me?id=${m.id}">${m.id}</a></td>
                <td>${m.name}</td>
                <td>${m.gender == 1 ? "남자" : "여자"}</td>
                <td>${m.tel}</td>
                <td><a href="updateForm.me?id=${m.id}">[수정]</a>
                    <c:if test="${m.id != 'admin' }">
                        <a href="javascript:del('${m.id}')">[강제탈퇴]</a>
                    </c:if></td>
            </tr>
        </c:forEach>
    </table>
</form>
</body>
</html>