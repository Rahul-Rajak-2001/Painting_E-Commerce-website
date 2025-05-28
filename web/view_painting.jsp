   

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
        
        
        
                * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    scroll-behavior: smooth;
  }
  
  /* Basic Styles */
  body {
/*    font-family: Arial, sans-serif;
    background-color: #f4f4f4;*/
     font-family: Arial, sans-serif;
/*            margin: 0;*/
/*            padding: 20px;*/
            background-color: #f4f4f4;
    
  }

/* Sticky navigation */
header {
    position: sticky;
    top: 0;
    z-index: 1000; /* Ensure it appears above other content */
    background-color: #333;
    color: #fff;
    padding: 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
/*    margin-bottom: 10px;*/
  
    
  }
  
  
  .badge-container {
        position: relative;
        display: inline-block;
        margin-left: 5px;
    }

    .badge {
        background-color: #007bff;
        color: white;
        font-size: 0.8em;
        padding: 0.3em 0.5em;
        border-radius: 50%;
        position: absolute;
        top: -8px;
        right: -8px;
        min-width: 18px;
        text-align: center;
        line-height: 1;
        display: none;
    }

    .cart-link {
        position: relative;
        display: inline-block;
        padding-right: 5px; /* Space for the badge */
    }
  
  
  
  
  
  
  
  
  
  
  
  
  header nav ul {
    list-style: none;
  }
  
  header nav ul li {
    display: inline;
    padding: 8px 15px;
    margin: 5px;

  }
  
  header nav ul li a {
    color: #fff;
    text-decoration: none;
    /* margin-right: 20px; */
  }

  header nav ul li:hover {
    background-color: #555;
    transition: all 0.3s linear;
  }
  
  
  
  
  
  
  
  
  
  /* Search bar styles */
.search-form {
    margin-left: 20px;
  }
  
  .search-form input[type="text"] {
    padding: 8px 15px;
    border: 0.5px solid #ccc;
    /* border-radius: 5px; */
    width: 300px;
    height: 35px;
  }
  
  .search-form button {
    padding: 8px 15px;
    /* padding: 8px 15px; */
    background-color: #333;
    color: #fff;
    /* background-color: #411fe9;
    color: #fff; */
    border: none;
    /* border-radius: 5px; */
    cursor: pointer;
    height: 35px;
    margin-left: -4.5px;
  }
  
  .search-form button:hover {
    background-color: #555;
  }
  /* Add this to your existing CSS */


  /* Responsive styles */
@media (max-width: 1109px) {
    header {
        flex-direction: column;
        align-items: center;
    }

    .search-form {
        width: 100%;
        margin-left: 0;
        margin-top: 20px;
    }

    .search-form input[type="text"] {
        width: 100%;
        /* margin-left: 0; */
    }
    
    .search-form button {
    margin-left: 0;
    width: 100%;
    background-color: #555;;
  }
    
    

    nav ul {
        flex-direction: column;
        align-items: center;
    }

    nav ul li {
        margin-bottom: 10px;
    }
}

/* Add this to your existing CSS */

/* Hamburger menu */
/* Hamburger menu */
.hamburger-menu {
    display: none; /* Hide by default */
    flex-direction: column;
    justify-content: space-around;
    width: 2rem;
    height: 2rem;
    cursor: pointer;
}

.hamburger-menu div {
    width: 2rem;
    height: 0.25rem;
    background-color: #fff;
    border-radius: 10px;
    transition: all 0.3s linear;
    position: relative;
    transform-origin: 1px;
}

/* Responsive styles */
@media (max-width: 1248px) {
    header {
        flex-direction: column;
        align-items: center;
    }

    /* .search-form {
        width: 100%;
        margin-left: 0;
        margin-top: 20px;
    }

    .search-form input[type="text"] {
        width: 100%;
    } */
    .search-form {
        width: 100%;
        margin-left: 0;
        margin-top: 20px;
    }

    .search-form input[type="text"] {
        width: 100%;
        /* margin-left: 0; */
    }
    
    .search-form button {
    margin-left: 0;
    width: 100%;
    background-color: #555;;
  }

    nav ul {
        display: none; /* Hide navigation links by default */
    }

    .hamburger-menu {
        display: flex; /* Show hamburger menu on smaller screens */
        position: absolute; /* Position it absolutely */
        top: 20px; /* Adjust the top position as needed */
        right: 20px; /* Adjust the right position as needed */
    }

    .nav-links {
        display: none; /* Hide navigation links by default */
        flex-direction: column;
        align-items: center;
        width: 100%;
        position: absolute; /* Position it absolutely */
        top: 100%; /* Position it below the header */
        right: 0; /* Align it to the right */
        background-color: #333; /* Add a background color */
        padding: 20px; /* Add some padding */
        border-radius: 5px; /* Add some border radius */
        transition: transform 0.3s ease-in-out, opacity 0.3s ease-in-out; /* Add transition for transform and opacity */
    transform: translateY(-100%); /* Hide the nav links by moving them up */
    opacity: 0; /* Make the nav links invisible */
    }

    .nav-links.show {
        display: flex;
        transform: translateY(0); /* Show the nav links by moving them to their original position */
    opacity: 1; /* Make the nav links visible */
    }

    
    .nav-links li {
        margin-bottom: 0px; /* Adjust the bottom margin as needed */
        margin-left: 10px; /* Add left margin to each list item */
        margin-right: 10px; /* Add right margin to each list item */
    }

    .nav-links a {
        padding: 10px 20px; /* Add padding to the links */
        display: block; /* Make the links block elements to ensure they take up the full width */
        text-align: left; /* Align the text to the left */
        font-size: 24px;
    }
}

        
        
        
        
        
        
        
        
        
        
