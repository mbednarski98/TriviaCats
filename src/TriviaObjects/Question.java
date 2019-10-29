package TriviaObjects;

public class Question {

	private String category;
	private String type;
	private String difficulty;
	private String question;
	private String correct_answer;
	private String[] incorrect_answers;
	
	public String getCategory() {
		return this.category;
	}
	
	public String getType() {
		return this.type;
	}
	
	public String getDifficulty() {
		return this.difficulty;
	}
	
	public String getQuestion() {
		return this.question;
	}
	
	public String getCorrectAnswer() {
		return this.correct_answer;
	}
	
	public String[] getIncorrectAnswers() {
		return this.incorrect_answers;
	}
}
