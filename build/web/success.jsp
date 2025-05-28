<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Success</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f5f5;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            text-align: center;
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 20px;
        }

        p {
            line-height: 1.6;
            margin-bottom: 20px;
        }

        a {
            color: #2980b9;
            text-decoration: none;
            transition: color 0.3s;
        }

        a:hover {
            color: #3498db;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
        // Retrieve the customer email and total payment amount from the session or request object
        String custEmail = (String) session.getAttribute("email");
        String grandTotalStr = request.getParameter("grandTotal");
        double grandTotal = 0.0;
        if (grandTotalStr != null) {
            grandTotal = Double.parseDouble(grandTotalStr);

            if (custEmail != null) {
                try {
                    // Load the JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish a connection to the database
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");

                    // Retrieve the customer ID using the customer's email
                    String getCustomerIdSql = "SELECT cust_id FROM customer WHERE email = ?";
                    PreparedStatement getCustIdPst = con.prepareStatement(getCustomerIdSql);
                    getCustIdPst.setString(1, custEmail);
                    ResultSet custRs = getCustIdPst.executeQuery();

                    if (custRs.next()) {
                        int custId = custRs.getInt("cust_id");

                        // Retrieve cart items for the customer
                        String getCartItemsSql = "SELECT * FROM cart WHERE cust_id = ?";
                        PreparedStatement getCartItemsPst = con.prepareStatement(getCartItemsSql);
                        getCartItemsPst.setInt(1, custId);
                        ResultSet cartRs = getCartItemsPst.executeQuery();

                        // Store order information for displaying later
                        StringBuilder orderDetails = new StringBuilder();
                        List<Integer> soldOutPaintingIds = new ArrayList<>();
                        while (cartRs.next()) {
                            String paintingImage = cartRs.getString("image");
                            String paintingName = cartRs.getString("painting_name");
                            int quantity = cartRs.getInt("quantity");
                            double total = cartRs.getDouble("total");
                            int paintingId = cartRs.getInt("painting_id");
                            
                            
                            
                            
                            
                                        
                            
                               // Check if the painting is available
    String checkAvailabilitySql = "SELECT quantity FROM painting WHERE painting_id = ?";
    PreparedStatement checkAvailabilityPst = con.prepareStatement(checkAvailabilitySql);
    checkAvailabilityPst.setInt(1, paintingId);
    ResultSet availabilityRs = checkAvailabilityPst.executeQuery();
                            
                            
                            
                             if (availabilityRs.next() && availabilityRs.getInt("quantity") > 0) {
        // Insert order and payment details for the available painting
        // ... (existing code for inserting order and payment details) ...
        
                                   
                            

                            // Insert each cart item into the order table
                            String insertOrderSql = "INSERT INTO `order` (cust_id, Painting_image, painting_name, quantity, price, status) VALUES (?, ?, ?, ?, ?, ?)";
                            PreparedStatement insertOrderPst = con.prepareStatement(insertOrderSql, Statement.RETURN_GENERATED_KEYS);
                            insertOrderPst.setInt(1, custId);
                            insertOrderPst.setString(2, paintingImage);
                            insertOrderPst.setString(3, paintingName);
                            insertOrderPst.setInt(4, quantity);
                            insertOrderPst.setString(5, String.valueOf(total));
                            insertOrderPst.setString(6, "Confirm");
                            insertOrderPst.executeUpdate();

                            // Retrieve the generated order ID
                            ResultSet generatedKeys = insertOrderPst.getGeneratedKeys();
                            int orderId = 0;
                            if (generatedKeys.next()) {
                                orderId = generatedKeys.getInt(1);
                            }

                            
                            
                            
                
    
    
    
    
    
                            
                            
                            // Insert payment details into the payment table
                            String insertPaymentSql = "INSERT INTO payment (cust_id, order_id, amount) VALUES (?, ?, ?)";
                            PreparedStatement insertPaymentPst = con.prepareStatement(insertPaymentSql, Statement.RETURN_GENERATED_KEYS);
                            insertPaymentPst.setInt(1, custId);
                            insertPaymentPst.setInt(2, orderId);
                            insertPaymentPst.setDouble(3, total);
                            insertPaymentPst.executeUpdate();

                            // Retrieve the generated payment ID
                            ResultSet paymentKeys = insertPaymentPst.getGeneratedKeys();
                            int paymentId = 0;
                            if (paymentKeys.next()) {
                                paymentId = paymentKeys.getInt(1);
                            }

                            // Retrieve the current timestamp
                            String getDateSql = "SELECT date FROM payment WHERE pay_id = ?";
                            PreparedStatement getDatePst = con.prepareStatement(getDateSql);
                            getDatePst.setInt(1, paymentId);
                            ResultSet dateRs = getDatePst.executeQuery();
                            String paymentDate = "";
                            if (dateRs.next()) {
                                paymentDate = dateRs.getString("date");
                            }

             // Pehle current quantity check karo
String checkQuantitySql = "SELECT quantity FROM painting WHERE painting_name = ?";
PreparedStatement checkQuantityPst = con.prepareStatement(checkQuantitySql);
checkQuantityPst.setString(1, paintingName);
ResultSet quantityRs = checkQuantityPst.executeQuery();

if (quantityRs.next()) {
    int currentQuantity = quantityRs.getInt("quantity");
    int newQuantity = Math.max(currentQuantity - quantity, 0);
    
    // Ab quantity update karo aur is_sold set karo
    String updatePaintingSql = "UPDATE painting SET quantity = ?, is_sold = ? WHERE painting_name = ?";
    PreparedStatement updatePaintingPst = con.prepareStatement(updatePaintingSql);
    updatePaintingPst.setInt(1, newQuantity);
    updatePaintingPst.setBoolean(2, newQuantity == 0);
    updatePaintingPst.setString(3, paintingName);
    updatePaintingPst.executeUpdate();
    
    // Agar new quantity 0 hai, to soldOutPaintingIds mein add karo
    if (newQuantity == 0) {
        String getPaintingIdSql = "SELECT painting_id FROM painting WHERE painting_name = ?";
        PreparedStatement getPaintingIdPst = con.prepareStatement(getPaintingIdSql);
        getPaintingIdPst.setString(1, paintingName);
        ResultSet paintingIdRs = getPaintingIdPst.executeQuery();
        
        if (paintingIdRs.next()) {
            int soldOutPaintingId = paintingIdRs.getInt("painting_id");
            soldOutPaintingIds.add(soldOutPaintingId);
        }
    }
}
        
        
        
    } else {
        // Painting is currently unavailable, skip inserting order and payment details
//        out.println("<p>The painting '" + paintingName + "' is currently unavailable.</p>");
    }
    
    
    
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
 
     
}

 
// Create a list or array to store the sold-out painting IDs



                        // Clear the cart for the customer
                        String clearCartSql = "DELETE FROM cart WHERE cust_id = ?";
                        PreparedStatement clearCartPst = con.prepareStatement(clearCartSql);
                        clearCartPst.setInt(1, custId);
                        clearCartPst.executeUpdate();

//                        out.println("<p>Your order has been placed successfully!</p>");
                        out.println(orderDetails.toString());
                        
                      
                    } else {
                        out.println("<p>Customer not found.</p>");
                    }

                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                }
            } else {
                out.println("<p>Please login to continue.</p>");
            }
        }
        %>

        <h1>Payment Successful</h1>
        <p>Thank you for your order. Your payment of &#x20b9;<%=grandTotal%> has been received.</p>
        <a href="index.jsp">Return to Home</a>
    
    </div>
</body>
</html>

