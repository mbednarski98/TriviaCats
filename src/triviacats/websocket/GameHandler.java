package triviacats.websocket;

import java.io.IOException;
import java.util.ArrayList;

import javax.enterprise.context.ApplicationScoped;
import javax.websocket.Session;

import com.google.gson.Gson;

import triviacats.triviaobjects.SanitizedQuestion;
import triviacats.updateobjects.PlayerList;
import triviacats.updateobjects.QuestionResult;
import triviacats.updateobjects.QuestionResults;

@ApplicationScoped
public class GameHandler {
	// list of all games
	private ArrayList<Game> games = new ArrayList<>();
	private Gson gson = new Gson();
	
	// takes in a session and a room number and makes a new game
	public void newGame(Session session, int roomNumber) {
		Game g = new Game(roomNumber);
		games.add(g);
		
		this.addPlayerToGame(roomNumber, session);
	}
	
	// removes a game
	public void removeGame(int roomNumber) {
		this.games.remove(this.findGame(roomNumber));
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
	
	// adds a player to the specified game, sends an player list update
	public void addPlayerToGame(int roomNumber, Session session) {
		Player p = new Player(session, session.getId().toString());
		this.findGame(roomNumber).addPlayer(p);
		this.sendPlayerList(roomNumber);
	}
	
	// sets the specified player status to ready
	public void setPlayerReady(String sessionID) {
		this.findGame(this.findPlayer(sessionID)).getPlayer(sessionID).setReadyStatus(true);
	}
	
	// starts a game if all players are ready, returns true if game started, false if it has not
	public boolean tryStartGame(int roomNumber) {
		if (this.findGame(roomNumber).playersReady()) {
			this.findGame(roomNumber).startGame();
			this.sendNewQuestion(roomNumber);
			return true;
		}
		return false;
	}
	
	// set the specified player's answer
	public void setPlayerAnswer(String sessionID, int answer) {
		int roomNumber = this.findPlayer(sessionID);
		Game g = this.findGame(roomNumber);
		g.getPlayer(sessionID).setAnswer(answer);
		String answerJSON = "{\"user\":\"" + sessionID + "\", \"answered\":true}";
		this.sendToAllInRoom(roomNumber, answerJSON);
	}
	
	// returns true if all users have answered the question
	public boolean allPlayersAnswered(int roomNumber) {
		for (Player p : this.findGame(roomNumber).getPlayerList()) {
			if (!p.hasAnswered()) {
				return false;
			}
		}
		return true;
	}
	
	// sends a json of all players to each player
	public void sendPlayerList(int roomNumber) {
		String playerListJSON = this.createPlayerListJSON(roomNumber);
		for (Player p : this.findGame(roomNumber).getPlayerList()) {
			try {
				p.getSession().getBasicRemote().sendText(playerListJSON);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	// sends the next question to all users in a given room
	public void sendNewQuestion(int roomNumber) {
		Game g = this.findGame(roomNumber);
		g.resetPlayerAnswers();
		
		Gson gson = new Gson();
		SanitizedQuestion sq = g.getNextSanitizedQuestion();
		String sanQuestionJSON	= gson.toJson(sq);
		this.sendToAllInRoom(roomNumber, sanQuestionJSON);
	}
	
	public void sendQuestionResults(int roomNumber, QuestionResults questionResults) {
		String qResultsJSON = this.createQuestionResultsJSON(questionResults);
		
		this.sendToAllInRoom(roomNumber, qResultsJSON);
	}
	
	// Awards points to players with the correct score, returns a QuestionResults JSON object
	public QuestionResults awardPoints(int roomNumber) {
		Game g = this.findGame(roomNumber);
		ArrayList<QuestionResult> questionResultsArray = new ArrayList<>();
		Boolean answeredCorrectly;
		
		for (Player p : g.getPlayerList()) {
			answeredCorrectly = false;
			if (p.getAnswer() == g.getCurrentQuestionAnswer()) {
				answeredCorrectly = true;
				p.incrementScore(10);
			}
			questionResultsArray.add(new QuestionResult(p, answeredCorrectly));
		}
		return new QuestionResults(questionResultsArray);
	}
	
	// sends a message to all players in the specified room
	public void sendToAllInRoom(int roomNumber, String message) {
		if (this.roomExists(roomNumber)) {
			for (int i = 0; i != this.findGame(roomNumber).getPlayerList().size(); i++) {
				try {
					this.findGame(roomNumber).getPlayerList().get(i).getSession().getBasicRemote().sendText(message);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
	// creates a JSON text list of all players in game
	private String createPlayerListJSON(int roomNumber) {
		Game g = this.findGame(roomNumber);
		
		PlayerList playerList = new PlayerList(g.getPlayerList());
		
		return this.gson.toJson(playerList);
	}
	
	private String createQuestionResultsJSON(QuestionResults questionResults) {
		return this.gson.toJson(questionResults);
	}
}