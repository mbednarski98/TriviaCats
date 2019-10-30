package TriviaObjects;

// This Object holds all the information needed to ask a question.
public class Question {

	private String category;
	private String type;
	private String difficulty;
	private String question;
	private String correct_answer;
	private String[] incorrect_answers;
	
	// Returns category of the question.
	public String getCategory() {
		return this.category;
	}
	
	// Returns the type of question. Either "boolean" for True/False, or "multiple" for multiple choice.
	public String getType() {
		return this.type;
	}
	
	// Returns the difficulty of the question. Either "easy", "medium", or "hard".
	public String getDifficulty() {
		return this.difficulty;
	}
	
	// Returns the question text.
	public String getQuestion() {
		return this.question;
	}
	
	// Returns the correct answer.
	public String getCorrectAnswer() {
		return this.correct_answer;
	}
	
	// Returns a list of incorrect answer(s).
	public String[] getIncorrectAnswers() {
		return this.incorrect_answers;
	}
}
