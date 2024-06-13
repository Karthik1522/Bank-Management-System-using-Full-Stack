 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
        }
        .header-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .user-info {
            font-weight: bold;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .increase {
            color: green;
        }
        .decrease {
            color: red;
        }
        .transfer{
        	color : black;
        }
        
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        .delete-button {
            padding: 10px 20px;
            background-color: #ff6666;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .empty-message {
            text-align: center;
            margin-top: 20px;
            color: #999;
        }
    </style>
</head>

<body>

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

<div class="container">
        <u><h1>BANK STATEMENT</h1></u>
        <br><br>
        <div class="header-row">
            <div class="user-info">Current User Account No: <%= session.getAttribute("accno") %></div>
            <div class="user-info">Current Balance: <%= session.getAttribute("balance") %></div>
        </div>
        <table>
            <tr>
                <th>Mode</th>
                <th>Recipient Acc No</th>
                <th>Recipient Name</th>
                <th>Amount</th>
                <th>Current Balance</th>
            </tr>
            <% 
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account", "root", "karthikeya");
                Statement st = con.createStatement();    
                int accno = (int) session.getAttribute("accno");
                boolean isEmpty = true;
                ResultSet rs = st.executeQuery("SELECT * FROM transactions WHERE accno=" + accno);
                while(rs.next()) {
                	isEmpty = false;
                    String mode = rs.getString("mode");
                    String recipientAccNo = rs.getString("reciever_accno");
                    String recipientName = rs.getString("reciever_name");
                   	int amount = rs.getInt("amount");
                    int currentBalance = rs.getInt("balance");

                    String amountClass = "increase";
                    if ("withdraw".equalsIgnoreCase(mode)) {
                        amountClass = "decrease";
                    }

                    String recipientInfo = "-";
                    if ("transfer".equalsIgnoreCase(mode)) {
                    	amountClass = "transfer";
                        recipientInfo = recipientAccNo + " - " + recipientName;
                    }

                    %>
                    
                    <tr>
                        <td><%= mode %></td>
                        <td><%= recipientAccNo %></td>
                        <td><%= recipientName %></td>
                        <td class="<%= amountClass %>"><%= amount %></td>
                        <td class="<%= amountClass %>"><%= currentBalance %></td>
                    </tr>
                <% 
                
                }
                
               %>
               		</table>
               	<% 
               		if (isEmpty){
               	%>
                	<div class="empty-message">Transaction history is empty.</div>
              <%
                 }
                 
             %>
                <%	
                
                con.close();
            } catch(Exception e) {
                out.println("<tr><td colspan='5'>An error occurred while fetching transactions.</td></tr>");
            }
            %>
        </table>
        <form action="deleteTransactionHistory.jsp" method="post">
            <div class="button-container">
                <button type="submit" class="delete-button">Delete Transaction History</button>
            </div>
        </form>
    </div>



</div>

</body>
</html> 

