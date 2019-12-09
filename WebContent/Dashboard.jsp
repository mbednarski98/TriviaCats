<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Playing Cat Trivia</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
</head>

<body>
	<div id="wrapper">
		<jsp:include page="./utils/header.jsp" />
		<jsp:include page="./utils/toolbar.jsp" />

		<main>
			<div id="roomContainer"></div>
		</main>
	</div>
	<!-- wrapper -->
	<script src="./js/client.js"></script>
	<script>
		var client = new WebSocketClient("ws", "localhost", "8080", "/TriviaCats/trivia/GAMELISTREQUEST");
		client.connect();
		var gl = null;
		
		var newGameButton = document.createElement("button");
		newGameButton.id = "roomButton";
		newGameButton.type = "button";
		newGameButton.onclick = function() { newGame() };
		newGameButton.innerHTML = "Start New Game";
		newGameButton.style.width = "50%";
		newGameButton.style.display = "block"
		newGameButton.style.margin = "0 auto";
		newGameButton.style.backgroundColor = "#9F86C0";
		newGameButton.style.padding = "2px";
		newGameButton.style.fontSize = "20px";
		newGameButton.style.clear = "both";
		
		document.querySelector("main").appendChild(newGameButton);
		
		function setGameList(gameList) {
			gl = gameList;
			var roomContainer = document.getElementById("roomContainer");
			for (const game in gameList) {
				console.debug(game.room_number);
				
				var roomCard	  = document.createElement("div");
				roomCard.className="roomCard";
			
				var roomNumber = document.createElement("h3");
				roomNumber.innerHTML = "Room Number: " + gameList[game].room_number;
				
				var statusP = document.createElement("p");
				statusP.innerHTML = "Status: ";
				
				var statusSpan = document.createElement("span");
				statusSpan.innerHTML = (gameList[game].is_open) ? "Open" : "Closed";
				
				statusP.appendChild(statusSpan);
			
				var playersP = document.createElement("p");
				playersP.innerHTML = "Players: ";
				
				var playersSpan = document.createElement("span");
				playersSpan.innerHTML =	gameList[game].num_players;
				
				playersP.appendChild(playersSpan);
				
				if (gameList[game].is_open) {
					var joinButton = document.createElement("button");
					joinButton.id = "roomButton";
					joinButton.type = "button";
					joinButton.onclick = function() { joinGame(gameList[game].room_number) };
					joinButton.innerHTML = "Join";
					joinButton.style.width = "50%";
					joinButton.style.display = "block"
					joinButton.style.margin = "0 auto";
				}
				
				roomCard.appendChild(roomNumber);
				roomCard.appendChild(statusP);
				roomCard.appendChild(playersP);
				
				if (gameList[game].is_open) {
					roomCard.appendChild(joinButton);
				}
				
				roomContainer.appendChild(roomCard);
			}
		}
		
		function joinGame(gameNum) {
			var redirectForm = document.createElement("form");
			redirectForm.id		= "redirectForm";
			redirectForm.action = "./GameLobby.jsp";
			redirectForm.method = "POST"
			
			var redirectInputValue = document.createElement("input");
			redirectInputValue.name		= "roomNumber";
			redirectInputValue.type		= "hidden";
			redirectInputValue.value	= gameNum;
			
			redirectForm.appendChild(redirectInputValue);
			
			document.body.appendChild(redirectForm);
			
			document.getElementById("redirectForm").submit();
		}
		
		function newGame() {
			var roomNum = 0;
			for (const game in gl) {
				if (gl[game].room_number == roomNum) {
					roomNum += 1;
				}
			}
			joinGame(roomNum);
		}
	
	</script>
</body>
</html>