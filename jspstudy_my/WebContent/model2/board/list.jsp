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
        function resetcall(page) {
            document.sf.pageNum.value = 1;
            document.sf.column.value = "";
            document.sf.find.value = "";
            document.sf.submit();
        }

        function listcall(page) {
            document.sf.pageNum.value = page;
            document.sf.submit();
        }

        function limitcall() {
            document.sf.submit();
        }
    </script>
</head>
<body>
<form action="list.do" method="post" name="sf">
    <input type="hidden" name="pageNum" value="1">
    <table>
        <caption>게시판 목록</caption>
        <c:choose>
            <c:when test="${boardcount == 0}">
                <td colspan="5">등록된 게시글이 없습니다!</td>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="5" style="text-align: right">
                        표시할 글 갯수&nbsp;&nbsp;
                        <select name="limit" onchange="limitcall(${limit})">
                            <option value="10">10</option>
                            <option value="15">15</option>
                            <option value="20">20</option>
                            <option value="30">30</option>
                            <option value="40">40</option>
                            <option value="50">50</option>
                            <script>
                                document.sf.limit.value = "${limit}";
                            </script>
                        </select>
                        &nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;글 갯수 : ${boardcount}
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
                        <div class="w3-center">
                            <div class="w3-bar">
                                <c:choose>
                                    <c:when test="${pageNum <= 1}">
                                        <div class="w3-bar-item">«</div>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="javascript:listcall(${pageNum - 1})" class="w3-bar-item w3-button w3-hover-black">«</a>
                                    </c:otherwise>
                                </c:choose>
                                <c:forEach var="a" begin="${startpage}" end="${endpage}">
                                    <c:choose>
                                        <c:when test="${a == pageNum}">
                                            <div class="w3-bar-item w3-black">
                                                ${a}
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="javascript:listcall(${a})" class="w3-bar-item w3-button w3-hover-black">${a}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:choose>
                                    <c:when test="${pageNum >= endpage}">
                                        <div class="w3-bar-item">»</div>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="javascript:listcall(${pageNum + 1})" class="w3-bar-item w3-button w3-hover-black">»</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:otherwise>
        </c:choose>
        <tr>
            <td style="border-width: 0px; text-align:center" colspan="4">
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
                &nbsp;
                <input type="text" name="find" value="${param.find}" style="width: 300px" ;>
                <input type="submit" value="검색">
                <input type="button" onclick="resetcall()" value="초기화">&nbsp;
                <c:choose>
                    <c:when test="${param.ignorecase != null}">
                        <c:set var="ignorecase_checked" value="checked"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="ignorecase_checked" value=""/>
                    </c:otherwise>
                </c:choose>
                &nbsp;&nbsp;
                <input type="checkbox" name="ignorecase" ${ignorecase_checked}>대소문자 구분
            </td>
            <td style="border-width: 0px; text-align:center">
                <a href="writeForm.do" class="w3-button w3-black">글쓰기</a>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
