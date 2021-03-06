<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	1. 원글의 num을 파라미터로 받는다.
	2. 원글의 num, ref, reflevel, refstep 정보를 저장
	3. 입력 화면 표시
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 답글 쓰기</title>
<link rel="stylesheet" href="/jspstudy2/css/main.css">
<script type="text/javascript">
function reply_submit() {
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
</script>
</head>
<body>
	<form action="reply.do" method="post" enctype="multipart/form-data" name="f">
		<input type="hidden" name="num" value="${b.num}">
		<input type="hidden" name="pageNum" value="${param.pageNum}">
		<input type="hidden" name="ref" value="${b.ref}">
		<input type="hidden" name="reflevel" value="${b.reflevel}">
		<input type="hidden" name="refstep" value="${b.refstep}">
		<table>
			<caption>MODEL1 게시판 답글 등록</caption>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="subject" value="[RE]${b.subject} "></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="15"></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="file1"></td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="javascript:reply_submit()">[답변글등록]</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>