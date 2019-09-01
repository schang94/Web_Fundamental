<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.ArrayList"%>
<!--  응답 MIME 타입과 문자인코딩을 지정한다. -->
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 문자인코딩을 지정한다. -->
<%@ page pageEncoding="utf-8"%>
<!-- HttpSession 객체를 사용여부 결정한다. -->
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Page Directive Demo</title>
</head>
<body>
	<h1>Page Directive1111111</h1>
	<%
		HttpSession ses = null;
		ArrayList list = new ArrayList();
		BufferedReader br = null;
		
		request.setAttribute("name", "sung");
	%>
	
	당신의 이름 : ${name}
</body>
</html>