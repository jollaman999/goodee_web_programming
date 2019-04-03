<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="day" class="java.util.Date"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 목록 보기</title>
    <script type="text/javascript">
        function listcall(page) {
            document.sf.column.value = "";
            document.sf.find.value = "";
            document.sf.pageNum.value = page;
            document.sf.submit();
        }
    </script>
</head>
<link rel="stylesheet" href="/jspstudy2/css/main.css">
<body>
<form action="list.do" method="post" name="sf">
    <input type="hidden" name="pageNum" value="1">
    <table>
        <tr>
            <td style="border-width: 0px">
                <select name="column">
                    <option value="">선택하세요</option>
                    <option value="subject">제목</option>
                    <option value="name">작성자</option>
                    <option value="content">내용</option>
                    <option value="subject,content">제목+내용</option>
                    <option value="name,content">작성자+내용</option>
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
        <caption>MODEL2 게시판 목록</caption>
        <c:choose>
            <c:when test="${boardcount == 0}">
                <td colspan="5">등록된 게시글이 없습니다!</td>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="5" style="text-align:right">글개수 :${boardcount}
                    </td>
                </tr>
                <tr>
                    <th width="8%">번호</th>
                    <th width="50%">제목</th>
                    <th width="14%">작성자</th>
                    <th width="17%">등록일</th>
                    <th width="11%">조회수</th>
                </tr>
                <c:forEach var="b" items="${list}">
                    <tr>
                        <td>${boardnum}
                            <c:set var="boardnum" value="${boardnum - 1}"/>
                        </td>
                        <td style="text-align: left;">
                            <c:if test="${b.getReflevel() > 0}">
                                <c:forEach var="i" begin="0" end="${b.getReflevel() - 1}">
                                    &nbsp;&nbsp;&nbsp;
                                </c:forEach>
                                └
                            </c:if>
                            <c:if test="${!empty b.file1}">
                                <a href="file/${b.file1}" target="_blank" style="text-decoration: none;"><img
                                        src="img/file.png"
                                        width="15"
                                        height="15">&nbsp;</a>
                            </c:if>
                            <c:choose>
                                <c:when test="${empty param.pageNum}">
                                    <a href="info.do?num=${b.num}&pageNum=1">${b.subject}
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="info.do?num=${b.num}&pageNum=${param.pageNum}">${b.subject}
                                    </a>
                                </c:otherwise>
                            </c:choose>
                            <c:if test="${empty param.pageNum}">
                                <c:set var="param.pageNum" value="1"/>
                            </c:if>
                        </td>
                        <td>${b.name}
                        </td>
                        <fmt:formatDate value="${day}" pattern="yyyyMMdd" var="today"/>
                        <fmt:formatDate value="${b.regdate}" pattern="yyyyMMdd" var="regdate"/>

                        <td>
                            <c:choose>
                                <c:when test="${today == regdate}">
                                    <fmt:formatDate value="${b.regdate}" pattern="HH:mm:ss"/>
                                </c:when>
                                <c:otherwise>
                                    <fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd HH:mm"/>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${b.readcnt}
                        </td>
                    </tr>
                </c:forEach>
                <%-- 페이지 처리 부분 --%>
                <tr>
                    <td colspan="5">
                        <c:choose>
                            <c:when test="${pageNum <= 1}">
                                [이전]
                            </c:when>
                            <c:otherwise>
                                <a href="javascript:listcall(${pageNum - 1})">[이전]</a>
                            </c:otherwise>
                        </c:choose>
                        <c:forEach var="a" begin="${startpage}" end="${endpage}">
                            <c:choose>
                                <c:when test="${a == pageNum}">
                                    [${a}]
                                </c:when>
                                <c:otherwise>
                                    <a href="javascript:listcall(${a})">[${a}]</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${pageNum >= endpage}">
                                [다음]
                            </c:when>
                            <c:otherwise>
                                <a href="javascript:listcall(${pageNum + 1}">[다음]</a>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:otherwise>
        </c:choose>
        <tr>
            <td colspan="5" style="text-align:right">
                <a href="writeForm.do">[글쓰기]</a>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
