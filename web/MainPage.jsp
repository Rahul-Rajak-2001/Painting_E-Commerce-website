
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painting Shop</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .product-card {
            width: 300px;
            margin: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            overflow: hidden;
            transition: transform 0.3s ease-in-out;
            background-color: #ffffff;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .product-card:hover {
            transform: scale(1.05);
        }

        .product-card a {
            display: block;
            width: 100%;
        }

        .product-card img {
            width: 100%;
            height: 300px;
        }

        .product-details {
            padding: 15px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 100%;
        }

        .product-name {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: center;
        }

        .product-price {
            font-size: 16px;
            color: #ff4500;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 10px;
        }

        .add-to-cart-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .add-to-cart-btn:hover {
            background-color: #0056b3;
        }

        @media screen and (max-width: 768px) {
            .product-card {
                width: 90%;
                margin: 15px auto;
            }

            .product-card img {
                height: 200px;
            }

            .product-name {
                font-size: 16px;
            }

            .product-price {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <h2>Shop by Room Category</h2>
    <a href="Products.jsp">GOOOOO</a>
    <div class="product-container">
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");
                String sql = "select * from painting";
                PreparedStatement pst = con.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                while(rs.next()) {
        %>
                    <div class="product-card">
                        <!-- Product image -->
                       <a href="product.jsp?painting_id=<%=rs.getInt(1)%>">
                        <img src="images/<%=rs.getString(4)%>" alt="<%=rs.getString(3)%>"> 
                       </a>
                        <!-- Product details -->
                        <div class="product-details">
                            <!-- Product name -->
                            <div class="product-name">
                                <%=rs.getString(3)%>
                            </div>
                            <!-- Product price -->
                            <div class="product-price">
                                <span>&#x20b9;<%=rs.getInt(7)%></span>
                            </div>
                            <!-- Add to Cart button -->
                            <button class="add-to-cart-btn" onclick="addToCart(<%=rs.getInt(1)%>)">Add to Cart</button>
                        </div>
                    </div>
        <%
               }
                con.close();
            } catch (Exception e) {
               System.out.println(e);
            }
        %>
    </div>

   <script>
        function addToCart(productId) {
            <% 
                String sessionEmail = (String) session.getAttribute("email");
                if(sessionEmail == null) {
            %>
                    alert("Please login first");
                    window.location.href = "customer_login.jsp"; // Redirect to login page
            <% 
                } else {
            %>
                    var quantity = 1; // Default quantity is 1 for the main page
                    window.location.href = "add_to_cart_process.jsp?painting_id=" + productId + "&quantity=" + quantity;
            <% 
                }
            %>
        }
    </script>
</body>
</html>