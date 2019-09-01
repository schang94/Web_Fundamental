<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Comment Demo</title>
</head>
<body>
	<h1>jsp comment</h1>
	<!-- html 주석-->
	<%-- jsp 주석 --%>
	<%-- <input type="text" name="name" value="<%="abc" %>" /> --%>
	<%-- <input type="text" name="name" value="abc" /> --%>
	<ul>
		<%
			// int age = 0;
			for (int i = 0; i < 100; i++) {
				out.println("<li>" + i + "</li>");
			}
		%>
	</ul>
</body>
</html>