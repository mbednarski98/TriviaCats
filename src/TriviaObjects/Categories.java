package TriviaObjects;

import java.util.ArrayList;
import java.util.Iterator;

/* This object holds a list of Category objects. It is used in the same way as an ArrayList,
   as it is essentially a case-specific wrapper for ArrayList. */
public class Categories implements Iterable<Category>{
	private ArrayList<Category> trivia_categories;
	
	// Returns the number of elements in trivia_categories.
	public int size() {
		return this.trivia_categories.size();
	}
	
	// Take in an index, and returns the Category object at that index.
	public Category get(int index) {
		return this.trivia_categories.get(index);
	}

	// Returns an iterator for the ArrayList of categories.
	@Override
	public Iterator<Category> iterator() {
		return this.trivia_categories.iterator();
	}
	
}
