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
	// the players answer to the most recent question
	private int		answer;
	
	// takes in a session and a name, returns a player
	public Player(Session session, String name) {
		this.session			= session;
		this.name				= name;
		this.score				= 0;
		this.ready				= false;
		this.resetAnswer();
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
	
	// stores the player's answer for the current question
	public void setAnswer(int answer) {
		this.answer = answer;
	}
	
	// returns the players answer to the most recent question
	public int getAnswer() {
		int answer = this.answer;
		this.resetAnswer();
		return answer;
	}
	
	// returns if the player has answered the question
	public boolean hasAnswered() {
		return (this.answer != -1);
	}
	
	// reset answered status and answer value to prepare for next question
	public void resetAnswer() {
		this.answer		= -1;
	}
	
	// takes in an integer, increments player score by that integer
	public void incrementScore(int amount) {
		score += amount;
	}
}
