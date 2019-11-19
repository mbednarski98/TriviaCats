package triviacats.triviaobjects;

import java.util.ArrayList;
import java.util.Iterator;

/* This object holds a list of Question objects. It is used in the same way as an ArrayList,
   as it is essentially a case-specific wrapper for ArrayList. */
public class Questions implements Iterable<Question> {
	private ArrayList<Question> results;
	
	// Returns number of Question objects in the list.
	public int size() {
		return this.results.size();
	}
	
	// Takes in an index, returns the Question object at that index.
	public Question get(int index) {
		return this.results.get(index);
	}

	// Returns an iterator for the ArrayList of questions.
	@Override
	public Iterator<Question> iterator() {
		return this.results.iterator();
	}
}
