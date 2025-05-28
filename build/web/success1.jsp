
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
    // Retrieve the customer ID and total payment amount from the session or request object
   String custEmail = (String) session.getAttribute("email");
    String grandTotalStr = request.getParameter("grandTotal");
    double grandTotal = 0.0;
    if (grandTotalStr != null) {
        grandTotal = Double.parseDouble(grandTotalStr);
    

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");

        // Fetch the customer ID
        String getCustomerIdSql = "SELECT cust_id FROM customer WHERE email = ?";
        PreparedStatement getCustIdPst = con.prepareStatement(getCustomerIdSql);
        getCustIdPst.setString(1, custEmail);
        ResultSet custRs = getCustIdPst.executeQuery();
        int custId = 0;
        if (custRs.next()) {
            custId = custRs.getInt("cust_id");

            // Fetch the cart details for the customer
            String cartSql = "SELECT * FROM cart WHERE cust_id = ?";
            PreparedStatement cartPst = con.prepareStatement(cartSql);
            cartPst.setInt(1, custId);
            ResultSet cartRs = cartPst.executeQuery();

            // Insert records into the order table
            while (cartRs.next()) {
                String insertOrderSql = "INSERT INTO `order` (cust_id, Painting_image, painting_name, quantity, price) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement insertOrderPst = con.prepareStatement(insertOrderSql);
                insertOrderPst.setInt(1, custId);
                insertOrderPst.setString(2, cartRs.getString("image"));
                insertOrderPst.setString(3, cartRs.getString("painting_name"));
                insertOrderPst.setInt(4, cartRs.getInt("quantity"));
                insertOrderPst.setDouble(5, cartRs.getDouble("total"));
                insertOrderPst.executeUpdate();
            }

            // Clear the customer's cart
            String clearCartSql = "DELETE FROM cart WHERE cust_id = ?";
            PreparedStatement clearCartPst = con.prepareStatement(clearCartSql);
            clearCartPst.setInt(1, custId);
            clearCartPst.executeUpdate();
        }
    
        con.close();
    }
    catch (Exception e) {
        e.printStackTrace();
    }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Payment Successful</title>
    <!-- Add any additional CSS or JavaScript files as needed -->
</head>
<body>
    <h1>Payment Successful</h1>
    <p>Thank you for your order. Your payment of &#x20b9;<%=grandTotal%> has been received.</p>
    <!-- Add any additional content or navigation links as needed -->
</body>
</html>