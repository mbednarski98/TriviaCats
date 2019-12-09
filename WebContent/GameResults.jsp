<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.google.gson.*" %>
<%@ page import="triviacats.updateobjects.GameResults" %>
<%@ page import="triviacats.updateobjects.PlayerResult" %>
<!DOCTYPE html>
<%
	Gson gson = new Gson();
	String gameResultsJson = request.getParameter("gameResults");
	
	GameResults gameResults = gson.fromJson(gameResultsJson, GameResults.class);
	
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cat Trivia - Game Results</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
</head>

<body>
	<div id="wrapper">

		<jsp:include page="./utils/header.jsp" />
		<jsp:include page="./utils/toolbar.jsp" />

		<main id="gameResults">
			
		</main>

	</div>
	<!-- wrapper -->
</body>
</html>