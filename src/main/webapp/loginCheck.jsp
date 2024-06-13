<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<script>
    function showAlert() {
        alert("Account not found. Please try again.");
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
        
        int accno = Integer.parseInt(request.getParameter("accno"));
        String pass = request.getParameter("password");
        ResultSet ob = st.executeQuery("SELECT * FROM customer where accno=" + accno + " and password='" + pass + "'");
        if (ob.next()) {
            session.setAttribute("accno", accno);
            String user = ob.getString("username");
            out.println(user);
            session.setAttribute("username",user);
            response.sendRedirect("homepage.jsp");
        } else {
    %>
            <script>
                showAlert();
            </script>
    <%
        }
    } catch (Exception e) {
        out.println(e);
    }
    %>
</body>
</html>
