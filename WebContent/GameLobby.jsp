<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Playing Cat Trivia</title>
  <link rel="stylesheet" type="text/css" href="main7.css">
</head>

 <body>
	<div id="wrapper">

		<header>	
			<img src = "C:\\Users\\amisaac\\git\\TriviaCats\\images\\crazyCat.jpg">
		    <h1>Cat Trivia</h1>
		</header>
    
	<nav>
		<ul>
			<li><strong>Menu</strong></li>
			<li><span>Page User is on</span></li>
		  <li><a href="HomePage.jsp">Home</a></li>
		  <li><a href="LoginInPage.jsp">Login/Register</a></li>
		  <li><a href="GameLobby.jsp">Game Lobby</a></li>
		  <li><a href="Dashboard.jsp">Dashboard</a></li>
		  <li><a href="ShopPage.jsp">Shop Accessories</a></li>
		  <li><a href="AccountPage.jsp">Account</a></li>
		</ul>
	</nav>

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
<span>open spots: 0</span><br>
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
<span>open spots: 0</span><br>
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
<h3><span>Red Game</span><span>status: Open<input type="button" value="Join Game" onclick="joinGame()"></span><br></h3>
<span>open spots: 1</span><br>
<span>max players: 4</span><br><br>

<br>
<h3>Players:</h3>
<span class = "gamePlayers">	Beelzebub </span>
<span class = "gamePlayers">	Morax</span><br>
<span class = "gamePlayers">	Murmor</span><br>
<br>
</form> <!-- Game Detail -->
</div> <!-- class="gameLobby"  -->

<script>
function joinGame() {
  alert("To be replace by code to enter game.");
}
</script>



</main>
</div><!-- wrapper -->
</body>
</html>