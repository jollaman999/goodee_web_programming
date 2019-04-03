<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 수정 화면</title>
    <script type="text/javascript">
        function update_submit() {
            f = document.f;
            if (f.name.value == "") {
                alert("글쓴이를 입력하세요")
                f.name.focus();
                return;
            }
            if (f.pass.value == "") {
                alert("비밀번호를 입력하세요")
                f.pass.focus();
                return;
            }
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

        function file_delete() {
            document.f.file2.value = "";
            file_desc.style.display = "none";
        }
    </script>
</head>
<body>
<form action="update.do" method="post" enctype="multipart/form-data" name="f">
    <input type="hidden" name="num" value="${b.num}">
    <input type="hidden" name="pageNum" value="${param.pageNum}">
    <input type="hidden" name="file2"
           value="${b.file1}">
    <table>
        <caption>게시판 수정 화면</caption>
        <tr>
            <td>글쓴이</td>
            <td><input type="text" name="name" value="${b.name}"></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr>
            <td>제목</td>
            <td><input type="text" name="subject" value="${b.subject}"></td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea rows="15" name="content">${b.content}</textarea></td>
        </tr>
        <tr>
            <td>첨부파일</td>
            <td>
                <c:if test="${!empty b.file1}">
                    <div id="file_desc">
                        ${b.file1}
                        <a href="javascript:file_delete()">[첨부파일 삭제]</a>
                    </div>
                </c:if>
                <input type="file" name="file1">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <!-- <a href="javascript:document.f.submit()">[게시물 수정]</a> -->
                <a href="javascript:update_submit()">[게시물 수정]</a>
            </td>
        </tr>
    </table>
</form>
</body>
</html>