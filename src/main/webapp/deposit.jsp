<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Global Banking ..</title>
<link href="style1.css" rel="stylesheet" type="text/css">
</head>

<style>
.button-container {
    display: flex;
    width : 100px;
    gap: 150px; /* Adjust the gap as needed */
}


.footer-table td{
color : white;
}


</style>

<body>


<div id="top_links">

<div id="header">
	<h1>BANK OF AU<span class="style1"></span></h1>
    <h2>ExtraOrdinary Service</h2>	
    <A href="login.jsp" ><IMG SRC="images/home1.gif"></IMG></A> 
</div>

<div id="username-box">
    <div id="username"> Welcome , <%= session.getAttribute("username") %> </div>
</div>

<div id="navigation">
    <ul>
    <li><a href="balance.jsp">BALANCE</a></li>
    <li><a href="deposit.jsp">DEPOSIT</a></li>
    <li><a href="withdraw.jsp">WITHDRAW</a></li>
    <li><a href="transfer.jsp">TRANSFER</a></li>
    <li><a href="statement.jsp">STATEMENT</a></li>
    <li><a href="changepin.jsp">CHANGE PIN</a></li>
    </ul>
</div>




<table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr >
	<td width="300" valign="top" style="border-right:#666666 1px dotted;">
    	<div id="services"><h1>Services</h1><br>
    	<ul>
            <li><a href="#">Account Management</a></li>
			<li><a href="#">Mobile Banking</a></li>
			<li><a href="#">Online Bill Pay</a></li>
			<li><a href="#"> Funds Transfer</a></li>
			<li><a href="#"> Account Alerts</a></li>
			<li><a href="#">Security Features</a></li>
			<li><a href="#">Customer Support</a></li>
         </ul>
			
       </div>
	</td>
    
    <td width="1500" valign="top" style="border-right:#666666 1px dotted;">
    	<div id="welcome" ><h1>DEPOSIT FORM</h1><br>
    	    <table align="center" bgcolor="white">
		<tr>
		
		</tr>
		<tr>
			<td>
				<form action="depositCheck.jsp" method="post">
				    <table cellspacing="5" cellpadding="3">
				   
					<tr><td>ACCOUNT NO:</td><td> <b> <%= session.getAttribute("accno")%> </b></td></tr>
					<tr><td>AMOUNT:</td><td> <input type="text" name="amount"/></td></tr>
					<tr><td>PASSWORD:</td><td> <input type="password" name="password"/></td></tr>
					
					<tr>
					<td>
						<div class="button-container">
                            <input type="submit" value="DEPSOIT" class="btn-change-pin"/>
                            <input type="reset" value="CLEAR" class="btn-clear"/>
                        </div>
                     </td>
					</tr>
                   	</table>	
				</form>
			</td>
		</tr>
	</table>
    	   </div>      
    </td>
    
     <td width="300" valign="top" style= "margin-left:50px">
    	<div id="welcome"><h1>Welcome</h1><br>
    	    
		    <p>Welcome to [BANK OF AU] Online Banking! Enjoy secure, convenient banking at your fingertips. Let's make managing your finances simple and hassle-free. Happy banking!</p>
	    	
	    </div>      
    </td>
           	
    
</tr></table>
<br>
<div id="footer_top" align="center">
    <table class="footer-table" cellspacing="6" cellpadding="6">
    <ul>
        <tr>
            <td><li>Contact Us</li></td>
            <td><li>Help Center or FAQ</li></td>
            <td><li>Security Information</li></td>
        </tr>
        <tr>
            <td><li>Terms of Service</li></td>
            <td><li>Privacy Policy</li></td>
            <td><li>About Us</li></td>
        </tr>
        <tr>
            <td><li>Careers</li></td>
            <td><li>Accessibility Options</li></td>
            <td></td> <!-- Empty cell for alignment -->
        </tr>
      </ul>
    </table>


  
  <div id="footer_copyright" >
		    <p> &#169; 2023 [BANK OF AU]. All rights reserved. Unauthorized use, reproduction, or distribution of this application or its content is strictly prohibited.</div>
</div>

</div>

</body>
</html>
