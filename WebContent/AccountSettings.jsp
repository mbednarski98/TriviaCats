<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trivia Cat Account</title>
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
			<h1>User Profile</h1>
         <label for="userid">User id:</label><input type="text" required name="userid"><br>
         <label for = "password">Password:</label><input type="text" required name="password"><br>
             <label for = "other">Other:</label><input type="text" required name="other"><br>
             <label for = "other">Other:</label><input type="text" required name="other"><br>
             <label for = "other">Other:</label><input type="text" required name="other"><br>
             <label for = "other">Other:</label><input type="text" required name="other"><br>
             <label for = "other">Other:</label><input type="text" required name="other"><br>
        
     
         <input  type="submit" value="Update">
       </form><!-- register -->
	</main>
	</div><!-- register -->
</div><!-- wrapper -->
</body>
</html>