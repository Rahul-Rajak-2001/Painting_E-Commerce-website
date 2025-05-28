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
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        
  
         /* Main CSS styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    scroll-behavior: smooth;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
}

header {
    position: sticky;
    top: 0;
    z-index: 1000;
    background-color: #333;
    color: #fff;
    padding: 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
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
    padding-right: 5px;
}

header nav ul {
    list-style: none;
}

header nav ul li {
    display: inline-block;
    padding: 8px 15px;
    margin: 5px;
    position: relative;
}

header nav ul li a {
    color: #fff;
    text-decoration: none;
}

header nav ul li:hover {
    background-color: #555;
    transition: all 0.3s linear;
}

header nav ul li:hover .dropdown {
    display: block;
}

.dropdown {
    display: none;
    position: absolute;
    background-color: #333;
    top: 100%;
    left: 0;
    width: 200px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}


.dropdow {
    position: absolute;
    background-color: #333;
    top: 100%;
    left: 0;
    width: 200px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    opacity: 0;
    visibility: hidden;
    transition: opacity 0.3s, visibility 0.3s;
}

.dropdown li:hover > .dropdow {
    opacity: 1;
    visibility: visible;
}

.inner-dropdow {
    left: 100%;
    top: 0;
   
}

.inner-dropdow>li {
    
     margin: 0 !important;
}


.dropdown li {
    display: block;
    width: 100%;
}

.cty>li {
    margin: 0 !important;
}

.dropdown a {
    display: block;
    padding: 7px;
    color: #fff;
    text-decoration: none;
}

.search-container {
    position: relative;
    width: 400px;
}

.search-box {
    width: 100%;
    padding: 8px 16px 8px 32px;
    font-size: 16px;
    box-sizing: border-box;
    border: none;
}

.search-box:focus {
    outline: none;
}

.search-icon {
    position: absolute;
    left: 10px;
    top: 50%;
    transform: translateY(-50%);
    color: #888;
}

.suggestions {
    display: none;
    position: absolute;
    background-color: white;
    width: 100%;
    border: 1px solid #ddd;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    z-index: 1;
    box-sizing: border-box;
    color: black;
}

.suggestions div {
    padding: 8px 16px;
    cursor: pointer;
}

.suggestions div:hover {
    background-color: #e9e9e9;
}

.suggestions.show {
    display: block;
}

.hamburger-menu {
            display: none;
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
        



@media (max-width: 1248px) {
    header {
        flex-direction: column;
        align-items: center;
    }

    .search-container {
        width: 100%;
        margin-left: 0;
        margin-top: 20px;
    }

    .search-box {
        width: 100%;
    }

    nav ul {
        display: none;
    }

    .hamburger-menu {
        display: flex;
        position: absolute;
        top: 20px;
        right: 20px;
    }

    .nav-links {
        display: none;
        flex-direction: column;
        align-items: center;
        width: 100%;
        position: absolute;
        top: 100%;
        right: 0;
        background-color: #333;
        padding: 20px;
        border-radius: 5px;
        transition: transform 0.3s ease-in-out, opacity 0.3s ease-in-out;
        transform: translateY(-100%);
        opacity: 0;
    }

    .nav-links.show {
        display: flex;
        transform: translateY(0);
        opacity: 1;
    }

    .nav-links li {
        margin-bottom: 10px;
    }

    .nav-links a {
        padding: 10px 20px;
        display: block;
        text-align: left;
        font-size: 24px;
    }

    .dropdown {
        position: static;
        width: 100%;
    }

    .dropdown a {
        padding: 10px 20px;
    }
    
    
    
    .dropdown {
        position: static;
        display: none;
        width: 100%;
        background-color: #555;
    }

    .dropdown li {
        margin-bottom: 0;
    }

    .dropdown li:hover > .dropdown {
        display: none;
    }

    .dropdown li:hover > .dropdow {
        display: block;
        position: static;
        width: 100%;
        background-color: #666;
    }
}
    
    
    
    
    
    


@media (max-width: 1109px) {
    header {
        flex-direction: column;
        align-items: center;
    }

    .search-container {
        width: 100%;
        margin-left: 0;
        margin-top: 20px;
    }

    .search-box {
        width: 100%;
    }

    nav ul {
        flex-direction: column;
        align-items: center;
    }

    nav ul li {
        margin-bottom: 10px;
    }
    
    .dropdown {
        position: static;
        display: none;
        width: 100%;
        background-color: #555;
    }

    .dropdown li {
        margin-bottom: 0;
    }

    .dropdown li:hover > .dropdown {
        display: none;
    }

    .dropdown li:hover > .dropdow {
        display: block;
        position: static;
        width: 100%;
        background-color: #666;
    }
}

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
/*        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            color: #333;
            */
        
        .container {
            max-width: 1200px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column; 
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 2em;
            color: #333;
        }
        .cart-items {
            border-bottom: 1px solid #e0e0e0;
            padding-bottom: 20px;
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
        .cart-item-actions {
            display: flex;
            align-items: center;
        }
        .cart-item-actions button {
            margin-left: auto;
            padding: 10px 20px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .cart-item-actions button:hover {
            background-color: #555;
        }
        .cart-total {
            margin-top: 30px;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 1.5em;
            flex-wrap: wrap;
        }
        .checkout-btn {
            margin-top: 20px;
            padding: 15px 30px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-left: auto; 
        }
        .checkout-btn:hover {
            background-color: #555;
        }
        .empty-cart {
            text-align: center;
            font-size: 1.5em;
            margin-top: 50px;
            color: #777;
        }

        @media (max-width: 992px) {
            .cart-item img {
                width: 100px;
                height: 100px;
            }
            .cart-item-info h4 {
                font-size: 1.1em;
            }
            .cart-item-info p {
                font-size: 0.9em;
            }
            .cart-total {
                font-size: 1.3em;
                justify-content: space-between;
            }
            .checkout-btn {
                width: auto;
                margin-top: 15px;
                margin-left: auto; 
            }
        }
        @media (max-width: 768px) {
            .cart-item img {
                width: 80px;
                height: 80px;
            }
            .cart-item-actions button {
                padding: 8px 16px;
            }
            .cart-total {
                font-size: 1.3em;
            }
            .checkout-btn {
                width: 100%;
                margin-top: 15px;
                margin-left: 0; 
                order: 2; 
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
            .cart-total {
                font-size: 1em;
            }
        }
        
        
                 
footer {
    background-color: #333;
}
.footerContainer {
    width: 100%;
    padding: 70px 30px 20px;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}
.contactInfo {
    flex-basis: 30%;
    color: white;
    margin-bottom: 30px;
    margin-top: -25px;
}
.contactInfo h3 {
    margin-bottom: 20px;
    font-size: 40px; /* Increased font size */
}
.contactDetails {
    display: flex;
    flex-direction: column;
}
.contactItem {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
}
.contactItem i {
    font-size: 18px;
    margin-right: 10px;
}
.footerLinks {
    flex-basis: 65%;
    display: flex;
    flex-direction: column; /* Changed to column to stack socialIcons and footerNav */
    align-items: flex-start; /* Align items to the start of the container */
}
.socialIcons {
    display: flex;
    justify-content: flex-start; /* Align social icons to the start */
     margin-left: 40px; 
}
.socialIcons a {
    text-decoration: none;
    padding: 10px;
    background-color: white;
    margin: 10px;
    border-radius: 50%;
}
.socialIcons a i {
    font-size: 2em;
    color: black;
    opacity: 0.9;
}
.socialIcons a:hover {
    background-color: #111;
    transition: 0.5s;
}
.socialIcons a:hover i {
    color: white;
    transition: 0.5s;
}
.footerNav {
    margin-top: 25px; /* Added margin to separate from socialIcons */
    display: flex;
    justify-content: flex-start; /* Align navigation links to the start */
    margin-left:-65px;
}
.footerNav ul {
    display: flex;
    justify-content: flex-start; /* Align navigation links to the start */
    list-style-type: none;
}
.footerNav ul li a {
    color: white;
    margin: 20px;
    text-decoration: none;
    font-size: 1.3em;
    opacity: 0.7;
    transition: 0.5s;
}
.footerNav ul li a:hover {
    opacity: 1;
}
.footerBottom {
    background-color: #000;
    padding: 20px;
    text-align: center;
}
.footerBottom p {
    color: white;
}
.designer {
    opacity: 0.7;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: 400;
    margin: 0px 5px;
}
@media (max-width: 768px) {
.footerContainer {
flex-direction: column;
align-items: center;
width: 100%;
}
.contactInfo {
flex-basis: 100%;
text-align: center;
margin-bottom: 30px;
}
.footerLinks {
flex-basis: 100%;
align-items: center;
}
.socialIcons {
justify-content: center;
}
.footerNav ul {
flex-wrap: wrap;
justify-content: center;
}
.footerNav ul li {
margin: 10px;
}
}

@media (max-width: 627px) {
.contactInfo {
margin-top: 0;
}
.contactInfo h3 {
font-size: 30px;
 margin-left: -15px;
}
.contactItem {
/* flex-direction: column; */
align-items: flex-start;
margin-bottom: 15px;
width: 100%;
}
.contactItem i {
margin-right: 0;
margin-bottom: 5px;
}
.footerNav ul {
flex-direction: column;
align-items: center;
margin-left: 40%;
}
.footerNav ul li a {
font-size: 1.1em;
margin: 10px 0;
}
}

@media (max-width: 480px) {
.contactInfo h3 {
font-size: 24px;
}
.socialIcons a {
padding: 6px;
margin: 5px;
}
.socialIcons a i {
font-size: 1.5em;
}
}

@media (max-width: 280px) {
.contactInfo h3 {
font-size: 20px;
}
.contactItem span {
font-size: 14px;
}
.socialIcons a {
padding: 4px;
margin: 3px;
}
.socialIcons a i {
font-size: 1.2em;
}
.footerNav ul li a {
font-size: 1em;
margin: 5px 0;
}
.footerBottom p {
font-size: 14px;
}
}

.sold-out {
    background-color: #ccc;
    color: #fff;
    padding: 10px 15px;
    text-align: center;
}



    </style>
</head>
<body>
    <header>
    <!--<h1><span class ="art">Art </span>Shop</h1>-->
    <h1><i>Art</i> Shop</h1>
 <div class="search-container">
        <i class="fas fa-search search-icon"></i>
        <input type="text" class="search-box" placeholder="Search for a painting..." onfocus="showDefaultSuggestions()" oninput="showSuggestions(this.value)">
        <div class="suggestions"></div>
    </div>
    <nav>
        <div class="hamburger-menu">
            <div></div>
            <div></div>
            <div></div>
        </div>
        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <!--<li><a href="#shop">All Category</a></li>-->
            
           <li>
<a href="#">All Category</a>
<ul class="dropdown cty">
    <li><a href="nature.jsp">Nature</a></li>
      <li><a href="abstract.jsp">Abstract</a></li>
    <li>
        <a href="#">Religious</a>
        <ul class="dropdow inner-dropdow">
            <li><a href="shiva.jsp">Shiva</a></li>
            <li><a href="krishna.jsp">Krishna</a></li>
            <li><a href="Hanuman_Paintings.jsp">Hanuman</a></li>
             <li><a href="ganesh.jsp">Ganesha</a></li>
             <li><a href="Maa_Durga.jsp">Maa Durga</a></li>
             <li><a href="saraswati.jsp">Saraswati Mata</a></li>
        </ul>
    </li>
    <li>
        <a href="flower.jsp">Flower</a>
    </li>
     <li><a href="canvas.jsp">Canvas</a></li>
     
    <li>
        <a href="#">Rooms</a>
        <ul class="dropdow inner-dropdow">
            <li><a href="Livingroom.jsp">Living room</a></li>
            <li><a href="bedroom.jsp">Bed room</a></li>
            <li><a href="dinningroom.jsp">Dinning room</a></li>
            <li><a href="study_room.jsp">Study room</a></li>
        </ul>
    </li>
      <li><a href="watercolour.jsp">Water Colour</a></li>
</ul>
</li>
            
            <li><a href="AllSeller.jsp">Artists</a></li>
            <!--<li><a href="#contact">Contact</a></li>-->
            <li><a href="customer_login.jsp?fromLogin=true"><i class="fa-solid fa-user"></i>&nbsp;Account</a></li>
   
            
       
            
            
            
            
            

     <!--<li><a href="add_to_cart.jsp" class="cart-link"><i class="fa-solid fa-cart-shopping"></i>&nbsp;cart</a></li>-->


    <%
String custEmail = (String) session.getAttribute("email");
//boolean cartNotEmpty = session.getAttribute("cartNotEmpty") != null && (boolean) session.getAttribute("cartNotEmpty");
%>

<!-- Inside the navigation bar -->
<li>
<%
if (custEmail != null) {
   
%>
       


 <a href="add_to_cart.jsp" class="cart-link">
    <i class="fa-solid fa-cart-shopping"></i>&nbsp;cart
    <span class="badge-container">
        <span id="cart-badge" class="badge"></span>
    </span>
</a>


<!--<a href="add_to_cart.jsp"><i class="fa-solid fa-cart-shopping"></i>&nbsp;cart</a>-->
<%
    } 

    
 else {
%>
    <a href="#" onclick="alert('Please login first');"><i class="fa-solid fa-cart-shopping"></i>&nbsp;cart</a>
<%
}
%>
</li>
    

<!-- Inside the navigation menu in index.jsp -->









            <!--<li><a href="add_to_cart.jsp"><i class="fa-solid fa-cart-shopping"></i>&nbsp;cart</a></li>-->
            <li><a href="seller login.jsp">seller</a></li>
        </ul>
    </nav>
</header>
    <div class="container">
        <h2>Shopping Cart</h2>
        <div class="cart-items">
            <% 
//                String custEmail = (String) session.getAttribute("email");
                int custId = 0;
                double grandTotal = 0;
                boolean isEmpty = true;
                  boolean hasAvailableItems = false;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");
                    String getCustomerIdSql = "SELECT cust_id FROM customer WHERE email = ?";
                    PreparedStatement getCustIdPst = con.prepareStatement(getCustomerIdSql);
                    getCustIdPst.setString(1, custEmail);
                    ResultSet custRs = getCustIdPst.executeQuery();
                    if(custRs.next()) {
                        custId = custRs.getInt("cust_id");
                        String sql = "SELECT * FROM cart WHERE cust_id = ?";
                        PreparedStatement pst = con.prepareStatement(sql);
                        pst.setInt(1, custId);
                        ResultSet rs = pst.executeQuery();
                        while(rs.next()) {
                            isEmpty = false;
                            int quantity = rs.getInt("quantity");
                            double total = rs.getDouble("total");
//                            grandTotal += total;
                            



    // Check painting availability
                            int paintingId = rs.getInt("painting_id");
                            String checkAvailabilitySql = "SELECT quantity FROM painting WHERE painting_id = ?";
                            PreparedStatement checkAvailabilityPst = con.prepareStatement(checkAvailabilitySql);
                            checkAvailabilityPst.setInt(1, paintingId);
                            ResultSet availabilityRs = checkAvailabilityPst.executeQuery();

                            if (availabilityRs.next() && availabilityRs.getInt("quantity") == 0) {
                                // Display "This painting is currently unavailable" message
             
            %>
            
             <div class="cart-item">
                <img src="images/<%=rs.getString("image")%>" alt="<%=rs.getString("painting_name")%>">
                <div class="cart-item-info">
                    <h4><%=rs.getString("painting_name")%></h4>
                    <p>Quantity: <input type="number" id="qty_<%=rs.getInt("cart_id")%>" value="<%=quantity%>" min="1" onchange="updateCart(<%=rs.getInt("cart_id")%>)"></p>
                    <p>Total: &#x20b9;<span id="total_<%=rs.getInt("cart_id")%>"><%=total%></span></p>
               
                <!-- Existing cart item code -->
                <p>This painting is currently unavailable</p>
          
                </div>
                  

                <div class="cart-item-actions">
                    <button onclick="deleteFromCart(<%=rs.getInt("cart_id")%>)">Remove</button>
                </div>
            </div>
                      <%
                           
                            } else {
                                hasAvailableItems = true;
                                 grandTotal += total;
            %>
            
            <div class="cart-item">
                <img src="images/<%=rs.getString("image")%>" alt="<%=rs.getString("painting_name")%>">
                <div class="cart-item-info">
                    <h4><%=rs.getString("painting_name")%></h4>
                    <p>Quantity: <input type="number" id="qty_<%=rs.getInt("cart_id")%>" value="<%=quantity%>" min="1" onchange="updateCart(<%=rs.getInt("cart_id")%>)"></p>
                    <p>Total: &#x20b9;<span id="total_<%=rs.getInt("cart_id")%>"><%=total%></span></p>
                </div>
                <div class="cart-item-actions">
                    <button onclick="deleteFromCart(<%=rs.getInt("cart_id")%>)">Remove</button>
                </div>
            </div>
             <%
                 
                            }
                        }
                    } else {
                        // out.println("Customer not found for email: " + custEmail);
                    }
                    con.close();
                } catch (Exception e) {
                   System.out.println(e);
                }
            %>
            <% if (isEmpty) { %>
                <div class="empty-cart">
                    Your cart is empty.
                </div>
            <% } %>
        </div>
      <% if (!isEmpty) { %>
    <% if (hasAvailableItems) { %>
        <div class="cart-total">
            Grand Total: <span id="grandTotal">&#x20b9;<%=grandTotal%></span>
        </div>
        <button onclick="placeOrder()" class="checkout-btn">Checkout</button>
    <% } else { %>
    <button onclick="placeOrder()" class="checkout-btn" disabled>Checkout</button>
    <% } %>
<% } %>
    
    
    
    
    
    </div>
    
    
    
    
    
    
    
    
    
<footer>
    <div class="footerContainer">
        <div class="contactInfo">
            <h3>Contact Us</h3>
            <div class="contactDetails">
                <div class="contactItem">
                    <i class="fa-solid fa-location-dot"></i>
                    <span>Haringhata Farm Kalyani, West Bengal-741249</span>
                </div>
                <div class="contactItem">
                    <i class="fa-solid fa-phone"></i>
                    <span>+91 790 384 7273</span>
                </div>
                <div class="contactItem">
                    <i class="fa-solid fa-envelope"></i>
                    <span><a href="mailto:rahul.raj14092001@gmail.com" style="text-decoration: none; color: white">rahul.raj14092001@gmail.com</a></span>
                </div>
            </div>
        </div>
        
        <div class="footerLinks">
            <div class="socialIcons">
                <a href="https://www.facebook.com/" target="_blank"><i class="fa-brands fa-facebook"></i></a>
                <a href="https://www.instagram.com/" target="_blank"><i class="fa-brands fa-instagram"></i></a>
                <a href="https://x.com/?lang=en" target="_blank"><i class="fa-brands fa-twitter"></i></a>
                <a href="https://www.youtube.com/" target="_blank"><i class="fa-brands fa-youtube"></i></a>
            </div>
            <div class="footerNav">
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="AllSeller.jsp">Artist</a></li>
                    <li><a href="customer_login.jsp">Account</a></li>
                    <li><a href="seller login.jsp">Seller</a></li>
                    <li><a href="admin-login.jsp">Admin</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footerBottom">
        <p>Art-Shop &copy; rahul kumar rajak 2024</p>
    </div>
</footer>

    
    <script>
//        function updateCart(cartId) {
//            var qty = document.getElementById("qty_" + cartId).value;
//            var grandTotal = 0;
//            var cartItems = document.querySelectorAll('.cart-item');
//            cartItems.forEach(function(item) {
//                var price = parseFloat(item.querySelector('.cart-item-info span').innerHTML);
//                var total = qty * price;
//                item.querySelector('.cart-item-info p:nth-child(3) span').innerHTML = total;
//                grandTotal += total;
//            });
//            document.getElementById("grandTotal").innerHTML = grandTotal;
//            window.location.href = "update_cart.jsp?cart_id=" + cartId + "&qty=" + qty;
//        }
//
//        function deleteFromCart(cartId) {
//            if(confirm("Are you sure you want to delete this item?")) {
//                window.location.href = "delete_cart.jsp?cart_id=" + cartId;
//            }
//        }
//
//        function placeOrder() {
//            // Implement order placement logic here
//        }
//        
//        
        
        
        
        
        
        
        
         
        // Function to check session status
        function checkSessionStatus() {
            // Assuming you have set a session variable 'email' when the user logs in
            var userEmail = '<%= session.getAttribute("email") %>';
            
            // Check if the userEmail is null or empty, indicating the session has expired
            if (!userEmail || userEmail.trim() === '') {
                alert("Please login first.");
                // Redirect to the login page or do other necessary actions
                window.location.href = "login.jsp"; // Change to your login page URL
            }
        }

        // Call the function when the page loads
        window.onload = checkSessionStatus;

        // ... existing JavaScript functions ...
   
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
            
    

        function updateCart(cartId) {
    var qty = document.getElementById("qty_" + cartId).value;
    var grandTotal = 0;
    var cartItems = document.querySelectorAll('.cart-item');
    cartItems.forEach(function(item) {
        var price = parseFloat(item.querySelector('.cart-item-info span').innerHTML);
        var total = qty * price;
        item.querySelector('.cart-item-info p:nth-child(3) span').innerHTML = total;
        grandTotal += total;
    });
    document.getElementById("grandTotal").innerHTML = grandTotal;
    window.location.href = "update_cart.jsp?cart_id=" + cartId + "&qty=" + qty;

    // Update cart badge after updating cart
    updateCartBadge();
}

function deleteFromCart(cartId) {
    if(confirm("Are you sure you want to delete this item?")) {
        window.location.href = "delete_cart.jsp?cart_id=" + cartId;

        // Update cart badge after deleting from cart
        updateCartBadge();
    }
}

        
        
        function placeOrder() {
    // Redirect to checkout.jsp
    window.location.href = "checkout.jsp";
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


    const paintings = [
    { name: "Nature Art", url: "nature.jsp" },
    { name: "Flower Art", url: "flower.jsp" },
    { name: "Abstract Art", url: "abstract.jsp" },
    { name: "Canvas", url: "canvas.jsp" },
    { name: "Water colour", url: "watercolour.jsp" },
    { name: "Living room", url: "Livingroom.jsp" },
    
      { name: "Bed room", url: "bedroom.jsp" },
    { name: "Dinning room", url: "dinningroom.jsp" },
    { name: "Study room", url: "study_room.jsp" },
    { name: "krishna", url: "krishna.jsp" },
    { name: "Lord shiva", url: "shiva.jsp" },
    { name: "Hanuman", url: "Hanuman_Paintings.jsp" },
    { name: "Ganesh", url: "ganesh.jsp" },
    { name: "Durga", url: "Maa_Durga.jsp" },
    { name: "Saraswati", url: "saraswati.jsp" },
    
];

const defaultSuggestions = [
  { name: "Nature Art", url: "nature.jsp" },
    { name: "Flower Art", url: "flower.jsp" },
     { name: "Bed room", url: "bedroom.jsp" },
    { name: "Dinning room", url: "dinningroom.jsp" },
   { name: "krishna", url: "krishna.jsp" },
    { name: "Lord shiva", url: "shiva.jsp" },
];

const searchBox = document.querySelector(".search-box");
const suggestionList = document.querySelector(".suggestions");

function showSuggestions(inputValue) {
    suggestionList.innerHTML = "";

    if (inputValue.trim() === "") {
        suggestionList.classList.remove("show");
        return;
    }

    const matchedPaintings = paintings.filter(painting =>
        painting.name.toLowerCase().includes(inputValue.toLowerCase())
    );

    matchedPaintings.forEach(painting => {
        const suggestionItem = document.createElement("div");
        suggestionItem.textContent = painting.name;
        suggestionItem.addEventListener("click", () => {
            window.location.href = painting.url;
        });
        suggestionList.appendChild(suggestionItem);
    });

    suggestionList.classList.add("show");
}

function showDefaultSuggestions() {
    suggestionList.innerHTML = "";

    defaultSuggestions.forEach(painting => {
        const suggestionItem = document.createElement("div");
        suggestionItem.textContent = painting.name;
        suggestionItem.addEventListener("click", () => {
            window.location.href = painting.url;
        });
        suggestionList.appendChild(suggestionItem);
    });

    suggestionList.classList.add("show");
}

searchBox.addEventListener("input", () => {
    showSuggestions(searchBox.value);
});

searchBox.addEventListener("keydown", (event) => {
    if (event.key === "Enter") {
        const searchInput = searchBox.value.trim().toLowerCase();
        const matchedPainting = paintings.find(painting =>
            painting.name.toLowerCase().includes(searchInput)
        );

        if (matchedPainting) {
            window.location.href = matchedPainting.url;
        } else {
            alert("No matching painting found.");
        }
    }
});

document.addEventListener("click", (event) => {
    const isClickInside = searchBox.contains(event.target) || suggestionList.contains(event.target);
    if (!isClickInside) {
        suggestionList.innerHTML = "";
        suggestionList.classList.remove("show");
         searchBox.value = ""; // Clear the search box
    }
});


document.addEventListener('DOMContentLoaded', function() {
    const hamburgerMenu = document.querySelector('.hamburger-menu');
    const navLinks = document.querySelector('.nav-links');

    hamburgerMenu.addEventListener('click', function() {
        navLinks.classList.toggle('show');
    });
});

    </script>
    
    
</body>
</html>
