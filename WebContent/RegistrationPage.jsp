<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trivia Cat Registration</title>
 <link rel="stylesheet" type="text/css" href="main8.css">
</head>

 <body>
	<div id="wrapper">

		<header>	
			<img src = "C:\\Users\\amisaac\\git\\TriviaCats\\images\\crazyCat.jpg">
		    <h1>Trivia Cats</h1>
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
<div id="register">
<img src = "C:\\Users\\amisaac\\git\\TriviaCats\\images\\fireCat.jpg"><br>
	<form class="register">
			<h1>Register</h1>
		 <label for = "email">Password:</label><input type="text" required name="email"><br>
         <label for="userid">User id:</label><input type="text" required name="userid"><br>
         <label for = "password">Password:</label><input type="text" required name="password"><br>
         <label for = "re-enterPW">Re-enter password:</label><input type="text" required name="re-enterPW"><br>
        
     
         <input  type="submit" value="Register">
       </form><!-- register -->
	</main>
	</div><!-- register -->
</div><!-- wrapper -->
</body>
</html>