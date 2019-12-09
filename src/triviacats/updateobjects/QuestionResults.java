package triviacats.updateobjects;

import java.util.ArrayList;
import java.util.Iterator;

public class QuestionResults implements Iterable<QuestionResult> {

	private ArrayList<QuestionResult> question_results ;
	
	public QuestionResults() {
		this.question_results = new ArrayList<>();
	}
	
	public QuestionResults(ArrayList<QuestionResult> questionResults) {
		this.question_results = questionResults;
	}
	
	public void addQuestionResult(QuestionResult questionResult) {
		question_results.add(questionResult);
	}

	public int getSize() {
		return this.question_results.size();
	}
	
	public QuestionResult get(int index) {
		return this.question_results.get(index);
	}
	
	@Override
	public Iterator<QuestionResult> iterator() {
		return this.question_results.iterator();
	}
}