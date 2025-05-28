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
    <title>Painting Shop - Product Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }

        .product-details-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            padding: 20px;
        }

        .product-image {
            width: 50%;
            padding: 20px;
        }

        .product-image img {
            width: 100%;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .product-info {
            width: 50%;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .product-name {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .product-price {
            font-size: 20px;
            color: #ff4500;
            margin-bottom: 20px;
        }

        .product-description {
            font-size: 16px;
            margin-bottom: 20px;
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
    </style>
</head>
<body>
    <div class="product-details-container">
        <%
            int paintingId = Integer.parseInt(request.getParameter("painting_id"));
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "password.9506");
                String sql = "select * from painting where painting_id=?";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setInt(1, paintingId);
                ResultSet rs = pst.executeQuery();
                if(rs.next()) {
        %>
                    <div class="product-image">
                        <img src="images/<%=rs.getString(4)%>" alt=""> 
                    </div>
                    <div class="product-info">
                        <div class="product-name">
                            <%=rs.getString(3)%>
                        </div>
                        <div class="product-price">
                            <span>&#x20b9;<%=rs.getInt(7)%></span>
                        </div>
                        <div class="product-description">
                            <%=rs.getString(5)%>
                        </div>
                        <!-- Add to Cart button -->
                        <button class="add-to-cart-btn" onclick="addToCart(<%=rs.getInt(1)%>)">Add to Cart</button>
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
        var quantity = document.getElementById("quantity_" + productId).value;
        window.location.href = "add_to_cart_process.jsp?painting_id=" + productId + "&quantity=" + quantity;
    }
    </script>
</body>
</html>
