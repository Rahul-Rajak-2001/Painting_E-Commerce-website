
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Art-Shop</title>
   
    <!-- Include Stripe Elements JavaScript -->
    <script src="https://js.stripe.com/v3/"></script>
    
</head>
<body>
    <div class="container">
        <h2>Payment getaway</h2>
        
        <!-- Delivery Address -->
        <div>
           
            <% 
                String custEmail = (String) session.getAttribute("email");
              
            %>
         
           
        </div>

        <!-- Cart Details -->
        <div class="cart-items">
            <% 
                double grandTotal = 0;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");
                    String getCustomerIdSql = "SELECT cust_id FROM customer WHERE email = ?";
                    PreparedStatement getCustIdPst = con.prepareStatement(getCustomerIdSql);
                    getCustIdPst.setString(1, custEmail);
                    ResultSet custRs = getCustIdPst.executeQuery();
                    if(custRs.next()) {
                        int custId = custRs.getInt("cust_id");
                        String sql = "SELECT * FROM cart WHERE cust_id = ?";
                        PreparedStatement pst = con.prepareStatement(sql);
                        pst.setInt(1, custId);
                        ResultSet rs = pst.executeQuery();
                        while(rs.next()) {
                            int quantity = rs.getInt("quantity");
                            double total = rs.getDouble("total");
                            grandTotal += total;
            %>
           
            <% 
                        }
                    }
                    con.close();
                } catch (Exception e) {
                   e.printStackTrace();
                }
            %>
        </div>
       
        
        <!-- Checkout Button -->
<!--        <form action="success.jsp" method="POST">
        <script
            src="https://checkout.stripe.com/checkout.js"
            class="stripe-button"
            data-key="pk_test_51P7hlRSIE4KEYpsD8f1w15ofoyxvpp8GPIzS5NidX4B4gRLldqG0zw3oybwDsNC7i5htkXu1ToLhnu5PmIiDyUoF00RIh83aFQ"
            data-amount="<%=grandTotal * 100%>"
            data-name="Your Company Name"
            data-description="Order Payment"
            data-currency="inr">
        </script>
        </form>-->

<form action="success.jsp" method="POST">
     <input type="hidden" name="grandTotal" value="<%=grandTotal%>">
        <script
            src="https://checkout.stripe.com/checkout.js"
            class="stripe-button"
            <!-- data-key="pk_test_51P7hlRSIE4KEYpsD8f1w15ofoyxvpp8GPIzS5NidX4B4gRLldqG0zw3oybwDsNC7i5htkXu1ToLhnu5PmIiDyUoF00RIh83aFQ" -->
            data-amount="<%=grandTotal * 100%>"
            data-name="Art-Shop"
            data-description="Continue with your payment"
            data-image="https://example.com/logo.png"
            data-currency="inr">
        </script>
    </form>


<!--
way 2

<form action="success.jsp" method="POST">
    <input type="hidden" name="grandTotal" value="<%=grandTotal%>">
    <script
        src="https://checkout.stripe.com/checkout.js"
        class="stripe-button"
        data-key="pk_test_51P7hlRSIE4KEYpsD8f1w15ofoyxvpp8GPIzS5NidX4B4gRLldqG0zw3oybwDsNC7i5htkXu1ToLhnu5PmIiDyUoF00RIh83aFQ"
        data-amount="<%=grandTotal * 100%>"
        data-name="Art-Shop"
        data-description="A description of the payment"
        data-image="https://example.com/logo.png"
        data-currency="inr">
    </script>
</form>-->
    </div>

</body>
</html>