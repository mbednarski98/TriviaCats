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

	<jsp:include page="./utils/header.jsp" />
	<jsp:include page="./utils/toolbar.jsp" />
	
<main>
	<form class="login">
			<img src = "./img/cat1.png"><br>
		 <h1>Trivia Cats</h1>
         <div class = "center">
         	<label for="userid">User id:</label><input type="text" required name="userid"><br>
         	<label for = "password">Password:</label><input type="text" required name="password"></div><br>
          
         <input  type="submit" value="Login">
         <input  type="submit" value="Register">
       </form><!-- login -->
	</main>
</div><!-- wrapper -->
</body>
</html>