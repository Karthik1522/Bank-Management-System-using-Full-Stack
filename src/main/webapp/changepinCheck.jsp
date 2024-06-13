<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ChangePin Check</title>
<script>
    function showSuccessPopup() {
        alert("Pin Changed Successfull");
        window.location.href = "homepage.jsp";
    }

    function showErrorAlert() {
        alert("Something went wrong. Please try again.");
        window.location.href = "changepin.jsp";
    }
    
    function misMatchPassword() {
        alert("Password Mismatch.");
        window.location.href = "changepin.jsp";
    }
</script>
</head>
<body>
<div class="container">
    <% 
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account", "root", "karthikeya");
        Statement st = con.createStatement();	
        String password = request.getParameter("password");
        String new_password = request.getParameter("cpassword");
        System.out.println("Before executing SQL query");
        ResultSet rs = st.executeQuery("select * from customer where accno=" + session.getAttribute("accno"));
        System.out.println("After executing SQL query");
        if(rs.next()) {
        	
            if(rs.getString("password").equals(password)) {
            	System.out.println("Before executing SQL query");
                int i = st.executeUpdate("UPDATE `account`.`customer` SET `password` = '" + new_password + "' WHERE (`accno` = '" + session.getAttribute("accno") + "')");
                System.out.println("After executing SQL query");
                if(i != 0) {
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
            } else {
    %>
                <script>
                    misMatchPassword();
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
