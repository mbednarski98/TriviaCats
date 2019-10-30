package TriviaObjects;

// This object holds the information needed to grab questions of a specific category from the Open Trivia DB.
public class Category {

	private int id;			/* Holds the id of the category.
							   This is used by Open Trivia DB when using the category parameter in the API request. */
	private String name;	// Holds the title of the category.
	
	// Returns the Category ID.
	public int getId() {
		return this.id;
	}
	
	// Returns the category name.
	public String getName() {
		return this.name;
	}
}
