package triviacats.websocket;

import java.io.IOException;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import triviacats.updateobjects.QuestionResults;

@ServerEndpoint("/trivia/{roomnumber}")
public class TriviaWebSocketServer {	
	
	// The GameHandler instance used by websocket
	@Inject
	private GameHandler gameHandler;
	
	// actions to be performs on the connection of a new websocket client
	@OnOpen
	public void onOpen(Session session, @PathParam("roomnumber") final String roomNumber) {
		System.out.println("newuser: " + session.getId());
		System.out.println(this.gameHandler.toString());
		int rn = -1;
		try {
			rn = Integer.parseInt(roomNumber);
		} catch (NumberFormatException e) {
			this.closeSession(session, "INVALID ROOM NUMBER");
			return;
		}
		
		if (rn < 0) {
			this.closeSession(session, "INVALID ROOM NUMBER");
			return;
		}

		if (!this.gameHandler.roomExists(rn)) {
			this.gameHandler.newGame(session, rn);
		} else if (!this.gameHandler.findGame(rn).hasStarted()) {
			this.gameHandler.addPlayerToGame(rn, session);
		} else {
			this.closeSession(session, "ROOM CLOSED");
			return;
		}
	}
	
	// actions to be performed when a websocket client disconnects
	@OnClose
	public void onClose(Session session) {
		int roomNumber = this.gameHandler.findPlayer(session.getId());
		
		if (this.gameHandler.findGame(roomNumber) != null) {
			this.gameHandler.findGame(roomNumber).removePlayer(session.getId());
			this.gameHandler.sendPlayerList(roomNumber);
		}
	}
	
	// actions to be performed when a message is received from a client
	@OnMessage
	public void onMessage(String message, Session session) {
		int roomNumber = this.gameHandler.findPlayer(session.getId());
		
		if (message.contains("ANSWER:")) {
			int answer = Integer.parseInt(message.split(":")[1]);
			this.gameHandler.setPlayerAnswer(session.getId(), answer);
			
			if (this.gameHandler.allPlayersAnswered(roomNumber)) {
				QuestionResults qResultsJSON = this.gameHandler.awardPoints(roomNumber);
				this.gameHandler.sendQuestionResults(roomNumber, qResultsJSON);
				
				if (this.gameHandler.findGame(roomNumber).isLastQuestion()) {
					this.gameHandler.sendToAllInRoom(roomNumber, "ENDGAME");

					this.gameHandler.findGame(roomNumber).endGame();
					this.gameHandler.removeGame(roomNumber);
				} else {
					this.gameHandler.awardPoints(roomNumber);
					this.gameHandler.sendNewQuestion(roomNumber);
				}
				
			}
		} else if (message.contains("READY")) {
			this.gameHandler.setPlayerReady(session.getId());
			this.gameHandler.tryStartGame(roomNumber);
			//System.out.println(this.gameHandler.findGame(roomNumber).hasStarted());
		} else if (message.contains("NAME:")) {
			String name = message.split(":")[1];
			this.gameHandler.findGame(roomNumber).getPlayer(session.getId()).setName(name);
			this.gameHandler.sendPlayerList(roomNumber);
		} else {
			
		}
	}
	
	// actions to be performed when a websocket error occurs.
	@OnError
	public void onError(Throwable error) {
		// TODO: make this do something
	}
	
	// takes in a session and a disconnection reason, closes a connection to a client
	public void closeSession(Session session, String reason) {
		CloseReason cr = new CloseReason(CloseReason.CloseCodes.VIOLATED_POLICY, reason);
		try {
			session.close(cr);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
