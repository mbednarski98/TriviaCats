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
<link href="main.css" rel="stylesheet" type="text/css">
<title>Login</title>
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
	<div class="login" id="loginForm" align="center">
	<form name="login" method="POST" action="./validate.jsp">
	<table width="100%">
		<tr>
			<td align="right">Username:</td>
			<td align="left"><input name="username" type="text" maxlength="24" autofocus></td>
		</tr>
		<tr>
			<td align="right">Password:</td>
			<td align="left"><input name="password" type="password" maxlength="64"></td>
		</tr>
		<tr>
			<td colspan="2"><input id="loginBtn" type="submit" value="Login"></td>
		</tr>
		<tr>
			<td colspan="2"><hr><input id="newActBtn" type="submit" value="Create New Account"></td>
		</tr>
	</table>
	</form>
	</div>
</body>
</html>