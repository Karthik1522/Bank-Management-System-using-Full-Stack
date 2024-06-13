<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<script>
    function showSuccess() {
        alert("Account Created Successfully, Please Log-In");
        alert("Your Account Number : "+accno + " , Please Remember.");
        window.location.href = "login.jsp";
    }
</script>
</head>
<body>
    <%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account", "root", "karthikeya");
        Statement st = con.createStatement();	
        
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        int amount = Integer.parseInt(request.getParameter("amount"));
        String email = request.getParameter("email");
        
        Random rn = new Random();
        int accno = rn.nextInt(999999);
        
        PreparedStatement ps = con.prepareStatement("INSERT INTO customer values(?,?,?,?,?)");
        ps.setInt(1,accno);
        ps.setString(2,pass);
        ps.setString(3,username);
        ps.setInt(4,amount);
        ps.setString(5,email);
        
        int i = ps.executeUpdate();
        if(i!=0){
        %>
    		<script>
    		var accno = "<%=  accno%>";
    		showSuccess();
    		</script>
        
        <% 
        }
    } catch (Exception e) {
        out.println(e);
    }
    %>
</body>
</html>
