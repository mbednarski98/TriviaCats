<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/main.css">
<title>Shop Page</title>
</head>
<body>
	<div id="wrapper">
	
		<jsp:include page="./utils/header.jsp" />
		<jsp:include page="./utils/toolbar.jsp" />
		
		<main>
			<div id="shopContainer">
				<div class="left">
					<button><img src="./img/leftArrow.png"></button>
				</div>
				<div class="right">
					<button><img src="./img/rightArrow.png"></button>
				</div>
				<div class="center">
					<img src="./img/cat1.png"/>
				</div>
			</div>
		
		
		</main>
	</div>
</body>
</html>