<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 화면</title>
    <script type="text/javascript">
        function win_upload() {
            var op = "width=500, height=150, left=50, top=150";
            open("pictureimgForm.me", "", op);
        }
        
        function win_id_check() {
            if (f.id.value == "") {
                alert("아이디를 입력하세요")
                f.id.focus();
                return;
            }

            var op = "width=600, height=150, left=50, top=150";
            open("idcheckForm.me", "", op);
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

            if (f.checked_duplicate_id.value == 0) {
                alert("아이디 중복확인을 해주세요!");
                f.id.focus();
                return;
            }

            f.submit();
        }
    </script>
</head>
<body>
<form action="join.me" name="f" method="post">
    <input type="hidden" name="picture" value="">
    <input type="hidden" name="checked_duplicate_id" value="0">
    <table>
        <caption>회원가입</caption>
        <tr>
            <td rowspan="4" valign="bottom">
                <img src="img/noimage.png" width="110" id="pic" class="w3-round"><br>
                <span style="font-size: xx-small;"><a href="javascript:win_upload()">사진등록</a></span>
            </td>
            <td>아이디</td>
            <td>
                <table>
                    <tr>
                        <td style="border: 0; padding: 0" width="80%">
                            <input type="text" name="id" value="중복확인을 눌러주세요" readonly>
                        </td>
                        <td style="border: 0; padding: 0">
                            <input type="button" value="중복확인" onclick="win_id_check()">
                        </td>
                    </tr>
                </table>


            </td>
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