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

@ServerEndpoint("/trivia/{roomnumber}")
public class TriviaWebSocketServer {	
	
	// The GameHandler instance used by websocket
	@Inject
	private GameHandler gameHandler;
	
	// actions to be performs on the connection of a new websocket client
	@OnOpen
	public void onOpen(Session session, @PathParam("roomnumber") final String roomNumber) {
		System.out.println("newuser: " + session.getId());
		System.out.println(gameHandler.toString());
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
	
		if (!gameHandler.roomExists(rn)) {
			gameHandler.newGame(session, rn);
		} else if (!gameHandler.findGame(rn).hasStarted()) {
			Player p = new Player(session, session.getId().toString());
			gameHandler.findGame(rn).addPlayer(p);
		} else {
			this.closeSession(session, "ROOM CLOSED");
			return;
		}
	}
	
	// actions to be performed when a websocket client disconnects
	@OnClose
	public void onClose(Session session) {
		int roomNumber = gameHandler.findPlayer(session.getId());
		
		if (gameHandler.findGame(roomNumber) != null) {
			gameHandler.findGame(roomNumber).removePlayer(session.getId());
		}
	}
	
	// actions to be performed when a message is recieved from a client
	@OnMessage
	public void onMessage(String message, Session session) {
		// int roomNumber = gameHandler.findPlayer(session.getId());
		
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
