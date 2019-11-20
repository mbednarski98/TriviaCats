package triviacats.websocket;

import java.util.ArrayList;

import triviacats.triviaaggregator.TriviaAggregator;
import triviacats.triviaobjects.Question;
import triviacats.triviaobjects.Questions;

public class Game {
	// list of players in game
	private ArrayList<Player> players = new ArrayList<>();
	// the websocket room number
	private int		  roomNumber;
	// stores the value of whether or not the game has started
	private boolean	  started;
	// the index of the current question
	private int		  currentQuestionIndex;
	// Questions object containing all the questions for the current game
	private Questions questions;
	
	// takes in a room number and a single player, generates a Game
	public Game(int roomNumber, Player player) {
		this.roomNumber = roomNumber;
		this.addPlayer(player);
		this.obtainQuestions();
		this.started = false;
	}
	
	// takes in a player, adds it to players list
	public void addPlayer(Player player) {
		this.players.add(player);
	}
	
	// takes in a session ID, and removes the corresponding player from players list
	public boolean removePlayer(String sessionID) {
		for (Player p : players) {
			if (p.getSession().getId().equals(sessionID)) {
				return players.remove(p);
			}
		} 
		return false;
	}
	
	public ArrayList<Player> getPlayerList() {
		return this.players;
	}
	
	// takes in a session id, returns true if a player in this game has it, returns false otherwise
	public boolean playerExists(String sessionID) {
		for (Player p : players) {
			if (p.getSession().getId().equals(sessionID)) {
				return true;
			}
		}
		return false;
	}
	
	// returns the question at the given index
	public Question getQuestion(int index) {
		return this.questions.get(index);
	}
	
	// returns the next question of the game
	public Question getNextQuestion() {
		currentQuestionIndex += 1;
		if (this.questions.size() != currentQuestionIndex) {
			return this.getQuestion(currentQuestionIndex - 1);
		}
		return null;
	}
	
	// returns the room number of this game
	public int getRoomNumber() {
		return this.roomNumber;
	}
	
	// returns true if game has started, false if otherise
	public boolean hasStarted() {
		return this.started;
	}
	
	// gets a list of 25 questions
	private void obtainQuestions() {
		TriviaAggregator ta = new TriviaAggregator();
		this.questions = ta.getNewQuestions(25);
		this.currentQuestionIndex = 0;
	}
}
