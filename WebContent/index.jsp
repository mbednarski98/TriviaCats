<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	session = request.getSession(false);
	String logInOut;

	if (session != null && session.getAttribute("validationToken") != null) {
		logInOut = "out";
	} else {
		logInOut = "in";
	}
%>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="./css/main.css" rel="stylesheet" type="text/css">
<title>Trivia Cats</title>
</head>
<body>
<div class="navbar">
<ul>
	<li><a href="./index.jsp">Home</a></li>
	<li><a href="./lobbyList.jsp">Game Lobbys</a></li>
	<li><a href="./about.jsp">About</a></li>
	<li id="rightNavBarElement" style="float:right"><a href="./log<%= logInOut %>.jsp">Log<%= logInOut %></a></li>
</ul>
</div>
<div class="content">
<h1>The quick brown fox jumps over the lazy dog.<br>1234567890<br>`~!@#$%^&*()-_=+[{]}\|;:'",<.>/?</h1>
</div>
</body>
</html>