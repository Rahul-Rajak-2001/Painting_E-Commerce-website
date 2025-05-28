


















<%@page import="java.sql.*" %>

            <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
       
    
        
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
            color: #444;
        }
        
        
        
    
    /* Main Content Styles */
    main {
      flex: 1;
      padding: 20px;
      background-color: #fff;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 20px;
    }

    #edit-profile-btn {
      background-color: #333;
      color: #fff;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s;
      margin-right: 35px;
    }

    #edit-profile-btn:hover {
      background-color: #555;
    }

  
  

        
        
        
        
        
        
        
        
        
        
        
        
        .contain {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
            margin: 30px auto;
        }
    
        
        
        
          .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin-top: 20px;
            margin-bottom: 20px;
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

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        /*==============================================================*/
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
            color: #444;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 10px;
        }

        .add-to-cart-btn {
            background-color: #333;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .add-to-cart-btn:hover {
            background-color: #555;
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
     
    
  <div class="container">
  
      
      
      
      
      <header>
        <h1>View All Paintings </h1>
        <button id="edit-profile-btn" onclick="history.back()"> Back</button>
<!--        <button class="edit-profile-btn"><a href="#"  onclick="history.back()">Back</a></button>-->
      </header>

        
        
        
        <div class="product-container">
        <% 
           String sellerId = request.getParameter("seller_id");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting","root","passord.9506");
                String sql = "select * from painting where seller_id = ?";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setString(1, sellerId);
                ResultSet rs = pst.executeQuery();
                while(rs.next()) {
                            int painting_id = rs.getInt("painting_id");
               // out.println(customerId);
        %>
        
               <input type="hidden" id="customerIdInput" value="<%= painting_id %>">
        <%
              session.setAttribute("painting_id", painting_id); // Set the customer ID in the session
        %>
                    <div class="product-card">
                        
                        
                        <!-- Product image -->
                       
                            <img src="images/<%=rs.getString(4)%>" alt="<%=rs.getString(3)%>">
                        
                        <!-- Product details -->
                        <div class="product-details">
                            
                            
                           
                            
                            
                            
                            
                            <!-- Product name -->
                            <div class="product-name">
                                <%=rs.getString(3)%>
                            </div>
                            
                            <div class="product-price">
                               <span> Category : <%=rs.getString(7)%></span>
                            </div>
                            
                            
                            <div class="product-price">
                                <span>Painting ID : <%=rs.getString(1)%></span>
                            </div>
                              
                              <div class="product-price">
                                <span>Qty : <%=rs.getString(5)%></span>
                            </div>
                              
                              
                            
                            <!-- Product price -->
                            <div class="product-price">
                                <span>&#x20b9;<%=rs.getString(6)%></span>
                            </div>
                            
                            
                             
                            <!-- Add to Cart button -->
                            <button class="add-to-cart-btn" onclick="deleteRow('<%= rs.getString(1) %>')">Delete</button>
                        </div>
                    </div>
        <%
               }
                con.close();
            } catch (Exception e) {
               out.println(e);
            }
        %>
    </div>
      <!-- Dashboard Boxes -->
     
    </main>
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
                    alert("Item successfully added to your cart");
                     setTimeout(function() {
                    window.location.reload(); // Refresh the page
                }, 100); // Delay to allow the alert to be closed
            <% 
                
                }
            %>
        }
        
        
        
        
        

// Function to update cart badge
function updateCartBadge() {
    fetch('get_cart_count.jsp')
        .then(response => response.text())
        .then(count => {
            const badge = document.getElementById('cart-badge');
            badge.textContent = count;
            badge.style.display = count > 0 ? 'inline-block' : 'none';
        })
        .catch(error => {
            console.error('Error fetching cart count:', error);
        });
}

// Function to automatically update cart badge
function autoUpdateCartBadge() {
    updateCartBadge(); // Update immediately
    setInterval(updateCartBadge, 1000); // Update every 10 seconds
}

// Call autoUpdateCartBadge function on page load
window.addEventListener('DOMContentLoaded', autoUpdateCartBadge);




//  function deleteRow(painting_id) {
//            if (confirm("Are you sure you want to delete this user?")) {
//                window.location.href = "admin_delete_particular_seller_Paintings.jsp?painting_id=" + painting_id;
//                
//            }
//        }





function deleteRow(painting_id) {
    var sellerId = '<%= request.getParameter("seller_id") %>'; // Get the seller_id from the current request
    if (confirm("Are you sure you want to delete this painting?")) {
        window.location.href = "admin_delete_particular_seller_Paintings.jsp?painting_id=" + painting_id + "&seller_id=" + sellerId;
    }
}
    </script>
</body>
</html>

