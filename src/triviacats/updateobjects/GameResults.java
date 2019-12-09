package triviacats.updateobjects;

import java.util.ArrayList;
import java.util.Iterator;

public class GameResults implements Iterable<PlayerResult>{

	private ArrayList<PlayerResult> playerResults;

	public PlayerResult get(int index) {
		return this.playerResults.get(index);
	}
	
	public int size() {
		return this.playerResults.size();
	}
	
	@Override
	public Iterator<PlayerResult> iterator() {
		return this.playerResults.iterator();
	}
}
