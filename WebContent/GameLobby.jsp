<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cat Trivia - Play Game</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
</head>
<body onload="setTimeout(function() { connectToServer() }, 1)">
	<%
		String username;
		if (session.getAttribute("username") != null) {
			username = (String) session.getAttribute("username");
		} else {
			username = "NAME:Tom";
			session.setAttribute("username", username);
		}
	%>
	<main>
		<div id="gameLogin">
			<input id="nameElement" value="<%=username%>" type="text">
			<button id="sub" type="button" onclick="connectToServer()">CONNECT</button>
			<input id="readyCheck" type="checkbox" onclick="checkReady()"
				name="readyCheck"> <label id="readyCheckLabel"
				for="readyCheck">Ready</label>
		</div>

		<div id="catCardContainer"></div>

		<div id="questionContainer">
			<h2 id="questionText"></h2>
			<div id="answerlist"></div>
			<button id="submitAnswer" type="button" onclick="submitAnswer()">Submit
				Answer</button>
		</div>

	</main>
</body>
<script src="./js/client.js"></script>
<script>
		var client = new WebSocketClient("ws", "localhost", "8080", "/TriviaCats/trivia/666");
		document.getElementById("readyCheck").style.visibility  	 = "hidden";
		document.getElementById("readyCheckLabel").style.visibility  = "hidden";
		document.getElementById("questionContainer").style.visibility  = "hidden";
		
		function connectToServer() {
			client.connect();
			document.getElementById("nameElement").style.visibility = "hidden";
			document.getElementById("sub").style.visibility		  	= "hidden";
			document.getElementById("readyCheck").style.visibility  = "";
			document.getElementById("readyCheckLabel").style.visibility  = "";
			document.getElementById("submitAnswer").style.visibility= "hidden";
		}
		
		
		function checkReady() {
			var readyCheck = document.getElementById("readyCheck");
			if (readyCheck.checked) {
				client.send("READY");
				document.getElementById("readyCheck").style.visibility  	 = "hidden";
				document.getElementById("readyCheckLabel").style.visibility  = "hidden";
				document.getElementById("gameLogin").style.visibility  = "hidden";
			}
		}
		
		/*
		function updateUsers(userList) {
			var playerList = document.getElementById("catCardContainer");
			playerList.innerHTML = "";
			for (const [key, value] of Object.entries(userList)) {
				var catCard = document.createElement("div");
				//catCard.style.float = "left";
				catCard.className = "catCard";
				
				var catCardImage = new Image();
				catCardImage.src = 'https://github.com/mbednarski98/TriviaCats/blob/master/WebContent/img/cat1.png?raw=true';
				catCardImage.style.height = '200px';
				
				var catCardUsername = document.createElement("label");
				catCardUsername.innerHTML = value;

				catCard.appendChild(catCardImage);
				catCard.appendChild(catCardUsername);
				
				playerList.appendChild(catCard);
			}
		}
		
		
		function displayQuestion(question) {
			var answers = document.getElementById("answers");
			answers.innerHTML = "";
			document.getElementById("questionContainer").style.visibility  = "";
			document.getElementById("submitAnswer").style.visibility	   = "";
			
			document.getElementById("questionText").innerHTML = question.question_text;
			
			for (i = 0; i != question.answers.length; i++) {
				
				var answer = document.createElement("input");
				answer.id	 = "answer" + i;
				answer.name	 = "qAnswer";
				answer.type	 = "radio";
				answer.value = question.answerKeys[i];
				
				var answerLabel = document.createElement("label");
				answerLabel.for = answer.id;
				answerLabel.innerHTML = question.answers[i];
				
				answers.appendChild(answer);
				answers.appendChild(answerLabel);
				answers.appendChild(document.createElement("br"));
			}
		}
		
		function submitAnswer() {
			document.getElementById("submitAnswer").style.visibility= "hidden";
			var answers = document.getElementsByName("qAnswer");

			for (i = 0; i != answers.length; i++) {
				if (answers[i].checked) {
					client.send("ANSWER:" + answers[i].value);
					break;
				}
			}
		}
		*/
		
	</script>
</html>