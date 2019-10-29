package TriviaObjects;

import java.util.ArrayList;

public class Questions {
	private ArrayList<Question> results;
	
	public int getNumberOfQuestions() {
		return results.size();
	}
	
	public Question getQuestion(int index) {
		return this.results.get(index);
	}
	
}
