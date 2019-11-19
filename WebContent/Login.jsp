<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trivia Cat LogIn</title>
 <link rel="stylesheet" type="text/css" href="./css/main.css">
</head>

 <body>
	<div id="wrapper">

		<header>	
			<img src = "./img/crazyCat.jpg">
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

	<form class="login">
			<img src = "./img/colorCrazyCat.jpg"><br>
		<h1>Trivia Cats</h1>
         <label for="userid">User id:</label><input type="text" required name="userid"><br>
         <label for = "password">Password:</label><input type="text" required name="password"><br>
          
         <input  type="submit" value="Login">
         <input  type="submit" value="Register">
       </form><!-- login -->
	</main>
</div><!-- wrapper -->
</body>
</html>