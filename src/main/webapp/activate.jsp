<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><jsp:include page="include/title.jsp">
		<jsp:param name="pageTitle" value="Activate account" />
	</jsp:include></title>
<link rel="shortcut icon" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="css/activatepage.css">
<script type="text/javascript" src="widget/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/activate.js"></script>
<jsp:include page="include/recaptcha3.jsp">
	<jsp:param name="reCaptchaAction" value="activateuser" />
</jsp:include>
</head>
<body>
	<!-- start header div -->
	<div class="header">
		<h3>Activate</h3>
	</div>
	<!-- end header div -->

	<!-- start wrap div -->
	<div class="wrap">
		<form action="Activate" method="post" id="activationForm">
			<fieldset>
				<legend>Activate account</legend>
				<input type="email" name="context" required="required"
					autofocus="autofocus" placeholder="Email Address"><br>
				<input type="text" name="challenge" required="required"
					placeholder="Security token"><br> <input
					type="password" name="secret" id="secret" required="required"
					placeholder="Password"><br> <input type="password"
					name="cnfsecret" id="cnfsecret" required="required"
					placeholder="Confirm password"><br> <input
					type="hidden" name="captcha" id="recaptcha-response"> <input
					type="submit" name="submit" value="Submit">
			</fieldset>
		</form>
		<span id='message'></span>
		<!-- end sign up form -->
		<p>
			<a href="index.jsp">Go to home page</a>
		</p>
	</div>
	<!-- end wrap div -->
	<!-- FOOTER -->
	<footer class="footer"><jsp:include page="include/footer.jsp"></jsp:include></footer>
</body>
</html>