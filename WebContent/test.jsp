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
	<input id="nameElement" type="text">
	<button id="sub" type="button" onclick="connectToServer()">CONNECT</button>
	
	<h1>USERS</h1>
	<ul id="userList">
	</ul>
	
	<script src="./js/client.js"></script>
	<script>
		var client = new WebSocketClient("ws", "localhost", "8080", "/TriviaCats/trivia/666");
		
		function connectToServer() {
			client.connect();
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
	</script>
</body>
</html>