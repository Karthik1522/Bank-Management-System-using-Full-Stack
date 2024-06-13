<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Global Banking ..</title>
<link href="style1.css" rel="stylesheet" type="text/css">
<style>

.footer-table td{
color : white;

}
</style>


</head><body>

<div id="top_links">
  

<div id="header">
    <h1>BANK OF AU<span class="style1"></span></h1>
    <h2>ExtraOrdinary Service</h2>  
   	<A href="login.jsp" ><IMG SRC="images/home1.gif"></IMG></A> 
	
</div>

<!-- Display username here -->
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

<table cellpadding="0" cellspacing="0" id="content1"><tr align="justify">
    <td class="con" valign="top">
        <div id="heade1"><h1>Results</h1></div>
        <p>Experience seamless banking with our application, offering swift transactions and real-time updates.
Enjoy enhanced financial control with our intuitive interface and comprehensive account management tools.
      

</p>
    </td>
    
    <td class="con" valign="top">
        <div id="heade2"><h1>Opportunities</h1></div>
        <p> Explore personalized financial insights tailored to your spending habits and goals.
Discover exclusive offers and rewards through our loyalty programs and partnerships.


</p>
    </td>
    
    <td class="con" valign="top">
        <div id="heade3"><h1>Solutions</h1></div>
        <p>Streamline your budgeting and saving goals with our customizable financial planning tools.
Simplify bill payments and fund transfers with just a few clicks, anytime, anywhere.

        
    </td>
</tr></table>

<table style="width:897px; background:#FFFFFF; margin:0 auto;"><tr align="justify">
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
    
    <td width="299" valign="top">
        <div id="welcome" style="border-right:#666666 1px dotted;"><h1>Welcome</h1><br>
            <center><img src="images/globe_10.gif" alt="business" width="196" height="106"></center><br>
            <p>Welcome to [BANK OF AU] Online Banking! Enjoy secure, convenient banking at your fingertips. Let's make managing your finances simple and hassle-free. Happy banking!</p>
            
        </div>      
    </td>
    
    <td width="299" valign="top">
        <div id="news"><h1>News &amp; Events</h1><br>
        <div class="img"><img src="images/globe_12.gif" alt="Business"></div>
        <h2>Nov. 17, 2008.</h2>
        <p>Get your dream web design at no cost, no extra manpower for your professional website.</p><br>
        <div class="img"><img src="images/globe_16.gif" alt="Business"></div>
        <h2>Nov. 17, 2008.</h2>
        <p>Get your dream web design at no cost, no extra manpower for your professional website.</p>
      
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

</div>

</body>
</html>
