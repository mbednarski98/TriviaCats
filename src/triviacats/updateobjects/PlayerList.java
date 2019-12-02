package triviacats.updateobjects;

import java.util.ArrayList;
import java.util.HashMap;

import triviacats.websocket.Player;

public class PlayerList {
	
	HashMap<String, String> player_list;
	
	public PlayerList(ArrayList<Player> playerList) {
		player_list = new HashMap<>();
		for (Player p : playerList) {
			player_list.put(
					p.getSessionID(),
					p.getName());
		}
	}
}