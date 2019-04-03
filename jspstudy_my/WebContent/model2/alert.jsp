<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    alert("${msg}");
    <c:choose>
        <c:when test="${closable}">
            opener.location.href="${url}";
            self.close();
        </c:when>
        <c:when test="${check_id}">
            opener.document.f.id.value="${param.id}";
            opener.document.f.checked_duplicate_id.value=1;
            self.close();
        </c:when>
        <c:otherwise>
            location.href="${url}";
        </c:otherwise>
    </c:choose>
</script>