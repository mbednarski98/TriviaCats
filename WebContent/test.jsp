<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="triviacats.triviaaggregator.*" %>
<%@ page import="triviacats.triviaobjects.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<%
	
%>
<html style="height:100%; width:100%;">
<head>
<meta charset="UTF-8">
<title>Trivia</title>
</head>
<body style="height:100%; width:95%;">


	<div id="gameLogin">
	<input  id="nameElement" type="text" >
	<button id="sub"		 type="button" 	 onclick="connectToServer()">CONNECT</button>
	<input  id="readyCheck"  type="checkbox" onclick="checkReady()" name="readyCheck" >
	<label  id="readyCheckLabel" for="readyCheck">Ready</label>
	</div>

	<div id="userArea" style="float: left;">
	<ul id="userList">
	</ul>
	</div>
	
	<br>
	
	<div id="questionDisplay" style="margin: 0 auto;">
	<h2 id="questionText"></h2>
	<div id="answers"></div>
	<button id="submitAnswer" type="button" onclick="submitAnswer()">Submit Answer</button>
	</div>
	<script src="./js/client.js"></script>
	<script>
		var client = new WebSocketClient("ws", "localhost", "8080", "/TriviaCats/trivia/666");
		document.getElementById("readyCheck").style.visibility  	 = "hidden";
		document.getElementById("readyCheckLabel").style.visibility  = "hidden";
		document.getElementById("questionDisplay").style.visibility  = "hidden";
		
		function connectToServer() {
			client.connect();
			document.getElementById("nameElement").style.visibility = "hidden";
			document.getElementById("sub").style.visibility		  	= "hidden";
			document.getElementById("readyCheck").style.visibility  = "";
			document.getElementById("readyCheckLabel").style.visibility  = "";
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
		
		function updateUsers(userList) {
			var playerList = document.getElementById("userList");
			playerList.innerHTML = "";
			for (const element of userList) {
				var user = document.createElement("li");
				user.innerHTML = element;
				playerList.appendChild(user);
			}
		}
		
		function displayQuestion(question) {
			var answers = document.getElementById("answers");
			answers.innerHTML = "";
			document.getElementById("questionDisplay").style.visibility  = "";
			
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
			var answers = document.getElementsByName("qAnswer");

			for (i = 0; i != answers.length; i++) {
				if (answers[i].checked) {
					client.send("ANSWER:" + answers[i].value);
					break;
				}
			}
		}
		
	</script>
</body>
</html>