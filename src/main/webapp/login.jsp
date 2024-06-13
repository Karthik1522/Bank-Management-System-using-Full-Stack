 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Banking Login</title>
    <link href="style1.css" rel="stylesheet" type="text/css">
    <style>
        body {
            font-family: "Open Sans", sans-serif;
            background-color: #000; /* Black background */
            margin: 0;
            padding: 0;
            height: 100vh;
            color: #fff; /* White text */
        }
        
        #logo {
            margin: 0 auto;
            background: url(images/globe_03.gif) 0 0 no-repeat;
            width: 897px;
            height: 282px;
            text-align: center;
        }

        

        #container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px; /* Adjust margin as needed */
        }

        .loginBox {
            font-family: "Open Sans", sans-serif;
            border-top: 15px solid rgba(0, 0, 0, 1);
            width: 340px;
            background-color: #3b3b3b;
            padding: 50px 40px 20px 40px;
            color: white; /* Text color */
            text-align: center; /* Centering text */
            border-radius: 8px; /* Rounded corners */
        }

        .header {
            color: white;
            font-weight: 600;
            font-size: 1.6em;
            margin-bottom: 20px;
        }

        input {
            width: calc(100% - 22px);
            line-height: 50px;
            margin-bottom: 15px;
            border: 1px solid rgba(81, 81, 81, 1);
            background-color: #2b2b2b;
            font-size: 18px;
            color: #9f9f9f;
            padding-left: 20px;
            font-weight: 400;
            border-radius: 4px; /* Rounded corners */
            outline: none; /* Remove default focus outline */
        }

        .button {
            border: none;
            border-radius: 4px; /* Rounded corners */
            background: #8b83be;
            border-bottom: 10px solid #7167ac;
            width: 100%;
            color: #fff;
            font-size: 18px;
            line-height: 45px;
            cursor: pointer; /* Change cursor on hover */
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #7167ac; /* Change background color on hover */
        }

        p {
            font-size: 18px;
            color: #6d6d6d;
            margin-top: 20px; 
        }

        a {
            color: #c2c2c2;
            text-decoration: none;
            font-family: "Open Sans", sans-serif;
            &:first-child {
                padding-right: 20px;
            }
            &:last-child {
                padding-left: 20px;
            }
        }

        .footer {
            color: #c2c2c2;
            font-size: 14px;
            text-align: center;
            margin-top: 20px;
        }

        .footer img {
            width: 30px;
            height: 30px;
            vertical-align: middle;
            margin-right: 10px;
        }
        
        #bankname{
        	position : absolute;
        	top : 70px;
        	right : 550px;
        }
        
        #title{
        	position : absolute;
        	top : 110px;
        	right : 550px;
        }
    </style>
</head>
<body>
    <div id="logo">
        <h1 id="bankname">BANK OF AU</h1>
        <h2 id="title">ExtraOrdinary Service</h2>  
    </div>
    <div id="container">
        <div class="loginBox">
            <div class="header">ACCESS YOUR ACCOUNT</div>
            <form action="loginCheck.jsp" method="post">
                <input type="number" placeholder="&#61447; &#160; Account Number" name="accno" required />
                <input type="password" placeholder="&#xf023; &#160; Password" name="password" required/>
                <button type="submit" class="button">LOGIN</button>
            </form>
            <p style="text-align : center;" ><a href="signup.jsp">Sign Up</a></p>
            <div class="footer">
                &copy; 2024 BANK OF AU. All rights reserved.
            </div>
        </div>
    </div>
</body>
</html>
