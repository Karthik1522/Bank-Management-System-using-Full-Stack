<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Global Banking ..</title>
    <link href="style1.css" rel="stylesheet" type="text/css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .button-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
            padding-bottom : 20px;
        }

        .button-container div {
        	display: flex;
            justify-content: space-evenly;
            flex-direction : column;
            align-items: center;
            margin-top: 20px;
            text-align: center;
        }

        .button-container h3 {
            margin: 0;
            font-weight: bold;
        }

        .button-container input[type="button"] {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            font-size: 16px;
            transition: background-color 0.3s, color 0.3s;
            background-color: #2ecc71;
            color: white;
        }

        .button-container input[type="button"]:hover {
            background-color: #27ae60;
        }

    </style>
</head>
<body>

<div id="top_links">

    <div id="header">
        <h1>BANK OF AU<span class="style1"></span></h1>
        <h2>ExtraOrdinary Service</h2>
    </div>

    <table style="width:897px; background:#FFFFFF; margin:0 auto;">
        <tr >
            <td width="500" valign="top" style="border-right:#666666 3px solid ;">
                <div class="button-container">
                    <div>
                        <h3>Already Have an Account?</h3>
                        <input type="button" onclick="location.href = 'login.jsp'" value="Login">
                    </div>
                </div>
            </td>
            <td width="500" valign="top" style= "margin-left:50px">
                <div class="button-container">
                    <div>
                        <h3>Get Your Bank of AU Account Now!!!</h3>
                        <input type="button" onclick="location.href = 'signup.jsp'" value="Signup">
                    </div>
                </div>
            </td>
        </tr>
    </table>
</div>

<div id="footer_top">
  <div id="footer_navigation">
  </div>
</div>

</body>
</html>
