<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Script (스크립트 예제)</title>
</head>
<body>
<h1>Script 종류</h1>
<ol>
	<li>스크립트릿(Scriptlet) : &lt;% .... %&gt; <br>
	자바 소스의 영역. 서블릿의 _jspService() 메서드에 생성되는 영역</li>
	<li>표현식(Expression) : &lt;%= .... %&gt; <br>
	자바 소스의 영역. 내용이 브라우저 화면에 출력됨. 반드시 값이 필요함.<br>
	마지막에 ;를 찍지 않음. 주석은 여러줄 주석만 가능함.</li><br>
	<li>선언문(Declaration) : &lt;%! .... %&gt; <br>
	자바 소스의 영역. 서블릿의 멤버 변수나, 멤버 메서드로 선언됨. 거의 사용안함</li>
</ol>
<%-- out.println(100 ) --%>
<%= 100 /* 여러줄 주석 */ %>
<% String msg = "스크립트 예제;";
	for (int i=1; i<=10; i++) { %>
		<%= i + " : " + msg + "<br>" /* 여러줄 주석만 가능함. 마지막에 ; 표시 안함. */%> 
	<% } %>
<%!
	String msg = "선언문에서 선언된 msg";
	String getMsg() {
		return msg;
	}
%>
</body>
</html>


<%--
jsp 기본 구성 요소
1. 주석
 - jsp 주석 : <%-- ... %>
            jsp 페이지에서 서블릿 파일로 생성시 제외되는 영역
 - 자바 주석 : <% // 한줄 주석 %>
 			<!% // 한줄 주석
 				/* 여러줄 주석 */
 			%>
 			<%= /* 여러줄 주석 */ %>
 - HTML 주석 : <!-- -->
 			서블릿까지 주석이 아님. 단지 브라우저에서 출력될 때 제외되는 영역.
 			소스보기에서 보여짐.
2. 지시어 (Directive)
 - page : <%@ page 속성들 %> : 현재 jsp 페이지의 특징을 설정
 - include : <%@ include file="jsp 페이지" %> : 다른 페이지를 포함하는 기능.
 			현재페이지와 include 페이지가 하나의 서블릿으로 설정됨. 
 - taglib : JSTL, EL 에서 설명.

3. 스크립트 (Script)
 - 스크립트릿(Scriptlet) :서블릿 페이지의 _jspService 메서드에 자바 소스로 생성되는 부분 변수 선언시
 						지역변수로 선언됨.
 						<%   %> 
 - 표현식(Expression) : 브라우저 화면에 값을 출력하는 기능.
 						<%=  %>
 - 선언문(Declaration) : 서블릿의 멤버로 생성됨.
 						<%!  %>

4. jsp 내장객체 (8 + 1)
- request : 요청객체 => 요청 정보를 저장하고 있는 객체
- response : 응답객체 => 브라우저의 응답을 담당하는 객체
- session : 브라우저의 상태 정보를 저장하는 객체
- application : 웹어플리케이션 객체. 웹 어플리케이션의 모든 jsp가 하나의 application 객체를 공유함.
- pageContext : 현재 jsp 페이지의 저장된 정보를 관리하는 객체
- out         : response 객체의 출력버퍼에 출력하는 객체. 출력 스트림.
- config	  : 서블릿의 파라미터 값을 저장하고 있는 객체. jsp 에서는 거의 사용하지 않음.
- page		  : this 객체임. 거의 사용하지 않음.
- exception	  : 예외객체. 예외페이지 에서만 사용되는 객체.

5. 영역담당 객체 : 속성을 등록하고 조회, 삭제 할 수 있는 메서드 가지고 있는 내장 객체
 - pageContext : page 영역을 담당.
 - request : request 영역을 담당.
 - session : session 영역을 담당.
 - application : application 영역을 담당.

 - 속성관련 메서드
  속성등록 : setAttribute
  속성조회 : getAttribute
  속성제거 : removeAttribute
--%>