package triviacats.triviaobjects;

import java.util.ArrayList;
import java.util.Collections;

public class SanitizedQuestion {
	private int			question_number;
	private String		question_text;
	private String[]	answers;
	private int[]		answerKeys;

	// constructor for a boolean question
	public SanitizedQuestion(int qNum, Question q) {
		if (q.getType().equals("boolean")) {
			this.initialize(qNum, q);
			this.sanitizeBoolean();	
		} else {
			//TODO: throw error
		}
	}
	
	// constructor for a multiple choice question
	public SanitizedQuestion(int qNum, Question q, int correctPosition) {
		if (q.getType().equals("multiple")) {
			this.initialize(qNum, q);
			this.sanitizeMultiple(q.getCorrectAnswer(), q.getIncorrectAnswers(), correctPosition);
		} else {
			//TODO: throw error
		}
	}

	// initialize values
	private void initialize(int qNum, Question q) {
		this.question_number	= qNum;
		this.question_text		= q.getQuestion();
	}

	// sanitization process for boolean questions
	private void sanitizeMultiple(String correctAnswer, String[] incorrectAnswers, int correctPosition) {
		ArrayList<String> answers = new ArrayList<>();
		for (int i = 0; i != incorrectAnswers.length; i++) {
			answers.add(incorrectAnswers[i]);
		}
		Collections.shuffle(answers);
		answers.add(correctPosition, correctAnswer);
		this.answerKeys = new int[answers.size()];
		this.answers = answers.toArray(new String[answers.size()]);
		this.assignKeys();
	}

	// sanitization process for boolean questions
	private void sanitizeBoolean() {
		this.answers	= new String[2];
		this.answerKeys = new int[2];
		this.answers[0] = "True";
		this.answers[1] = "False";
		this.assignKeys();
	}

	// populates the answerKeys array with random numbers between 100 and 999
	private void assignKeys() {
		for (int i = 0; i != this.answers.length; i++) {
			this.answerKeys[i] = this.getRandomNumber(100, 999);
		}
	}

	// returns a random number between min and max
	public int getRandomNumber(int min, int max) {
		return (int) (min + (Math.random() * (max - min)));
	}
	
	// returns all answers
	public String[] getAnswers() {
		return this.answers;
	}
	
	// returns all keys
	public int[] getKeys() {
		return this.answerKeys;
	}
	
	// returns a key at the specified index
	public int getKey(int index) {
		return this.answerKeys[index];
	}
}