<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cat Trivia - Play Game</title>
    <link rel="stylesheet" type="text/css" href="main.css">
</head>
<body>
    <main>
      <!-- Dynamically code GameScore -->
        <div class = "GameScore">
        	<span><strong>Leading - FireCat: 5 correct.</strong></span>   <span>CupCat:  4 correct </span> <span>MadCat: 3 correct</span> <span>HalloweenCat: 2 correct</span>
        </div>

        <form id = "question">
        <!-- TODO: Code population of question. -->
        <h1 >How many cats in a pride of pride?    </h1>
        	<input type="button" name = "A" value = "What's a pride of pride?" >
           	<input type="submit" name = "B" value = "Nine, of course!"> 
           	<input type="button" name = "C" value = "Always one more than you expect because they are extra.">
            <input type="submit" name = "D" value = "You can never count because their colors are so dazzling.">
                  
        </form><!-- id = "question -->
        
        <!-- TODO: Code auto-population of Avatars/players -->
        <div class="player">
	        <!-- TODO: Save the image in our repository. (Couldn't figure out where that was. - aisaac) -->
	        	<img src = "C:\\Users\\amisaac\\git\\TriviaCats\\images\\fireCat.jpg" style = ""><br>
        
	        <!-- TODO: Code population of score. -->
	                <label><strong>Game Score: 50</strong></label><br>
	                <label>Avg Game Score: 84</label><br>
	                <label>Longevity Score:543</label>
        </div> <!-- player -->
        
         <!-- TODO: Code auto-population of Avatars/players -->
        <div class="player">
	        <!-- TODO: Save the image in our repository. (Couldn't figure out where that was. - aisaac) -->
	        	<img src = "C:\\Users\\amisaac\\git\\TriviaCats\\images\\cupCat.jpg" style = ""><br>
        
	        <!-- TODO: Code population of score. -->
	                <label><strong>Game Score: 40</strong></label><br>
	                <label>Avg Game Score: 89</label><br>
	                <label>Longevity Score:543</label>
        </div> <!-- player -->
        
         <!-- TODO: Code auto-population of Avatars/players -->
        <div class="player">
	        <!-- TODO: Save the image in our repository. (Couldn't figure out where that was. - aisaac) -->
	        	<img src = "C:\\Users\\amisaac\\git\\TriviaCats\\images\\madCat.jpg" style = ""><br>
        
	        <!-- TODO: Code population of score. -->
	                <label><strong>Game Score: 30</strong></label><br>
	                <label>Avg Game Score: 69</label><br>
	                <label>Longevity Score:773</label>
        </div> <!-- player -->
        
        
         <!-- TODO: Code auto-population of Avatars/players -->
        <div class="player">
	        <!-- TODO: Save the image in our repository. (Couldn't figure out where that was. - aisaac) -->
	        	<img src = "C:\\Users\\amisaac\\git\\TriviaCats\\images\\HalloweenCat.jpg" style = ""><br>
        
	        <!-- TODO: Code population of score. -->
	                <label><strong>Game Score: 20</strong></label><br>
	                <label>Avg Game Score: 79</label><br>
	                <label>Longevity Score:513</label>
        </div> <!-- player -->
        
      
    </main>
</body>
</html>