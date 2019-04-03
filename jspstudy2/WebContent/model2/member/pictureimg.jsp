<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<script>
    img = opener.document.getElementById("pic");
    img.src = "img/${filename}";  //업로드된 이미지 회원가입 화면에 출력
    opener.document.f.picture.value="${filename}"; //파라미터에 파일이름 설정
    self.close();
</script>