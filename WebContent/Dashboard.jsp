<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Playing Cat Trivia</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
</head>

<body>
	<div id="wrapper">

		<jsp:include page="./utils/header.jsp" />
		<jsp:include page="./utils/toolbar.jsp" />

		<main>
			<form id="roomContainer">
				<div class="roomCard">
					<h3>Room Number: VALUE</h3> <button id="roomButton" type="button" onclick="joinGame()">Join</button>
					<p>Status: <span>(OPEN/CLOSE)</span></p>
					<p>Number of Cats: <span>VALUE</span></p>
					<br>
					<br>
					<h3>Cats:</h3>
					<div id=userNames></div>
				</div>
			</form>
			
			
			<div id="roomContainer">
				<div class="roomCard">
					<h3>Room Number: VALUE</h3> <button id="roomButton" type="button" onclick="joinGame()">Join</button>
					<p>Status: <span>(OPEN/CLOSE)</span></p>
					<p>Number of Cats: <span>VALUE</span></p>
					<br>
					<br>
					<h3>Cats:</h3>
					<div id=userNames></div>
				</div>
			</div>
				

			<script>
				function joinGame() {
					alert("To be replace by code to enter game.");
				}
			</script>



		</main>
	</div>
	<!-- wrapper -->
</body>
</html>