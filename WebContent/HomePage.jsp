<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cat Trivia - Home</title>
 <link rel="stylesheet" type="text/css" href="./css/main.css">
</head>

 <body>
	<div id="wrapper">

		<header>	
			<img src = "./img/crazyCat.jpg">
		    <h1>Cat Trivia</h1>
		</header>
    
	<jsp:include page="./utils/toolbar.jsp" />

	
	<main id= "home">
		<div id="welcome">
		<img src = "./img/coolCat.jpg">
		<h1>Sign up now!</h1>
		<h2><img src = "./img/goldfish.jpg">30 Free Goldfish! </h2>
		
		</div>
	</main>
	
</div><!-- wrapper -->
</body>
</html>