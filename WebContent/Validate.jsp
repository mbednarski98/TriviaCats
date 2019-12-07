<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.regex.Pattern" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validating...</title>
</head>
<body>
<%
	session = request.getSession(true);
	if (session.getAttribute("validationToken") == null) {
		if (request.getAttribute("username") != null && request.getAttribute("password") != null) {
			String username = (String) request.getAttribute("username");
			String password = (String) request.getAttribute("password");
			
			if (username.length() <= 24 && password.length() <= 64) {
				// Username must be Alphanumeric
				String usernameRegex = "^[a-zA-Z0-9]+$";
				
				/* Password must contain at least eight characters,
				 at least one uppercase letter,
				 one lowercase letter,
				 one number, and one special character. */ 
				String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
				
				Pattern pattern = Pattern.compile(usernameRegex);
				
				if (pattern.matcher(username).matches()) {
					
					pattern = Pattern.compile(passwordRegex);
					if (pattern.matcher(password).matches()) {
						// TODO: grab information from sql database
						// check if username exists
						// hash provided password and compare to password hash stored in database
						
						// if username isn't in database redirect to login page
						// if password isn't correct redirect to login page
						// login page should display error "Username or Password incorrect."
						
						// if all information is valid then generate a validationToken and pass it into the user session
						// store validation token in validation token table with a creation date and an expiration date
						
						//once fully validated
						response.sendRedirect("./index.jsp");
					}
				}
			}
		}
	}
	response.sendRedirect("./login.jsp");
%>
</body>
</html>