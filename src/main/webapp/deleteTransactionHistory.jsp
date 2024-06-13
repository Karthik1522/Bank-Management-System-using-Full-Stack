<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/account", "root", "karthikeya");
    Statement st = con.createStatement();
    
    int accno = (int) session.getAttribute("accno");
    
    // Delete all entries for the current user in the transaction table
    int rowsAffected = st.executeUpdate("DELETE FROM transactions WHERE accno=" + accno);
    
    if (rowsAffected > 0) {
        // Deleted successfully
        response.sendRedirect("statement.jsp");
    } else {
        // No rows deleted
        out.println("<script>alert('No transaction history found for the current user.'); window.location.href = 'statement.jsp';</script>");
    }
    
    con.close();
} catch(Exception e) {
    // Error occurred
    out.println("<script>alert('An error occurred while deleting transaction history.'); window.location.href = 'statement.jsp';</script>");
}
%>
