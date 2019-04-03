<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입화면</title>
    <link rel="stylesheet" href="/jspstudy2/css/main.css">
    <script type="text/javascript">
        function win_upload() {
            var op = "width=500, height=150, left=50, top=150";
            open("pictureimgForm.jsp", "", op);
        }

        function reply_submit() {
            f = document.f;
            if (f.id.value == "") {
                alert("아이디를 입력하세요")
                f.id.focus();
                return;
            }
            if (f.pass.value == "") {
                alert("비밀번호를 입력하세요")
                f.pass.focus();
                return;
            }
            if (f.name.value == "") {
                alert("이름을 입력하세요")
                f.name.focus();
                return;
            }
            if (f.gender.value == "") {
                alert("성별을 선택하세요")
                f.gender.focus();
                return;
            }

            if (f.tel.value == "") {
                alert("전화번호를 입력하세요")
                f.tel.focus();
                return;
            }
            if (f.email.value == "") {
                alert("이메일을 입력하세요")
                f.email.focus();
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
<form action="join.me" name="f" method="post">
    <input type="hidden" name="picture" value="">
    <table>
        <caption>MODEL2으로 구현한 회원가입</caption>
        <tr>
            <td rowspan="4" valign="bottom">
                <img src="" width="100" height="120" id="pic"><br>
                <font size="1"><a href="javascript:win_upload()">사진등록</a></font>
            </td>
            <td>아이디</td>
            <td><input type="text" name="id"></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr>
            <td>이름</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>성별</td>
            <td><input type="radio" name="gender" value="1" checked>남
                <input type="radio" name="gender" value="2">여
            </td>
        </tr>
        <tr>
            <td>전화번호</td>
            <td colspan="2"><input type="text" name="tel"></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td colspan="2"><input type="text" name="email"></td>
        </tr>
        <tr>
            <td colspan="3"><a href="javascript:reply_submit()">[회원가입]</a></td>
        </tr>
    </table>
</form>
</body>
</html>