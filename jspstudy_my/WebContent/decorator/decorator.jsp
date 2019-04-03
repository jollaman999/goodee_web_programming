<%@ page import="model.Member" %>
<%@ page import="model.MemberDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title><decorator:title /></title>
    <decorator:head/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${path}/css/main.css">
    <link rel="stylesheet" href="${path}/css/w3.css">
    <link rel="stylesheet" href="${path}/css/fonts/Raleway.css">
    <!-- https://fontawesome.com/v4.7.0/icons/ -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body, h1, h2, h3, h4, h5, h6 {
            font-family: "Raleway", sans-serif
        }
    </style>
</head>
<body class="w3-white w3-content" style="max-width:1600px">

<% Member mem = new MemberDao().selectOne((String)session.getAttribute("login")); %>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-indigo w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
    <div class="w3-container">
        <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey"
           title="close menu">
            <i class="fa fa-remove"></i>
        </a>
        <% if (mem != null && mem.getPicture() != null && mem.getPicture().length() != 0) { %>
            <img src="../../model2/member/img/<%= mem.getPicture() %>" style="width:70%;" class="w3-round"><br><br>
        <% } %>
        <h4><b>JOLLA's WEB BOARD</b></h4>
    </div>
    <div class="w3-bar-block">
        <div class="w3-padding"></div>

        <% if (mem == null) { %>
        <a href="${path}/model2/member/loginForm.me" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">
            <i class="fa fa-key fa-fw w3-margin-right"></i>로그인</a>
        <a href="${path}/model2/member/joinForm.me" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">
            <i class="fa fa-id-card fa-fw w3-margin-right"></i>회원가입</a>
        <% } else { %>
        <i class="fa fa-id-badge fa-fw w3-margin-left w3-margin-right"></i><%= mem.getName() %>님
        <div class="w3-padding"></div>
        <a href="${path}/model2/member/logout.me" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">
            <i class="fa fa-lock fa-fw w3-margin-right"></i>로그아웃</a>
        <% } %>

        <div class="w3-padding"></div>

        <a href="${path}/model2/board/list.do" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">
            <i class="fa fa-list fa-fw w3-margin-right"></i>게시판</a>
        <a href="${path}/model2/member/main.me" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">
            <i class="fa fa-user fa-fw w3-margin-right"></i>마이 페이지</a>
        <% if (mem != null && mem.getId().equals("admin")) { %>
            <a href="${path}/model2/member/list.me" onclick="w3_close()" class="w3-bar-item w3-button w3-padding">
                <i class="fa fa-users fa-fw w3-margin-right"></i>회원 관리</a>
        <% } %>
    </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer"
     title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px">

    <!-- Header -->
    <header id="aaaa">
        <% if (mem != null && mem.getPicture() != null && mem.getPicture().length() != 0) { %>
            <img src="../../model2/member/img/<%= mem.getPicture() %>" style="width:65px;"
                             class="w3-circle w3-right w3-margin w3-hide-large">
        <% } %>
        <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i
                class="fa fa-bars"></i></span>
        <div class="w3-container">
            <h1><b>JOLLA's WEB BOARD</b></h1>
        </div>
    </header>

    <!-- Content -->
    <div class="main-content">
        <decorator:body/>
    </div>

    <!-- Footer -->
    <footer class="w3-container w3-padding-32 w3-teal">
        <div class="w3-row-padding">
                <h3>Hello? I'm jollaman999!!</h3>
                <p>Tel : 112<br>email : admin@jollaman999.com<br>Location : In front of my so many buggy codes</p>
        </div>
    </footer>

    <div class="w3-black w3-center w3-padding-24">
        ⓒ 2019 by jollaman999 with Goodee
    </div>

    <!-- End page content -->
</div>

<script>
    // Script to open and close sidebar
    function w3_open() {
        document.getElementById("mySidebar").style.display = "block";
        document.getElementById("myOverlay").style.display = "block";
    }

    function w3_close() {
        document.getElementById("mySidebar").style.display = "none";
        document.getElementById("myOverlay").style.display = "none";
    }
</script>

</body>
</html>
