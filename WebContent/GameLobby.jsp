<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Playing Cat Trivia</title>
 <link rel="stylesheet" type="text/css" href="main.css">
</head>
<body>
<main>
<!-- TODO: Create dynamic code to create game boxes. -->
<!-- Populate data from database and server -->

<div class="gameLobby" tabindex = 0 >

<form class = "gameDetail" aria-label = "Green Game">
<h3><span>Green Game</span><span>status: Closed<input type="button" value="Join Game" onclick="joinGame()"></span><br></h3>
<span>open spots: 4</span><br>
<span>max players: 4</span><br><br>

<br>
<h3><span>Players:</span></h3>
<span class = "gamePlayers">	Jezabel</span>
<span class = "gamePlayers">	Cleopatra</span><br>
<span class = "gamePlayers">	Catherine</span>
<span class = "gamePlayers">	Jackal</span><br>
<br>
</form> <!-- Game Detail -->

<form class = "gameDetail" aria-label = "Green Game">
<h3><span>Yellow Game</span><span>status: Closed<input type="button" value="Join Game" onclick="joinGame()"></span><br></h3>
<span>open spots: 4</span><br>
<span>max players: 4</span><br><br>

<br>
<h3>Players:</h3>
<span class = "gamePlayers">	Mazakeen</span>
<span class = "gamePlayers">	Amariah</span><br>
<span class = "gamePlayers">	Alethea</span>
<span class = "gamePlayers">	Medusa</span><br>
<br>
</form> <!-- Game Detail -->

<form class = "gameDetail" aria-label = "Green Game">
<h3><span>Blue Game</span><span>status: Closed<input type="button" value="Join Game" onclick="joinGame()"></span><br></h3>
<span>open spots: 4</span><br>
<span>max players: 4</span><br><br>

<br>
<h3>Players:</h3>
<span class = "gamePlayers">	Titanic</span>
<span class = "gamePlayers">	Helzabub</span><br>
<span class = "gamePlayers">	HeliCat</span>
<span class = "gamePlayers">	TriMendus</span><br>
<br>
</form> <!-- Game Detail -->

<form class = "gameDetail" aria-label = "Green Game">
<h3><span>Red Game</span><span>status: Closed<input type="button" value="Join Game" onclick="joinGame()"></span><br></h3>
<span>open spots: 4</span><br>
<span>max players: 4</span><br><br>

<br>
<h3>Players:</h3>
<span class = "gamePlayers">	Beelzebub </span>
<span class = "gamePlayers">	Morax</span><br>
<span class = "gamePlayers">	Murmor</span>
<span class = "gamePlayers">	Barbados</span><br>
<br>
</form> <!-- Game Detail -->
</div> <!-- class="gameLobby"  -->

<script>
function joinGame() {
  alert("To be replace by code to enter game.");
}
</script>



</main>
</body>
</html>