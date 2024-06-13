<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script>
	function validateForm() {
		var username = document.getElementById('username').value;
		var password = document.getElementById('password').value;
		var confirmPassword = document.getElementById('confirmPassword').value;
		var amount = document.getElementById('amount').value;
		var email = document.getElementById('email').value;
	
		// Username validation
		if (!/^[a-zA-Z]+$/.test(username)) {
			alert("Username must contain only characters.");
			return false;
		}
	
		// Password validation
		if (password.length < 6) {
			alert("Password must be at least 6 characters long.");
			return false;
		}
	
		// Confirm Password validation
		if (password !== confirmPassword) {
			alert("Passwords do not match.");
			return false;
		}
	
		// Amount validation
		if (isNaN(amount) || amount < 500) {
			alert("Amount must be a number greater than or equal to 500.");
			return false;
		}
	
		// Email validation
		if (!/^\S+@\S+\.\S+$/.test(email)) {
			alert("Invalid email address.");
			return false;
		}
	
		return true;
	}
	</script>

<style>
	#registration {
		background-color: white;
		text-align: center;
		display: flex;
		flex-direction: column;
		align-items: center;
		margin: auto;
		padding: 20px;
		border-radius: 8px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}

	label {
		margin-bottom: 10px;
		font-weight: bold;
	}

	h2{
		display: inline-block;
	}

	input[type="text"],
	input[type="email"],
	input[type="password"],
	input[type="submit"],
	input[type="reset"] {
		padding: 10px 20px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		margin-top: 10px;
		font-size: 16px;
		transition: background-color 0.3s, color 0.3s;
	}

	input[type="text"],
	input[type="password"],input[type="email"] {
		border: 1px solid #ccc;
	}

	input[type="submit"],
	input[type="reset"] {
		background-color: #2ecc71;
		color: white;
	}

	input[type="submit"]:hover,
	input[type="reset"]:hover {
		background-color: #27ae60;
	}

	input[type="text"]:focus,
	input[type="password"]:focus,
	input[type="submit"]:focus,
	input[type="reset"]:focus {
		outline: none;
	}
	
	.button-container {
	    display: flex;
	    width : 100px;
	    gap: 140px; /* Adjust the gap as needed */
	}
	

</style>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Global Banking ..</title>
<link href="style1.css" rel="stylesheet" type="text/css">
</head>

<body>

<div id="top_links">
  

<div id="header">
	<h1>BANK OF AU<span class="style1"></span></h1>
    <h2>ExtraOrdinary Service</h2>
</div>

<div id="registration">
    <u><h1> CREATE ACCOUNT FORM</h1></u>
    <form name="F1" onSubmit="return validateForm()" action="signupCheck.jsp" method="post">
    <pre>
        <h2>USERNAME:</h2>	 <input type="text" name="username" required><br>
        <h2>PASSWORD:</h2>	 <input type="password" name="password" required><br>
<h2>CONFIRM-PASSWORD:</h2><input type="password" name="cpassword" required><br>
        <h2>AMOUNT:</h2>	 <input type="text" name="amount" required><br> 
        <h2>EMAIL:</h2>	 <input type="email" id="email" name="email" required><br>
        <div class="button-container">
        <input type="submit" value="CREATE" style="margin-left: 30px;">
        <input type="reset" value="CLEAR">
        </div>
        </pre>
    </form>
</div>
<br>

  
  <div id="footer_copyright" >
		    <p> &#169; 2023 [BANK OF AU]. All rights reserved. Unauthorized use, reproduction, or distribution of this application or its content is strictly prohibited.</div>
</div>

</body>
</html>
