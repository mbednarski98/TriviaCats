package triviacats.websocket;

import java.io.IOException;
import java.util.ArrayList;

import javax.enterprise.context.ApplicationScoped;
import javax.websocket.Session;

import com.google.gson.Gson;

import triviacats.triviaobjects.SanitizedQuestion;

@ApplicationScoped
public class GameHandler {
	// list of all games
	private ArrayList<Game> games = new ArrayList<>();
	
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
		String playerListJSON = this.createPlayerList(roomNumber);
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
		Gson gson = new Gson();
		SanitizedQuestion sq = this.findGame(roomNumber).getNextSanitizedQuestion();
		String sanQuestionJSON	= gson.toJson(sq);
		this.sendToAllInRoom(roomNumber, sanQuestionJSON);
	}
	
	public void sendQuestionResults(int roomNumber) {
		// TODO: make this send the results of a question completed by all users, to all users
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
	private String createPlayerList(int roomNumber) {
		Game g = this.findGame(roomNumber);
		String playerListJSON = "{\"player_list\": [ ";
		for (Player p : g.getPlayerList()) {
			playerListJSON += "\"" + p.getName() + "\"";
			if (g.getPlayerList().indexOf(p) != g.getPlayerList().size() - 1) {
				playerListJSON += ", ";
			}
		}
		playerListJSON += "]}";
		
		return playerListJSON;
	}
}