/*        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }*/

        h2 {
            text-align: center;
            margin-bottom: 20px;
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

        .product-quantity{
            font-size: 16px;
            font-weight: 600;
/*             color: dark;*/
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 10px;
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
            margin-left: 100px;
            width: 80px;
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
        
        
        
footer{
    background-color: #333;
}
.footerContainer{
    width: 100%;
    padding: 70px 30px 20px ;
}
.socialIcons{
    display: flex;
    justify-content: center;
}
.socialIcons a{
    text-decoration: none;
    padding:  10px;
    background-color: white;
    margin: 10px;
    border-radius: 50%;
}
.socialIcons a i{
    font-size: 2em;
    color: black;
    opacity: 0,9;
}
/* Hover affect on social media icon */
.socialIcons a:hover{
    background-color: #111;
    transition: 0.5s;
}
.socialIcons a:hover i{
    color: white;
    transition: 0.5s;
}
.footerNav{
    margin: 30px 0;
}
.footerNav ul{
    display: flex;
    justify-content: center;
    list-style-type: none;
}
.footerNav ul li a{
    color:white;
    margin: 20px;
    text-decoration: none;
    font-size: 1.3em;
    opacity: 0.7;
    transition: 0.5s;

}
.footerNav ul li a:hover{
    opacity: 1;
}
.footerBottom{
    background-color: #000;
    padding: 20px;
    text-align: center;
}
.footerBottom p{
    color: white;
}
.designer{
    opacity: 0.7;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: 400;
    margin: 0px 5px;
}
@media (max-width: 700px){
    .footerNav ul{
        flex-direction: column;
    } 
    .footerNav ul li{
        width:100%;
        text-align: center;
        margin: 10px;
    }
    .socialIcons a{
        padding: 8px;
        margin: 4px;
    }
} 
  
.back-btn {
    position: fixed;
    top: 20px;
    right: 20px;
    background-color: #333;
    color: white;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 4px;
    font-size: 16px;
}
.back-btn:hover {
    background-color: #555;
} 

h2{
    margin: 20px;
}
    </style>
</head>
<body>
     <a href="#" class="back-btn" onclick="history.back()">Back</a>
    <h2>View All Paintings</h2>
    <!--<a href="Products.jsp">GOOOOO</a>-->
    <div class="product-container">
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");
                 int sellerId = (Integer) session.getAttribute("sellerId");
                String sql = "select * from painting where seller_id = '"+sellerId+"'";
                PreparedStatement pst = con.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                while(rs.next()) {
                
                int paintingId = rs.getInt("painting_id");
//                out.println(paintingId);
        %>
        
               <input type="hidden" id="customerIdInput" value="<%= paintingId %>">
        <%
              session.setAttribute("paintingId", paintingId); // Set the customer ID in the session
        %>
        <!--<a href="edit_painting.jsp?id=<%= paintingId %>">Edit</a>-->
                    <div class="product-card">
                        <!-- Product image -->
<!--                       <a href="product.jsp?painting_id=<%=rs.getInt(1)%>">-->
                        <img src="images/<%=rs.getString(4)%>" alt="<%=rs.getString(3)%>"> 
<!--                       </a>-->
                        <!-- Product details -->
                        <div class="product-details">
                            <!-- Product name -->
                            <div class="product-name">
                                <%=rs.getString(3)%>
                            </div>
                             <div class="product-quantity">
                                 <span>qty : <%=rs.getInt(5)%></span>
                            </div>
                            
                            
                            
                            <!-- Product price -->
                            <div class="product-price">
                                <span>&#x20b9;<%=rs.getInt(6)%></span>
                            </div>
                            <!-- Add to Cart button -->
                              
                                 <a href="edit_painting.jsp?id=<%= paintingId %>"><button class="add-to-cart-btn">Edit</button></a>
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


 <footer>
    <div class="footerContainer">
        <div class="socialIcons">
            <a href=""><i class="fa-brands fa-facebook"></i></a>
            <a href=""><i class="fa-brands fa-instagram"></i></a>
            <a href=""><i class="fa-brands fa-twitter"></i></a>
            <!--<a href=""><i class="fa-brands fa-google-plus"></i></a>-->
            <a href=""><i class="fa-brands fa-youtube"></i></a>
        </div>
        <div class="footerNav">
            <ul><li><a href="">Home</a></li>
                <li><a href="">Category</a></li>
                <li><a href="">Artist</a></li>
                <li><a href="">Contact Us</a></li>
                <li><a href="admin-login.jsp">Admin</a></li>
            </ul>
        </div>
        
    </div>
    <div class="footerBottom">
        <p>Art-Shop &copy; rahul kumar rajak 2024</p>
    </div>
</footer>
    
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


  
    </script>
    
</body>
</html>
s