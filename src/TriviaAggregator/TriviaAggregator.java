package TriviaAggregator;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import com.google.gson.*;

import TriviaObjects.Categories;

public class TriviaAggregator {

	public Categories getCategories() {
		String response = performGETRequest("https://opentdb.com/api_category.php");
		Gson gson = new Gson();
		
		Categories categories = gson.fromJson(response, Categories.class);
		
		return categories;
	}
	
	public String performGETRequest(String requestURL) {
		try {
			URL url = new URL(requestURL);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			
			connection.setRequestMethod("GET");
			connection.setRequestProperty("User-Agent", "Mozilla/5.0");
			
			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
				
				BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
				
				String line;
				StringBuffer response = new StringBuffer();
				
				while ((line = in.readLine()) != null) {
					response.append(line);
				}
				
				return response.toString();
				
			} else {
				// TODO handle case that we do not get a good response
			}
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
		return null;
	}
	
}
