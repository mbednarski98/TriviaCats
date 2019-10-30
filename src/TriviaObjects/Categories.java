package TriviaObjects;

import java.util.ArrayList;

/* This object holds a list of Category objects. It is used in the same way as an ArrayList,
   as it is essentially a case-specific wrapper for ArrayList. */
public class Categories {
	private ArrayList<Category> trivia_categories;
	
	// Returns the number of elements in trivia_categories.
	public int getNumberOfCategories() {
		return this.trivia_categories.size();
	}
	
	// Take in an index, and returns the Category object at that index.
	public Category getCategory(int index) {
		return this.trivia_categories.get(index);
	}
	
}
