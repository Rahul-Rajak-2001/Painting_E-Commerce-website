<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
int orderId = Integer.parseInt(request.getParameter("order_id"));
String cancelReason = request.getParameter("reason");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");

    // Retrieve the quantity and painting name for the order
    String selectSql = "SELECT painting_name, quantity FROM `order` WHERE order_id = ?";
    PreparedStatement selectPst = con.prepareStatement(selectSql);
    selectPst.setInt(1, orderId);
    ResultSet rs = selectPst.executeQuery();
    String paintingName = "";
    int quantity = 0;
    if (rs.next()) {
        paintingName = rs.getString("painting_name");
        quantity = rs.getInt("quantity");
    }
    rs.close();
    selectPst.close();

    // Update the order status to 'Cancelled' and set the cancel reason
    String updateOrderSql = "UPDATE `order` SET status = 'Cancelled', cancel_reason = ? WHERE order_id = ?";
    
    PreparedStatement updateOrderPst = con.prepareStatement(updateOrderSql);
    updateOrderPst.setString(1, cancelReason);
    updateOrderPst.setInt(2, orderId);
    int result = updateOrderPst.executeUpdate();
    updateOrderPst.close();

    if (result > 0) {
        // Update the painting quantity in the painting table
        //String updatePaintingSql = "UPDATE painting SET quantity = quantity + ? WHERE painting_name = ?";
        String updatePaintingSql = "UPDATE painting SET quantity = quantity + ?, is_sold = 0 WHERE painting_name = ?";
        PreparedStatement updatePaintingPst = con.prepareStatement(updatePaintingSql);
        updatePaintingPst.setInt(1, quantity);
        updatePaintingPst.setString(2, paintingName);
        updatePaintingPst.executeUpdate();
        updatePaintingPst.close();
        
           
        out.print("Order cancelled successfully.");
    } else {
        out.print("Failed to cancel the order.");
    }

    con.close();
} catch (Exception e) {
    out.print("Error: " + e.getMessage());
}
%>
