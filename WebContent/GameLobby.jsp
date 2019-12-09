<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	int roomNumber = -1;

	if (request.getMethod().contains("POST")) {
		roomNumber = Integer.parseInt(request.getParameter("roomNumber"));
	} else {
		// TODO: redirect to dashboard
	}
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cat Trivia - Play Game</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" type="text/css" href="./css/snackbar.css">
</head>
<%
	int numberOfCats = 4;
%>
<body onload="connectToServer()">
	<%
		String username = null;
		if (session.getAttribute("username") != null) {
			username = (String) session.getAttribute("username");
		}
	%>
	<main>
		<div id="gameLogin">
			<input id="nameElement" value="" type="text">
			<button id="sub" type="button" onclick="connectToServer()">CONNECT</button>
			<input id="readyCheck" type="checkbox" onclick="sendReady()"
				name="readyCheck"> <label id="readyCheckLabel"
				for="readyCheck">Ready</label>
		</div>

		<div id="catCardContainer"></div>

		<div id="questionContainer">
			<h2 id="questionText"></h2>
			<div id="answerList"></div>
			<button id="submitAnswer" type="button" onclick="submitAnswer()">Submit
				Answer</button>
		</div>

	</main>
	<div id="snackBar" class="snackBar"></div>
</body>
<script src="./js/client.js"></script>
<script>
		var client = new WebSocketClient("ws", "localhost", "8080", "/TriviaCats/trivia/<%= roomNumber %>");
		
		function connectToServer() {
			client.connect();
			document.getElementById("nameElement").style.visibility = "hidden";
			document.getElementById("sub").style.visibility		  	= "hidden";
			document.getElementById("readyCheck").style.visibility  = "";
			document.getElementById("readyCheckLabel").style.visibility  = "";
			document.getElementById("submitAnswer").style.visibility= "hidden";
			
			setTimeout(
					function(){
						sendName("<%= (username != null) ? username : "guest" %>");
					},
				500
			);
		}
		
		function init() {
			document.getElementById("readyCheck").style.visibility  	 = "hidden";
			document.getElementById("readyCheckLabel").style.visibility  = "hidden";
			document.getElementById("questionContainer").style.visibility  = "hidden";
		}
		
		init();

	</script>
</html>