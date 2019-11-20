package triviacats.websocket;

import javax.websocket.Session;

public class Player {
	// the player's websocket session
	private Session session;
	// the player's name
	private String	name;
	// the player's current score
	private int		score;
	// whether the player is ready to start the game
	private boolean ready;
	
	// takes in a session and a name, returns a player
	public Player(Session session, String name) {
		this.session = session;
		this.name	 = name;
		this.score	 = 0;
		this.ready	 = false;
	}
	
	// returns the player's websocket session
	public Session getSession() {
		return this.session;
	}
	
	// returns the player's websocket session ID
	public String getSessionID() {
		return this.session.getId();
	}
	
	// returns the player's name
	public String getName() {
		return this.name;
	}
	
	// returns the player's current score
	public int getScore() {
		return score;
	}
	
	// sets the player's ready to play status
	public void setReadyStatus(boolean ready) {
		this.ready = ready;
	}

	// returns the player's ready to play status
	public boolean isReady() {
		return this.ready;
	}
	
	// takes in an integer, increments player score by that integer
	public void incrementScore(int amount) {
		score += amount;
	}
}
