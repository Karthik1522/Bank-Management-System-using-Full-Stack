<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<span>We already sent a verification code to your account</span>
	<form action="VerifyCode" method="post">
		<input type="text" name="code">
		<input type="submit" value="verify">
	</form>
</body>
</html>