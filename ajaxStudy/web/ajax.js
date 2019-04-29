var ajax = null;

function getAjaxObject() {
    if (window.ActiveXObject) { // 현재 사용하고 있는 브라우저가 익스플로러?
        try {
            return new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
                return new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e2) {
                return null;
            }
        }
    // XMLHTTPRequest : ajax 기능을 수행하는 객체. 표준 ajax 객체
    } else if (window.XMLHttpRequest) {
        return new XMLHttpRequest();
    } else {
        return null;
    }
}

// "hello.jsp", "name="+document.f.name.vale,helloFromServer,"POST"
// url = hello.jsp
// params = name = 홍길동
// callback = helloFromServer
// method = POST
function sendRequest(url, params, callback, method) {
    ajax = getAjaxObject();
    var httpMethod = method ? method : "GET";

    if (httpMethod != "GET" && httpMethod != "POST") {
        httpMethod = "GET";
    }

    var httpParams = (params == null || params == '') ? null : params;
    var httpUrl = url;

    if (httpMethod == "GET" &&  httpParams != null) {
        httpUrl = httpUrl + "?" + httpParams;
    }

    // true : 비동기 방식을 사용하도록 설정
    ajax.open(httpMethod, httpUrl, true);
    // POST 방식이 아닌 경우 설정이 필수
    ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    // 콜백 함수 지정
    ajax.onreadystatechange = callback;
    ajax.send(httpMethod == "POST" ? httpParams : null);
}