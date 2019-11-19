package triviacats.websocket;

import java.util.ArrayList;

import javax.enterprise.context.ApplicationScoped;
import javax.websocket.Session;

@ApplicationScoped
public class GameHandler {
	// list of all games
	private ArrayList<Game> games = new ArrayList<>();
	
	// takes in a session and a room number and makes a new game
	public void newGame(Session session, int roomNumber) {
		Player p = new Player(session, "ADMIN");
		
		Game g = new Game(roomNumber, p);
		games.add(g);
	}
	
	// takes in a room number, returns the corresponding game
	public Game findGame(int roomNumber) {
		for (Game g : games) {
			if (g.getRoomNumber() == roomNumber) {
				return g;
			}
		}
		return null;
	}
	
	// takes in a session id, returns the corresponding room number
	public int findPlayer(String sessionID) {
		for (Game g : games) {
			if (g.playerExists(sessionID)) {
				return g.getRoomNumber();
			}
		}
		return -1;
	}
	
	// takes in a room number, returns true if a corresponding game exists
	public boolean roomExists (int roomNumber) {
		for (Game g : games) {
			if (roomNumber == g.getRoomNumber()) {
				return true;
			}
		}
		return false;
	}
}