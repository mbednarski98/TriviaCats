package triviacats.updateobjects;

public class Game {
	private int		room_number;
	private int		num_players;
	private boolean	is_open;
	
	public Game(int roomNumber, int numPlayers, boolean isOpen) {
		this.room_number = roomNumber;
		this.num_players = numPlayers;
		this.is_open	 = isOpen;
	}
	
	public int getRoomNumber() {
		return this.room_number;
	}
	
	public int getNumPlayers() {
		return this.num_players;
	}
	
	public boolean isOpen() {
		return this.is_open;
	}
}
