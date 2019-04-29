<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 상세보기</title>
</head>
<body>
<table>
    <caption>게시물 상세 보기</caption>
    <tr>
        <td width="20%">글쓴이</td>
        <td width="80%" style="text-align: left">${board.getName()}</td>
    </tr>
    <tr>
        <td>제목</td>
        <td style="text-align: left">${board.getSubject()}</td>
    </tr>
    <tr>
        <td>내용</td>
        <td>
            <table style="width: 100%; height: 250px;">
                <tr>
                    <td style="border-width: 0px; vertical-align: top; text-align: left;">
                        <pre>${board.getContent()}</pre>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>첨부파일</td>
        <td>
            <c:if test="${!empty board.getFile1()}">
                <a href="file/${board.getFile1()}" target="_blank">${board.getFile1()}</a>
            </c:if>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <a href="replyForm.do?num=${num}&pageNum=${param.pageNum}" class="w3-button w3-black">답변</a>&nbsp;&nbsp;
            <a href="updateForm.do?num=${num}&pageNum=${param.pageNum}" class="w3-button w3-black">수정</a>&nbsp;&nbsp;
            <a href="deleteForm.do?num=${num}&pageNum=${param.pageNum}" class="w3-button w3-black">삭제</a>&nbsp;&nbsp;
            <a href="list.do?pageNum=${param.pageNum}" class="w3-button w3-black">목록</a>
        </td>
    </tr>
</table>
</body>
</html>