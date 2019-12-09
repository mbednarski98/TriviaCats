class WebSocketClient {
	
	// constructor takes in a protocol ("ws" or for secure connections "wss")
	// to test on local machine set hostname as "localhost", port should be "8080",
	// the endpoint should be the full path to the 'trivia' folder
	constructor(protocol, hostname, port, endpoint) {
		
		this.webSocket = null;
		
		this.serverURL = this.generateServerURL(protocol, hostname, port, endpoint);
	}
	
	generateServerURL(protocol, hostname, port, endpoint) {
		return protocol + "://" + hostname + ":" + port + endpoint;
	}
	 
	getState() {
		return this.webSocket.readyState;
	}
	
	isConnected() {
		if (this.getState() == WebSocket.OPEN) {
			return true;
		} else {
			return false;
		}
	}
	
	connect() {
		try {
			this.webSocket = new WebSocket(this.serverURL);
			 
			this.webSocket.onopen = function(event) {
				
			}
			 
			this.webSocket.onclose = function(event) {
				
			}
			 
			this.webSocket.onmessage = function(event) {
				console.debug(event.data);
				
				if (event.data != "ENDGAME") {
					var ed = JSON.parse(event.data);
					if (Object.keys(ed)[0] == "player_list") {
						updatePlayerList(ed);
					} else if (Object.keys(ed)[0] == "question_number") {
						displayNewQuestion(ed);
					} else if (Object.keys(ed)[0] == "player_id") {
						handlePlayerUpdate(ed);
					} else if (Object.keys(ed)[0] == "games") {
						console.debug(ed.games);
						setGameList(ed.games);
					}
				}
			}
			 
			this.webSocket.onerror = function(event) {
				
			}
			 
		} catch (exception) {
			console.error(exception);
		}
	}
	 
	disconnect() {
		if (this.getState() == WebSocket.OPEN) {
			this.webSocket.close();
		} else {
			console.error('WebSocket not open: ' + this.getState());
		}
	}
	
	send(message) {
		if (this.getState() == WebSocket.OPEN) {
			this.webSocket.send(message);
		} else {
			console.error('WebSocket not open: ' + this.getState());
		}
	}
	
}

//handle player list
function updatePlayerList(pList) {
	var playerList = document.getElementById("catCardContainer");
	playerList.innerHTML = "";
	
	for (const [key, value] of Object.entries(pList.player_list)) {
		var catCard = document.createElement("div");
		//catCard.style.float = "left";
		catCard.className = "catCard";
		catCard.name = value;
		
		var catCardImage = new Image();
		catCardImage.src = 'https://github.com/mbednarski98/TriviaCats/blob/master/WebContent/img/cat1.png?raw=true';
		catCardImage.style.height = '200px';
		
		var catCardUsername = document.createElement("label");
		catCardUsername.innerHTML = value;

		var catCardScoreLabel	= document.createElement("label");
		catCardScoreLabel.id = "scoreLabel"
		catCardScoreLabel.innerHTML = "Score: 0";
		
		catCard.appendChild(catCardImage);
		catCard.appendChild(catCardUsername);
		catCard.appendChild(catCardScoreLabel);
		
		playerList.appendChild(catCard);
	}
}

// handle question results
function integrateQuestionResults(questionResults) {
	for (const player of  questionResults) {
		var playerScore = document.getElementById(player.player_id + "score");
		playerScore.innerHTML = player.points;
	}
}

// handle new questions
function displayNewQuestion(question) {
	document.getElementById("questionContainer").style.visibility  = "";
	document.getElementById("submitAnswer").style.visibility	   = "";
	
	var questionText = document.getElementById("questionText");
	questionText.innerHTML = question.question_text;
	
	var answerList = document.getElementById("answerList");
	answerList.innerHTML = "";

	for (i = 0; i != question.answers.length; i++) {
		var answer = document.createElement("input");
		answer.id	 = "answer" + i;
		answer.name	 = "qAnswer";
		answer.type	 = "radio";
		answer.value = question.answerKeys[i];
		
		var answerLabel = document.createElement("label");
		answerLabel.for = answer.id;
		answerLabel.innerHTML = question.answers[i];
		
		answerList.appendChild(answer);
		answerList.appendChild(answerLabel);
		answerList.appendChild(document.createElement("br"));
	}
}

// handle player updates
function handlePlayerUpdate(playerUpdate) {
	var snackBar = document.getElementById("snackBar");
	snackBar.innerHTML = "";
	
	var message = "";
	if (playerUpdate.player_state == "joined_game") {
		message = playerUpdate.player_name + " joined the game!";
	} else if (playerUpdate.player_state == "left_game") {
		message = playerUpdate.player_name + " left the game!";
	} else if (playerUpdate.player_state == "answered") {
		message = playerUpdate.player_name + " has answered the question.";
	} else if (playerUpdate.player_state == "ready") {
		message = playerUpdate.player_name + " is ready!";
	}
	
	snackBar.innerHTML = message;
	snackBar.className = "show";
	setTimeout(function() {
		snackBar.className = snackBar.className.replace("show", "");
	}, 2500);
}

// handle if ready	
function sendReady() {
	var readyCheck = document.getElementById("readyCheck");
	if (readyCheck.checked) {
		client.send("READY");
		document.getElementById("readyCheck").style.visibility  	 = "hidden";
		document.getElementById("readyCheckLabel").style.visibility  = "hidden";
		document.getElementById("gameLogin").style.visibility  = "hidden";
	}
}

// submit answer
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

function sendName(name) {
	client.send("NAME:" + name);
}