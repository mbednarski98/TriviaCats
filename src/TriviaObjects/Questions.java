package TriviaObjects;

import java.util.ArrayList;

/* This object holds a list of Question objects. It is used in the same way as an ArrayList,
   as it is essentially a case-specific wrapper for ArrayList. */
public class Questions {
	private ArrayList<Question> results;
	
	// Returns number of Question objects in the list.
	public int getNumberOfQuestions() {
		return this.results.size();
	}
	
	// Takes in an index, returns the Question object at that index.
	public Question getQuestion(int index) {
		return this.results.get(index);
	}
	
}
