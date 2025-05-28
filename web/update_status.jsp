<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String orderId = request.getParameter("orderId");
String status = request.getParameter("status");

if (orderId != null && status != null) {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");
        String sql = "UPDATE `order` SET status = ? WHERE order_id = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, status);
        pst.setString(2, orderId);
        int result = pst.executeUpdate();
        con.close();
        
        if (result > 0) {
            out.print("Status updated successfully");
        } else {
            out.print("Failed to update status");
        }
    } catch (Exception e) {
        out.print("Error: " + e.getMessage());
    }
} else {
    out.print("Invalid parameters");
}
%>