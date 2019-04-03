<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ID 중복 체크 화면</title>
    <link rel="stylesheet" href="../../css/main.css">
    <script type="text/javascript">
        function win_id_check() {
            if (f.id.value == "") {
                alert("아이디를 입력하세요")
                f.id.focus();
                return;
            }

            location.href="idcheckForm.me?id=" + f.id.value;
        }
    </script>
</head>
<body>
<c:if test="${duplicated}">
    <script>
        opener.document.f.checked_duplicate_id.value=0;
    </script>
</c:if>
<form name="f" method="post">
    <table>
        <td>아이디</td>
        <td>
            <table>
                <tr>
                    <td style="border: 0; padding: 0" width="80%">
                        <input type="text" name="id" value="${param.id}">
                    </td>
                    <td style="border: 0; padding: 0">
                        <input type="button" value="중복확인" onclick="win_id_check()">
                    </td>
                </tr>
            </table>


        </td>
    </table>
</form>
</body>
</html>
