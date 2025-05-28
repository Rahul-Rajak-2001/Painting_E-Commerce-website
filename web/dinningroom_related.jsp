

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- ... (same as before) ... -->
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details</title>
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


        
     
      

        h2 {
            text-align: center;
        }

        .product-details-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            margin-top: 20px;
        }

        .product-image-preview {
            width: 50%;
            margin-right: 10px;
            margin-left: 20px;
        }

        .product-image-preview img {
            width: 100%;
            height: 600px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .product-info {
            width: 50%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-left: 10px;
            
            
        }

        .product-info p {
            font-size: 24px;
            margin-bottom: 15px;
           
        }

         .product-info .qty {
            font-size: 24px;
            margin-bottom: 15px;
        }
        
        
        .add-to-cart-btn {
            background-color: #333;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 20px;
            width: 50%;
        }

        .add-to-cart-btn:hover {
            background-color: #555;
        }

        .quantity-container {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }

        .quantity-btn {
            background-color: #444;
            color: white;
            border: none;
            padding: 5px 10px;
            margin: 5px;
            margin-top: -5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .quantity-btn:hover {
            background-color: #444;
        }

        .quantity-input {
            border: 1px solid #ccc;
            padding: 5px 10px;
            width: 45px;
            text-align: center;
            margin-top: -10px;
                
        }

/*        .Product-details{
            
            margin-left: 50px;
            margin-top: 50px;
        }*/
        
        
        .related-products-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .related-product-card {
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

        .related-product-card:hover {
            transform: scale(1.05);
        }

        .related-product-card a {
            width: 100%;
            display: block;
            text-decoration: none;
        }

        .related-product-card a:hover {
            text-decoration: none;
        }

        .related-product-card img {
            width: 100%;
            height: 250px;
        }

        .related-product-card .product-details {
            padding: 15px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 100%;
        }

        .related-product-card .product-name {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: center;
        }

        .related-product-card .product-price {
            font-size: 16px;
            color: #444;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 10px;
        }

        .related-product-card .add-to-cart-btn {
            background-color: #333;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 10px;
        }

        .related-product-card .add-to-cart-btn:hover {
            background-color: #555;
        }

        @media screen and (max-width: 768px) {
            .product-details-container {
                flex-direction: column;
                align-items: center;
            }

            .product-image-preview {
                width: 100%;
                margin-bottom: 20px;
            }

            .product-info {
                width: 100%;
                margin-top: 20px;
            }

            .product-image-preview img {
                height: 300px;
            }

            .product-info p {
                font-size: 18px;
            }

            .related-products-container {
                flex-direction: column;
                align-items: center;
            }

            .related-product-card {
                width: 90%;
                margin: 15px auto;
            }

            .related-product-card img {
                height: 200px;
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
    <%
         String productId = request.getParameter("painting_id");
    int availableQuantity = 0; // Initialize availableQuantity to 0
//        String productId = request.getParameter("painting_id");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting","root","passord.9506");
            String sql = "select * from painting where painting_id = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, productId);
            ResultSet rs = pst.executeQuery();
            if(rs.next()) {
    %>
<!--                <h2><%=rs.getString(3)%></h2>-->
                
                <div class="product-details-container">
                    <!-- Product image preview -->
                    <div class="product-image-preview">
                        <img src="images/<%=rs.getString(4)%>" alt="<%=rs.getString(3)%>">
                    </div>
                    <!-- Product details -->
                    <div class="product-info">
                         <div class="Product-details">
                             <p><strong>Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong>&nbsp;&nbsp;<%=rs.getString(3)%></p>
                        <!--<p class="product-name"><strong>Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong>&nbsp;&nbsp;<%=rs.getString(3)%></p>-->

                             <p><strong>Seller&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong>&nbsp;&nbsp; <a href="seller_products.jsp?seller_id=<%=rs.getString(2)%>" style="text-decoration: none; color: #111"><%=getSellerName(rs.getString(2), con)%></a></p>
                          

                               <p><strong>Price&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong>&nbsp;&nbsp; &#x20b9;<%=rs.getInt(6)%></p>
                       <div class="quantity-container">
    <span class="qty"><strong>Quantity&nbsp;&nbsp;&nbsp;&nbsp;:</strong></span>
    &nbsp;&nbsp;&nbsp;&nbsp;<button class="quantity-btn" onclick="decreaseQuantity()">-</button>
    <input type="number" class="quantity-input" id="quantity" value="1" min="1" max="<%=availableQuantity%>">
    <button class="quantity-btn" onclick="increaseQuantity(<%=availableQuantity%>)">+</button>
    <span id="quantity-message"></span>
</div>
    <% if (rs.getBoolean("is_sold")) { %>
        <script>
            document.getElementById("quantity").disabled = true;
            var quantityBtns = document.getElementsByClassName("quantity-btn");
            for (var i = 0; i < quantityBtns.length; i++) {
                quantityBtns[i].disabled = true;
            }
        </script>
    <% } %>
       <%
    int quantity = rs.getInt("quantity");
    if (quantity == 0) {
%>
    <div class="sold-out">Sold Out</div>
<%
    } else {
%>
    <button class="add-to-cart-btn" onclick="addToCart(<%=rs.getInt(1)%>)">Add to Cart</button>
<%
    }
%>
                        <!--<button class="add-to-cart-btn" onclick="addToCart('<%=rs.getString(1)%>')">Add to Cart</button>-->
                    </div>
                         </div>
                </div>

                <!-- Related Products Section -->
                <h2>Related Paintings</h2>
               <div class="related-products-container">
        <% 
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting","root","passord.9506");
                
                // Fetch related paintings (Shiva paintings)
                String sql1 = "SELECT * FROM painting WHERE category_name = 'Dinning room' LIMIT 4";
                PreparedStatement pst1 = con.prepareStatement(sql1);
                ResultSet relatedRs = pst1.executeQuery();
                while(relatedRs.next()) {
        %>
                    <div class="related-product-card">
                        <a href="dinningroom_related.jsp?painting_id=<%=relatedRs.getString(1)%>" style="text-decoration: none;">
                            <img src="images/<%=relatedRs.getString(4)%>" alt="<%=relatedRs.getString(3)%>">
                        </a>
                        <div class="product-details">
                            <div class="product-name">
                                <%=relatedRs.getString(3)%>
                            </div>
                            <div class="product-price">
                                <span>&#x20b9;<%=relatedRs.getInt(6)%></span>
                            </div>
                                                       <%
    int relatedQuantity = relatedRs.getInt("quantity");
    if (relatedQuantity == 0) {
%>
    <div class="sold-out">Sold Out</div>
<%
    } else {
%>
    <button class="add-to-cart-btn" onclick="addToCart('<%=relatedRs.getString(1)%>')">Add to Cart</button>
<%
    }
%>
<!--                            <button class="add-to-cart-btn" onclick="addToCart('<%=relatedRs.getString(1)%>')">Add to Cart</button>-->
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

    <% 
            }
        } catch (Exception e) {
           System.out.println(e);
        }
    %>

   
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
    
    <!-- In product.jsp -->

   
    
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
                var quantity = document.getElementById("quantity").value;
                window.location.href = "add_to_cart_process.jsp?painting_id=" + productId + "&quantity=" + quantity;
                alert("Item successfully added to your cart");
                setTimeout(function() {
                    window.location.reload(); // Refresh the page
                }, 100); // Delay to allow the alert to be closed
        <% 
            }
        %>
    }
    
    function increaseQuantity() {
        var quantity = document.getElementById("quantity");
        quantity.value = parseInt(quantity.value) + 1;
    }

    function decreaseQuantity() {
        var quantity = document.getElementById("quantity");
        if (parseInt(quantity.value) > 1) {
            quantity.value = parseInt(quantity.value) - 1;
        }
    }
    
    
document.addEventListener('DOMContentLoaded', function() {
    const hamburgerMenu = document.querySelector('.hamburger-menu');
    const navLinks = document.querySelector('.nav-links');

    hamburgerMenu.addEventListener('click', function() {
        navLinks.classList.toggle('show');
    });
});

</script>

    
    
    
    
    
    
    
    
    
    
    
    
    
    
 

    <%!
        String getSellerName(String sellerId, Connection con) {
            String sellerName = "";
            try {
                String sql = "select * from seller where seller_id = ?";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setString(1, sellerId);
                ResultSet rs = pst.executeQuery();
                if(rs.next()) {
                    sellerName = rs.getString("seller_name");
                }
            } catch(Exception e) {
                System.out.println(e);
            }
            return sellerName;
        }
    %>

    
    
    <script>
        

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

    </script>
</body>
</html>

