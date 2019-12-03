<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cat Trivia - Play Game</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
</head>
<%
	int numberOfCats = 4;
%>
<body>
	<main>
		<!-- TODO: Code auto-population of cat cards -->
		<%
			for (int i = 0; i < numberOfCats; i++) {
		%>
		<jsp:include page="./utils/catCard.jsp">
			<jsp:param name="username" value="Punk Cat" />
			<jsp:param name="avgScore" value="55" />
			<jsp:param name="longScore" value="117" />
		</jsp:include>
		<%
			}
		%>
	</main>
</body>
</html>