package TriviaObjects;

import java.util.ArrayList;

public class Categories {
	private ArrayList<Category> trivia_categories;
	
	public int getNumberOfCategories() {
		return this.trivia_categories.size();
	}
	
	public Category getCategory(int index) {
		return this.trivia_categories.get(index);
	}
	
}
