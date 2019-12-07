<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/main.css">
<style>

	#userList {
		display: block;
		width:   10vw;
		height:  95vh;
		float:   left;
		margin:  8px;
		margin-right: 4px;
		padding: 8px;
		background-color: lightblue;
	}
	
	#gameMat {
		display: block;
		width: 85vw;
		height: 95vh;
		float: right;
		margin: 8px;
		margin-left: 4px;
		passing: 8px;
		background-color: lightgreen;
	}

</style>
<title>Yet another test page</title>
</head>
<body>
<div id="userList"><ul id="playerList"></ul></div>
<div id="gameMat"></div>
<div id="snackBar" class="snackbar"></div>
<script src="./js/client.js"></script>
<script>
var client = new WebSocketClient("ws", "localhost", "8080", "/TriviaCats/trivia/666");
</script>
</body>
<footer></footer>
</html>