package triviacats.updateobjects;

import java.util.ArrayList;

import triviacats.updateobjects.Game;

public class GameList {

	ArrayList<Game> games;
	
	public GameList(ArrayList<triviacats.websocket.Game> games) {
		this.games = new ArrayList<>();
		for (triviacats.websocket.Game g : games) {
			Game game = new Game(
					g.getRoomNumber(),
					g.getNumOfPlayers(),
					!g.hasStarted());
			this.games.add(game);
		}
	}
	
	public ArrayList<Game> getGames() {
		return this.games;
	}
	
}
