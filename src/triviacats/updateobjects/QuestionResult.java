package triviacats.updateobjects;

import triviacats.websocket.Player;

public class QuestionResult {

	String	player_id;
	String	player_name;
	Boolean answered_correctly;
	int		points;
	
	public QuestionResult(Player p, Boolean answeredCorrectly) {
		this.player_id			= p.getSessionID();
		this.player_name		= p.getName();
		this.answered_correctly	= answeredCorrectly;
		this.points				= p.getScore();
	}
}
