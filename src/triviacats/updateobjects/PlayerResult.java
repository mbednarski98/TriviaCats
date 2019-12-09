package triviacats.updateobjects;

public class PlayerResult {

	private String	playerId;
	private String	playerName;
	private int		points;
	
	public PlayerResult(String id, String name, int points) {
		this.playerId	= id;
		this.playerName = name;
		this.points		= points;
	}
	
	public String getId() {
		return this.playerId;
	}
	
	public String getName() {
		return this.playerName;
	}
	
	public int getPoints() {
		return this.points;
	}
}
