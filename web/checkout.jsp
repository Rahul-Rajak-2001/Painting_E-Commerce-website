<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .container {
            max-width: 1200px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 2em;
            color: #333;
            position: relative;
        }
        .back-button {
            position: absolute;
            right: 0;
            top: 50%;
            transform: translateY(-50%);
        }
        h3 {
            margin-bottom: 20px;
            font-size: 1.5em;
            color: #555;
        }
        p {
            margin: 10px 0;
            font-size: 1em;
            color: #777;
        }
        button {
            padding: 10px 20px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #555;
        }
        .cart-item {
            display: flex;
            align-items: center;
            padding: 20px;
            border-bottom: 1px solid #e0e0e0;
        }
        input[type="number"] {
            width: 40px;
            margin-left: 2px;
        }
        .cart-item img {
            width: 120px;
            height: 120px;
            border-radius: 8px;
            margin-right: 20px;
        }
        .cart-item-info {
            flex-grow: 1;
        }
        .cart-item-info h4 {
            margin: 0;
            font-size: 1.2em;
            color: #444;
        }
        .cart-item-info p {
            margin: 10px 0;
            font-size: 1em;
            color: #777;
        }
        @media (max-width: 768px) {
            .cart-item img {
                width: 80px;
                height: 80px;
            }
        }
        @media (max-width: 576px) {
            .cart-item {
                flex-direction: column;
                align-items: flex-start;
            }
            .cart-item img {
                margin-bottom: 15px;
            }
        }
        .payment-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }
        .delivery-details {
             display: flex;
            justify-content: space-between;
            align-items: center;
        }
    </style>
    <!-- Include Stripe Elements JavaScript -->
    <script src="https://js.stripe.com/v3/"></script>
</head>
<body>
    <div class="container">
        <h2>
            Checkout
            <button class="back-button" onclick="goBack()">Back</button>
        </h2>
        
        <!-- Delivery Address -->
        <div class="delivery-details">
            <div>
                <h3>Deliver to:</h3>
                <% 
                    String custEmail = (String) session.getAttribute("email");
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");
                        String getCustomerDetailsSql = "SELECT * FROM customer WHERE email = ?";
                        PreparedStatement getCustDetailsPst = con.prepareStatement(getCustomerDetailsSql);
                        getCustDetailsPst.setString(1, custEmail);
                        ResultSet custDetailsRs = getCustDetailsPst.executeQuery();
                        if(custDetailsRs.next()) {
                %>
                <p>Name: <%= custDetailsRs.getString("customer_name") %></p>
                <p>Address: <%= custDetailsRs.getString("address") %>, <%= custDetailsRs.getString("city") %>, <%= custDetailsRs.getString("state") %> - <%= custDetailsRs.getString("pincode") %></p>
                <p>Mobile No: <%= custDetailsRs.getString("mobile_no") %></p>
                <% 
                        }
                        con.close();
                    } catch (Exception e) {
                       e.printStackTrace();
                    }
                %>
            </div>
            <button onclick="editAddress()">Edit</button>
        </div>

        <!-- Cart Details -->
        <div class="cart-items">
            <% 
                double grandTotal = 0;
                boolean hasAvailableItems = false;
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
//                            grandTotal += total;
                            int paintingId = rs.getInt("painting_id");
                            String checkAvailabilitySql = "SELECT quantity FROM painting WHERE painting_id = ?";
                            PreparedStatement checkAvailabilityPst = con.prepareStatement(checkAvailabilitySql);
                            checkAvailabilityPst.setInt(1, paintingId);
                            ResultSet availabilityRs = checkAvailabilityPst.executeQuery();

                            if (availabilityRs.next() && availabilityRs.getInt("quantity") == 0) {
            %>
                            <!-- Display "This painting is currently unavailable" message -->
            <% } else { hasAvailableItems = true; grandTotal += total; %>
            <div class="cart-item">
                <img src="images/<%=rs.getString("image")%>" alt="<%=rs.getString("painting_name")%>">
                <div class="cart-item-info">
                    <h4><%=rs.getString("painting_name")%></h4>
                   <p>Quantity: <%=rs.getString("quantity")%></p>
                    <p>Total: &#x20b9;<span id="total_<%=rs.getInt("cart_id")%>"><%=total%></span></p>
                </div>
<!--                <div class="cart-item-actions">
                    <button onclick="deleteFromCart(<%=rs.getInt("cart_id")%>)">Remove</button>
                </div>-->
            </div>
            <% } } } else { %>
                        <!-- Customer not found message -->
            <% } con.close(); } catch (Exception e) { System.out.println(e); } %>
        </div>
        
       <div class="payment-section">
    <div class="cart-total">
        Grand Total: <span id="grandTotal">&#x20b9;<%=grandTotal%></span>
    </div>
    <form action="success.jsp" method="POST">
        <input type="hidden" name="grandTotal" value="<%=grandTotal%>">
        <script
            src="https://checkout.stripe.com/checkout.js"
            class="stripe-button"
            data-key="pk_test_51P7hlRSIE4KEYpsD8f1w15ofoyxvpp8GPIzS5NidX4B4gRLldqG0zw3oybwDsNC7i5htkXu1ToLhnu5PmIiDyUoF00RIh83aFQ"
            data-amount="<%=grandTotal * 100%>"
            data-name="Art-Shop"
            data-description="Continue with your payment"
            data-image="images/payment-method.png"
            data-currency="inr">
        </script>
    </form>
</div>
         
    <script>
        function editAddress() {
            // Redirect to edit address page
            window.location.href = "edit_customer_profiile.jsp";
        }
        
        function goBack() {
            // Redirect to previous page
            window.history.back();
        }
        
        function continueShopping() {
            // Redirect to payment page
            window.location.href = "payment.jsp";
        }

        
    </script>
</body>
</html>
