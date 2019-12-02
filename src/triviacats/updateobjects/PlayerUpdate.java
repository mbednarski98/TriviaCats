package triviacats.updateobjects;

import triviacats.websocket.Player;

public class PlayerUpdate {

	String player_id;
	String player_name;
	String player_state;

	public PlayerUpdate(Player p, String playerState) {
		this.player_id = p.getSessionID();
		this.player_name = p.getName();
		this.player_state = playerState;
	}
}
