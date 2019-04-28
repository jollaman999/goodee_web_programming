<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 글쓰기</title>
    <script type="text/javascript">
        function board_submit() {
            f = document.f;
            if (f.name.value == "") {
                alert("글쓴이를 입력하세요")
                f.name.focus();
                return;
            }
            <c:if test="${!board_member}">
                if (f.pass.value == "") {
                    alert("비밀번호를 입력하세요")
                    f.pass.focus();
                    return;
                }
            </c:if>
            if (f.subject.value == "") {
                alert("제목을 입력하세요")
                f.subject.focus();
                return;
            }
            if (f.content.value == "") {
                alert("내용을 입력하세요")
                f.content.focus();
                return;
            }

            if (f.name.value.length > 30) {
                alert("글쓴이의 길이는 30자로 제한되어 있습니다!");
                f.name.focus();
                return;
            }

            f.submit();
        }
    </script>
</head>
<body>
<form action="write.do" method="post" enctype="multipart/form-data" name="f">
    <table>
        <caption>게시판 글쓰기</caption>
        <tr>
            <td>글쓴이</td>
            <c:choose>
                <c:when test="${board_member}">
                    <td><input type="text" name="name" value="${name}" readonly></td>
                </c:when>
                <c:otherwise>
                    <td><input type="text" name="name"></td>
                </c:otherwise>
            </c:choose>
        </tr>
        <c:if test="${!board_member}">
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="pass"></td>
            </tr>
        </c:if>
        <tr>
            <td>제목</td>
            <td><input type="text" name="subject"></td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea rows="15" name="content"></textarea></td>
        </tr>
        <tr>
            <td>첨부파일</td>
            <td><input type="file" name="file1"></td>
        </tr>
        <tr>
            <td colspan="2">
                <a href="javascript:board_submit()">[게시물 등록]</a></td>
        </tr>
    </table>
</form>
</body>
</html>