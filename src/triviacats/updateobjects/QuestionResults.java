package triviacats.updateobjects;

import java.util.ArrayList;

public class QuestionResults {

	ArrayList<QuestionResult> question_results;
	
	public QuestionResults() {
		this.question_results = new ArrayList<>();
	}
	
	public QuestionResults(ArrayList<QuestionResult> questionResults) {
		this.question_results = questionResults;
	}
	
	public void addQuestionResult(QuestionResult questionResult) {
		question_results.add(questionResult);
	}
}
