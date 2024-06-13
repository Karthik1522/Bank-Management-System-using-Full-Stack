<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Transfer Check</title>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css'>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js'></script> 
<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/js/bootstrap.min.js'></script>
<link href="popup.css" rel="stylesheet" type="text/css">
<script>
var error = 0;

    function showSuccessPopup() {
       	let success = document.getElementById("success");
       	success.click();
        
    }
    
    function InsufficientBalance() {
    	let fail = document.getElementById("fail");
    	let text = document.getElementById("message");
    	error = 1;
    	text.innerHTML = "Insufficient Funds. Please Deposit Money.";
    	fail.click();
    }
    
    function showPasswordIncorrect() {
    	let fail = document.getElementById("fail");
    	let text = document.getElementById("message");
    	error = 2;
    	text.innerHTML = "Password Incorrect, Please try-again.";
    	fail.click();
    }    
    
    function showTransactionFailed() {
    	let fail = document.getElementById("fail");
    	let text = document.getElementById("message");
    	text.innerHTML = "Transaction Failed, Please Try-Again.";
    	fail.click();
    }
    
    function recieverNotFound(){
    	let fail = document.getElementById("fail");
    	let text = document.getElementById("message");
    	text.innerHTML = "Receiver Account Not Found, Please Try-Again.";
    	fail.click();
    }
    
    function errorMatch(){
    	let fail = document.getElementById("fail");
    	let text = document.getElementById("message");
    	text.innerHTML = "Reciever Account Number and User Account Number Should not be Same.";
    	fail.click();
    }
    
    function redirect2(){
    	if(error == 1)
    		window.location.href = "deposit.jsp";
    	else
    		window.location.href = "transfer.jsp";
    }
    
    function redirect1(){
    	window.location.href = "balance.jsp";
    }
</script>
</head>
<body>

   
<div class="container  p-5">
	<div class="row">
		<div class="col-12 text-center">
			<button type="button" class="btn btn-success m-1" data-bs-toggle="modal" data-bs-target="#statusSuccessModal" id="success">Success Modal</button>
			<button type="button" class="btn btn-danger m-1" data-bs-toggle="modal" data-bs-target="#statusErrorsModal" id="fail">Error Modal</button> 
		</div>




		<div class="modal fade" id="statusErrorsModal" tabindex="-1" role="dialog" data-bs-backdrop="static" data-bs-keyboard="false"> 
			<div class="modal-dialog modal-dialog-centered modal-sm" role="document"> 
				<div class="modal-content"> 
					<div class="modal-body text-center p-lg-4"> 
						<svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 130.2 130.2">
							<circle class="path circle" fill="none" stroke="#db3646" stroke-width="6" stroke-miterlimit="10" cx="65.1" cy="65.1" r="62.1" /> 
							<line class="path line" fill="none" stroke="#db3646" stroke-width="6" stroke-linecap="round" stroke-miterlimit="10" x1="34.4" y1="37.9" x2="95.8" y2="92.3" />
							<line class="path line" fill="none" stroke="#db3646" stroke-width="6" stroke-linecap="round" stroke-miterlimit="10" x1="95.8" y1="38" X2="34.4" y2="92.2" /> 
						</svg> 
						<h4 class="text-danger mt-3">Error!</h4> 
						<p class="mt-3" id="message">Something Went Wrong , Please try-again.</p>
						<button type="button" class="btn btn-sm mt-3 btn-danger" onclick="redirect2()" data-bs-dismiss="modal">Ok</button> 
					</div> 
				</div> 
			</div> 
		</div>
		<div class="modal fade" id="statusSuccessModal" tabindex="-1" role="dialog" data-bs-backdrop="static" data-bs-keyboard="false"> 
			<div class="modal-dialog modal-dialog-centered modal-sm" role="document"> 
				<div class="modal-content"> 
					<div class="modal-body text-center p-lg-4"> 
						<svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 130.2 130.2">
							<circle class="path circle" fill="none" stroke="#198754" stroke-width="6" stroke-miterlimit="10" cx="65.1" cy="65.1" r="62.1" />
							<polyline class="path check" fill="none" stroke="#198754" stroke-width="6" stroke-linecap="round" stroke-miterlimit="10" points="100.2,40.2 51.5,88.8 29.8,67.5 " /> 
						</svg> 
						<h4 class="text-success mt-3">Success</h4> 
						<p class="mt-3">Funds Transfered Successflly.</p>
						<button type="button" class="btn btn-sm mt-3 btn-success" onclick="redirect1()" data-bs-dismiss="modal">Ok</button> 
					</div> 
				</div> 
			</div> 
		</div>
	</div>
</div>
    <%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/account","root","karthikeya");
    Statement st=con.createStatement();   
    
    int reciever_accno = Integer.parseInt(request.getParameter("reciever"));
    int amount = Integer.parseInt(request.getParameter("amount"));
	int source = (int)session.getAttribute("accno");
    String password = request.getParameter("password");
    PreparedStatement ps1;
								
	if(reciever_accno == source){
	%>
			<script> 
                    errorMatch();
            </script>
	<% 
	}
	else{
    ResultSet rs=st.executeQuery("select * from account.customer where accno="+session.getAttribute("accno"));
    if(rs.next())
    {
        if(rs.getString("password").equals(password)) {
            int orgbalance=rs.getInt("balance");
            int x = orgbalance;
            if(orgbalance>=amount)
            {
            orgbalance=orgbalance-amount;
            int i=st.executeUpdate("UPDATE `account`.`customer` SET `balance` = '"+orgbalance+"' WHERE (`accno` = '"+session.getAttribute("accno")+"')");
            if(i!=0)
                {
            PreparedStatement ps = con.prepareStatement("select * from customer where accno=(?)");
            ps.setInt(1,reciever_accno);
            ResultSet rs1=ps.executeQuery();
                if(rs1.next())
                {
                int currentreceiver=rs1.getInt("balance");
                currentreceiver=currentreceiver+amount;
                int j=st.executeUpdate("UPDATE `account`.`customer` SET `balance` = '"+currentreceiver+"' WHERE (`accno` = '"+reciever_accno+"')");
                session.setAttribute("balance",orgbalance);
                        if(j!=0)
                        {
                        	ps1 = con.prepareStatement("INSERT INTO transactions values(?,?,?,?,?,?)");
                        	ps1.setInt(1,(int)session.getAttribute("accno"));
                        	ps1.setString(2,"TRANSFER");
                        	ps1.setInt(3,reciever_accno);
                        	ps1.setString(4,rs1.getString("username").toString());
                        	ps1.setInt(5,amount);
                        	ps1.setInt(6,orgbalance);
                        	int k = ps1.executeUpdate(); 
    %>
                            <script> 
                            showSuccessPopup(); 
                            </script>
    <%
                        }
                        else
                        {
    %>
                            <script> 
                            showTransactionFailed(); 
                            </script>
    <%
                        }
                }
                else
                {
                	int j=st.executeUpdate("UPDATE `account`.`customer` SET `balance` = '"+x+"' WHERE (`accno` = '"+session.getAttribute("accno")+"')");
            %>
                    <script> 
                    recieverNotFound(); 
                    </script>
                    
            <%
                }
        }
        
        else
        {
        %>
                <script>
                showTransactionFailed(); 
                </script>
        <%
        }   
    }   else{
        %>
            <script>
            InsufficientBalance(); 
            </script>
        <%
    }
            
        }
        else
        {
    %>
            <script> 
            showPasswordIncorrect(); 
            </script>
    <%
        }
    }
	}
    con.close();
    %>
</body>
</html>
