<%@page import="com.wanhive.iot.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.getSession().invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><jsp:include page="include/title.jsp">
		<jsp:param name="pageTitle" value="Welcome" />
	</jsp:include></title>
<link rel="shortcut icon" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="css/loginpage.css">
<jsp:include page="include/recaptcha3.jsp">
	<jsp:param name="reCaptchaAction" value="login" />
</jsp:include>
</head>
<body>
	<div class="login-box">
		<img src="images/avatar.png" class="avatar" alt="Welcome">
		<form action="Authenticate" method="post">
			<fieldset>
				<legend>Registered user</legend>
				<input type="email" name="username" required="required"
					autofocus="autofocus" placeholder="Email"><br> <input
					type="password" name="password" required="required"
					placeholder="Password"><br> <input type="hidden"
					name="captcha" id="recaptcha-response"> <input
					type="submit" name="submit" value="Sign in">
			</fieldset>
		</form>
		<p>
			<%
				if (Constants.isSignUpAllowed()) {
			%>
			<a href="newuser.jsp">Create account</a>
			<%
				}
			%>
			<br> <a href="recover.jsp">Forgot password?</a>
		</p>
	</div>
	<!-- FOOTER -->
	<footer class="footer"><jsp:include page="include/footer.jsp"></jsp:include></footer>
</body>
</html>