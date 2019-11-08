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
        <form id="question">
        <!-- TODO: Code population of question. -->
        <h1 >How many cats in a pride of pride?    </h1>
                
            <button class='ans'>A - What's a pride of pride?</button>
            <button class='ans'>B - Nine, of course</button>
            <button class='ans'>A - Always one more than you expect because they are extra.</button>
            <button class='ans'>D - You can never count because their colors are so dazzling.</button>
      
        </form> <!-- id = "question -->
        
        <div class = "cat">
        	<img src = "/TriviaCats/images/madCat.jpg"><br>
        	<span>(Place holder for Avatar)</span>
        </div>
        
        <div class="score">
                <label><strong>Game Score: 89</strong></label>
                <label>Avg Game Score: 84</label>
                <label>Longevity Score:543</label>
        </div> <!-- class= "answer" -->     
    </main>
</body>
</html>