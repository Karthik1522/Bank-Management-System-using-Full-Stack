<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Deposit Check</title>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css'>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js'></script> 
<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/js/bootstrap.min.js'></script>
<link href="popup.css" rel="stylesheet" type="text/css">
<script>
    function showSuccessPopup() {
       	let success = document.getElementById("success");
       	success.click();
        
    }

    function showErrorAlert() {
    	let fail = document.getElementById("fail");
       	fail.click();
    }
    
    function redirect2(){
    	window.location.href = "deposit.jsp";
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
						<p class="mt-3">Something Went Wrong , Please try-again.</p>
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
						<p class="mt-3">Deposited Into Account Successfully</p>
						<button type="button" class="btn btn-sm mt-3 btn-success" onclick="redirect1()" data-bs-dismiss="modal">Ok</button> 
					</div> 
				</div> 
			</div> 
		</div>
	</div>
</div>
    <%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account", "root", "karthikeya");
        Statement st = con.createStatement();	
        int deposit = Integer.parseInt(request.getParameter("amount"));
        String password = request.getParameter("password");
        ResultSet rs = st.executeQuery("select * from customer where accno=" + session.getAttribute("accno"));
        PreparedStatement ps;
        if(rs.next()) {
            if(rs.getString("password").equals(password)) {
                int current = rs.getInt("balance");
                current += deposit;
                int i = st.executeUpdate("UPDATE `account`.`customer` SET `balance` = '" + current + "' WHERE (`accno` = '" + session.getAttribute("accno") + "')");
                if(i != 0) {
                 	ps = con.prepareStatement("INSERT INTO transactions values(?,?,?,?,?,?)");
                	ps.setInt(1,(int)session.getAttribute("accno"));
                	ps.setString(2,"DEPOSIT");
                	ps.setInt(3,(int)session.getAttribute("accno"));
                	ps.setString(4,session.getAttribute("username").toString());
                	ps.setInt(5,deposit);
                	ps.setInt(6,current);
                	int j = ps.executeUpdate(); 
                    session.setAttribute("balance",current);
    %>
                    <script>
                        showSuccessPopup();
                    </script>
                    
        			<% 
                } else {
    %>
                    <script>
                        showErrorAlert();
                    </script>
    <%
                }
            }else{
            	%>
                <script>
                    showErrorAlert();
                </script>
<%
            }
        }
        con.close();
    } catch(Exception e) {
        out.println("<div class=\"error-message\">An error occurred. Please try again.</div>");
        
    }
    %>
</div>
</body>
</html>
