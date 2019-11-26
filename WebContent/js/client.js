class WebSocketClient {
	
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
				var ed = JSON.parse(event.data);
				if (Object.keys(ed)[0] == "player_list") {
					updateUsers(ed.player_list);
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
	
}