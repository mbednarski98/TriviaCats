<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trivia Cat Account</title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
</head>

<body>
	<div id="wrapper">

		<jsp:include page="./utils/header.jsp" />
		<jsp:include page="./utils/toolbar.jsp" />

		<main>


			<form>
				<h1>User Profile</h1>
				<div class="center">
					<label for="userid">User id:</label><input type="text" required
						name="userid"><br> <label for="password">Password:</label><input
						type="text" required name="password"><br> <label
						for="other">Other:</label><input type="text" required name="other"><br>
					<label for="other">Other:</label><input type="text" required
						name="other"><br> <label for="other">Other:</label><input
						type="text" required name="other"><br> <label
						for="other">Other:</label><input type="text" required name="other"><br>
					<label for="other">Other:</label><input type="text" required
						name="other"><br>
				</div>

				<div class="center">
					<input type="submit" value="Update">
				</div>
			</form>

		</main>

	</div>
	<!-- wrapper -->
</body>
</html>