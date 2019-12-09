<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.google.gson.*" %>
<%@ page import="triviacats.updateobjects.QuestionResults" %>
<%@ page import="triviacats.updateobjects.QuestionResult" %>
<!DOCTYPE html>
<%
	Gson gson = new Gson();
	String gameResultsJson = request.getParameter("gameResults");
	QuestionResults gameResults = gson.fromJson(gameResultsJson, QuestionResults.class);
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
			<div id="catCardContainer">
			<% for (QuestionResult qr : gameResults) { %>
				<div class="catCard">
					<img src="https://github.com/mbednarski98/TriviaCats/blob/master/WebContent/img/cat1.png?raw=true" style="height: 200px;">
					<label id="nameLabel"><%= qr.getName() %></label>
					<label id="scoreLabel">Final Score: <%= qr.getPoints() %></label>
				</div>
			<% } %>
			</div>
		</main>

	</div>
	<!-- wrapper -->
</body>
</html>