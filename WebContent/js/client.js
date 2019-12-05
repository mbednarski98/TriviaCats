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
				this.send("NAME:" + document.getElementById("nameElement").value);
			}
			 
			this.webSocket.onclose = function(event) {
				
			}
			 
			this.webSocket.onmessage = function(event) {
				console.debug(event.data);
				
				if (event.data != "ENDGAME") {
					var ed = JSON.parse(event.data);
					if (Object.keys(ed)[0] == "player_list") {
						updateUsers(ed.player_list);
					} else if (Object.keys(ed)[0] == "question_number") {
						displayQuestion(ed);
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
	
	send(message){
		if (this.getState() == WebSocket.OPEN) {
			this.webSocket.send(message);
		} else {
			console.error('WebSocket not open: ' + this.getState());
		}
	}
	
	// handle new questions
	displayNewQuestion(question) {
		var answerList = document.getElementById("answerList");
		answerList.innerHTML = "";
		
		var questionText = document.getElementById("questionText");
		questionText.innerHTML(question.question_text);
		
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
	
	// handle player list
	updatePlayerList(pList) {
		var playerList = document.getElementById("playerList");
		playerList.innerHTML = "";
		
		for (const [key, value] of Object.entries(pList)) {
			var playerListItem = document.createElement("li");
			playerListItem.innerHTML = value;
			playerList.appendChild(userListItem);
		}
	}
	
	// handle question results
	integrateQuestionResults(questionResults) {
		
	}
	
	// handle player updates
	handlePlayerUpdate(playerUpdate) {
		
	}
}