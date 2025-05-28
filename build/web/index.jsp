<%-- 
    Document   : index
    Created on : 29-Mar-2024, 6:26:24 pm
    Author     : Rahul
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!--<link rel="stylesheet" href="css/style.css">-->

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

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






      
.body {
  
    display: flex;
    justify-content: center;
    align-items: center;
    height: 65vh;
    background-color: #f0f0f0;
    margin-bottom: 40px;
}

.slider {
    width: 100%;
    height: 100%;
    overflow: hidden;
    position: relative;
}

.slide {
    width: 100%;
    height: 100%;
    position: absolute;
    opacity: 0;
    transition: opacity 1s ease-in-out;
}

.slide img {
    width:  100%;
    height: 65vh;
    /* object-fit: cover; */
}

.slide:first-child {
    opacity: 1;
}


.slider-nav {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.slider-nav button {
    margin: 0 10px;
    padding: 10px 20px;
    cursor: pointer;
}

/* style.css */
/* Add your existing styles here */

.arrow-left, .arrow-right {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    font-size: 2rem;
    color: #fff;
    cursor: pointer;
    z-index: 1;
}

.arrow-left {
    left: 10px;
}

.arrow-right {
    right: 10px;
}
/* Add this to your existing CSS */




  
  
.swiper-slide img{
    width: 100%;
    height: 60vh;
}




        .categories {
            text-align: center;
            margin: 20px auto;
        }
        
        .category {
            display: inline-block;
            margin: 40px;
            max-width: 300px; /* Set maximum width for responsiveness */
        }
        
        .category img {
            width: 70%;
            height: 70%;
            border-radius: 50%;
        }
        
        .a {
            margin-top: -50px;
        }
        
        .category h3 {
            margin-top: 10px;
        }
        
        @media only screen and (max-width: 600px) {
            .category {
                width: 90%; /* Adjust width for smaller screens */
            }
        }
        
        @media only screen and (max-width: 300px) {
            .category {
                width: 100%; /* Make categories take full width on very small screens */
                margin: 20px 0; /* Adjust margin for better spacing */
            }
            
            .category img {
                width: 100%; /* Make images take full width */
                height: auto; /* Adjust height automatically */
            }
            
            .categories h2 {
                font-size: 1.5em; /* Adjust font size for better readability */
            }
        }
        
        h2 {
            margin-bottom: -10px;
        }


/* ========================Cateogery Religious======================== */

.b {
    display: flex;
    justify-content: center;
    align-items: center;
    /* height: 100vh; */
    margin: 0;
    overflow-x: hidden; /* Remove horizontal scrollbar */
}

.category-container {
    display: flex;
    overflow-x: hidden;
    width: 100%;
    white-space: nowrap;
   margin-left: 22px;
   
}

.category-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 10px;
    margin-right: 15px;
    cursor: pointer;
    flex: 0 0 auto;
    transition: transform 0.1s ease;
    
}

.category-item img {
    width: 300px; /* Adjusted to fill the width of the category item */
    height: 300px; /* Adjusted to maintain aspect ratio */
    margin-bottom: 5px;
    margin-right: 26px;
    /* margin-left: 3px; */
    /* justify-content: space-evenly; */
}

@media screen and (max-width: 992px) {
    .category-item {
        margin-right: 10px;
    }
}

@media screen and (max-width: 576px) {
    .category-item {
        margin-right: 5px;
    }
}

.arrow-button {
    position: scroll;
    top: 50%;
    transform: translateY(-50%);
    background-color: #f1f1f1;
    border: none;
    cursor: pointer;
    padding: 10px;
}

.arrow-button.left {
    left: 10px;
}

.arrow-button.right {
    right: 10px;
}
/* ========================Cateogery Religious End======================== */

/* .c {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            margin: 20px;
            position: relative;
        }

        .category-contain {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            width: 100%;
            padding: 0 10px;
        }

        .category-it {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 10px;
            margin: 5px;
            cursor: pointer;
            flex: 1 1 calc(25% - 20px); /* Adjusted to 4 items per row */
            /* max-width: calc(25% - 20px); /* Adjusted to 4 items per row */
            /* box-sizing: border-box;
            transition: transform 0.1s ease;
        }

        .category-it img {
            max-width: 100%; /* Adjusted to be responsive */
            /* height: auto; /* Adjusted to be responsive */
            /* margin-bottom: 5px;
        } */ 

        /* @media screen and (max-width: 1024px) {
            .category-it {
                flex: 1 1 calc(33.333% - 20px); /* Adjusted to 3 items per row */
                /* max-width: calc(33.333% - 20px); /* Adjusted to 3 items per row */
            /* }
        }

        @media screen and (max-width: 768px) {
            .category-it {
                flex: 1 1 calc(50% - 20px); /* Adjusted to 2 items per row */
                /* max-width: calc(50% - 20px); /* Adjusted to 2 items per row */
            /* }
        } */

        /* @media screen and (max-width: 480px) {
            .category-it {
                flex: 1 1 calc(100% - 20px); /* Adjusted to 1 item per row */
                /* max-width: calc(100% - 20px); /* Adjusted to 1 item per row */
            /* }
        } */ 




            
            
            
            
            
            
            
            
            
        .c {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            margin: 20px;
            position: relative;
        }

        .category-contain {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-evenly;
            width: 100%;
            padding: 0 10px;
           
        }

        .category-it {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 10px;
            margin: 5px;
            cursor: pointer;
            flex: 1 1 calc(25% - 20px); /* Adjusted to 4 items per row */
            max-width: calc(25% - 20px); /* Adjusted to 4 items per row */
            box-sizing: border-box;
            transition: transform 0.1s ease;
        }

        /* .category-it img {
            max-width: 100%; /* Adjusted to be responsive */
            /* height: auto; /* Adjusted to be responsive */
            /* margin-bottom: 5px;
        } */ 

        .category-it img {
            max-width: 95%; /* Adjusted to be responsive */
            height: auto; /* Adjusted to be responsive */
            margin-bottom: 5px;
            /* margin-right: 26px; */

        }

        @media screen and (max-width: 1024px) {
            
            .category-it {
                flex: 1 1 calc(33.333% - 20px); /* Adjusted to 3 items per row */
                max-width: calc(33.333% - 20px); /* Adjusted to 3 items per row */
            }
        }

        @media screen and (max-width: 768px) {
            .category-it {
                flex: 1 1 calc(50% - 20px); /* Adjusted to 2 items per row */
                max-width: calc(50% - 20px); /* Adjusted to 2 items per row */
            }
        }

        @media screen and (max-width: 480px) {
            .category-it {
                flex: 1 1 calc(100% - 20px); /* Adjusted to 1 item per row */
                max-width: calc(100% - 20px); /* Adjusted to 1 item per row */
            }
        }


        /* <!-- ============sell banner Start============== --> */

        
  .image-con {
    position: relative;
    width: 92%;
    box-sizing: border-box;
    margin-left : 50px;
    margin-right: 10px;
/*    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);*/
     /* Adjust the height as needed */
}

.image-con img {
    width: 100%;
    height: 450px;
    
    
    /* object-fit: cover; /* This will ensure the image covers the entire container */
} 

.text-content {
    position: absolute;
    top: 41%; /* Center vertically */
    left: 10%; /* Adjust the left margin as needed */
    transform: translateY(-50%); /* Center vertically */
    color: rgb(17, 0, 0); /* Adjust the text color as needed */
}

.text-content h1 {
    font-size: 2em; /* Adjust the font size as needed */
    margin-bottom: 10px; /* Adjust the space between heading and paragraph */
}

.text-content p {
    font-size: 1em; /* Adjust the font size as needed */
}


.cta-button {
  background-color: #007BFF; /* Button background color */
  color: white; /* Button text color */
  border: none; /* Remove default button border */
  padding: 10px 20px; /* Button padding */
  font-size: 1em; /* Button font size */
  cursor: pointer; /* Change cursor to pointer on hover */
  margin-top: 20px; /* Space above the button */
}

.cta-button:hover {
  background-color: #0056b3; /* Darken button background on hover */
}


  @media screen and (max-width: 1024px) {
            
            .image-con { 
                margin: auto;
        }
  }
/* <!-- ============sell banner End============== --> */


 .ccc {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            margin: 20px;
            position: relative;
        }

.category-c {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-evenly;
                width: 100%;
                padding: 0 10px;
/*                 display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;*/
            }

            .category-itt {
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 10px;
                margin: 5px;
                cursor: pointer;
                flex: 1 1 calc(25% - 20px); /* Adjusted to 4 items per row */
                max-width: calc(25% - 20px); /* Adjusted to 4 items per row */
                box-sizing: border-box;
                transition: transform 0.1s ease;
            }

            .category-itt img {
                max-width: 93%; /* Adjusted to be responsive */
                height: auto; /* Adjusted to be responsive */
                margin-bottom: 5px;
            }

            @media screen and (max-width: 1024px) {
                .category-itt {
                    flex: 1 1 calc(33.333% - 20px); /* Adjusted to 3 items per row */
                    max-width: calc(33.333% - 20px); /* Adjusted to 3 items per row */
                }
            }

            @media screen and (max-width: 768px) {
                .category-itt {
                    flex: 1 1 calc(50% - 20px); /* Adjusted to 2 items per row */
                    max-width: calc(50% - 20px); /* Adjusted to 2 items per row */
                }
            }

            @media screen and (max-width: 480px) {
                .category-itt {
                    flex: 1 1 calc(100% - 20px); /* Adjusted to 1 item per row */
                    max-width: calc(100% - 20px); /* Adjusted to 1 item per row */
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

    
 
    <div class="body">
    <div class="slider">
        <div class="arrow-left" id="prev">&#10094;</div>
        <div class="slide">
            <img src="images/WhatsApp Image 2024-02-24 at 6.34.38 PM (1).jpeg" alt="Image 1">
        </div>
        <div class="slide">
            <img src="images/WhatsApp Image 2024-02-24 at 6.34.39 PM (1).jpeg" alt="Image 2">
        </div>
        <div class="slide">
            <img src="images/WhatsApp Image 2024-02-24 at 6.34.39 PM.jpeg" alt="Image 3">
        </div>
        <div class="arrow-right" id="next">&#10095;</div>
    </div>
</div>
    
  
<!----------------Slider End------------------>



 <main class="main">
    <section class="categories">
        <h2>Shop by Category</h2>
        <div class="category">
            <a href="nature.jsp" style=" text-decoration: none;"><img src="images/q.jpg" alt="Krishna"></a>
            <span><a href="nature.jsp" style=" text-decoration: none; color: black;"><h3>Nature Paintings</h3></a></span>

        </div>
        <div class="category">
            <a href="flower.jsp" style=" text-decoration: none;"><img src="images/nn.webp" alt="Krishna"></a>
            <span><a href="flower.jsp" style=" text-decoration: none; color: black;"><h3>Flower Paintings</h3></a></span>
           
            
        </div>
        <div class="category">
             <a href="abstract.jsp" style=" text-decoration: none;"><img src="images/aa.jpg" alt="Krishna"></a>
            <span><a href="abstract.jsp" style=" text-decoration: none; color: black;"><h3>Abstract Paintings</h3></a></span>
           
        </div>
        <section class="a">
            <div class="category">
                 <a href="canvas.jsp" style=" text-decoration: none;"><img src="images/Walking in Park Relaxing Big Panoramic canvas wall painting.webp" alt="Krishna"></a>
            <span><a href="canvas.jsp" style=" text-decoration: none; color: black;"><h3>Canvas Paintings</h3></a></span>

            </div>
            <div class="category">
                  <a href="watercolour.jsp" style=" text-decoration: none;"><img src="images/www.webp"></a>
            <span><a href="watercolour.jsp" style=" text-decoration: none; color: black;"><h3>Water colour Paintings</h3></a></span>
             
            </div>
        </section>
    </section>
</main>


<!----------------Category End------------------>





    

<!-- ------------------Religious Category-------------------->
<h2 style="margin-bottom: 30px; text-align: center;">Shop by Religious Categories</h2>
<div class="b">
    <button class="arrow-button left" style="background-color: #ddd; color: #111">←</button>
    <div class="category-container">
        <div class="category-item">
             <a href="shiva.jsp" style=" text-decoration: none;"><img src="images/15.webp" alt="Krishna"></a>
            <span><a href="shiva.jsp" style=" text-decoration: none; color: black;">Shiva</a></span>
            <!--<img src="images/15.webp" alt="Christian">-->
            <!--<span>Shiva</span>-->
        </div>
        <div class="category-item">
            <a href="krishna.jsp" style=" text-decoration: none;"><img src="images/42.jpg" alt="Krishna"></a>
            <span><a href="krishna.jsp" style=" text-decoration: none; color: black;">Krishna</a></span>
            
        </div>
        <div class="category-item">
             <a href="Hanuman_Paintings.jsp" style=" text-decoration: none;"><img src="images/43.webp" alt="Hanuman"></a>
            <span><a href="Hanuman_Paintings.jsp" style=" text-decoration: none; color: black;">Hanuman</a></span>
           
        </div>
        <div class="category-item">
            <a href="ganesh.jsp" style=" text-decoration: none;"><img src="images/23.webp" alt="Ganesha"></a>
            <span><a href="ganesh.jsp" style=" text-decoration: none; color: black;">Ganesha</a></span>
           
        </div>
        <div class="category-item">
            <a href="Maa_Durga.jsp" style=" text-decoration: none;"><img src="images/21.webp" alt="Durga"></a>
            <span><a href="Maa_Durga.jsp" style=" text-decoration: none; color: black;">Durga</a></span>
            
        </div>
        <div class="category-item">
             <a href="saraswati.jsp" style=" text-decoration: none;"><img src="images/25.jpg" alt="Saraswati"></a>
            <span><a href="saraswati.jsp" style=" text-decoration: none; color: black;">Saraswati</a></span>
          
        </div>
        <!-- Add more categories as needed -->
    </div>
    <button class="arrow-button right" style="background-color: #ddd; color: #111">→</button>

</div>
<!-- ------------End----------------- -->


    
   













<!------------------Room Category---------------->
   
<h2 style="margin-bottom: 30px; margin-top: 30px; text-align: center;">Shop Painting by Rooms</h2>
<div class="c">
    
    <div class="category-contain">
        <!-- Your category items here -->
        <div class="category-it">
             <a href="bedroom.jsp" style=" text-decoration: none;"><img src="images/bi.webp" alt="Saraswati"></a>
            <span><a href="bedroom.jsp" style=" text-decoration: none; color: black;">Bed room</a></span>
<!--            <img src="images/bi.webp" alt="Christian">
            <span>Bed room</span>-->
        </div>
        <div class="category-it">
             <a href="Livingroom.jsp" style=" text-decoration: none;"><img src="images/li1.jpg" alt="Saraswati"></a>
            <span><a href="Livingroom.jsp" style=" text-decoration: none; color: black;">Living room</a></span>
<!--            <img src="images/li1.jpg" alt="Christian">
            <span>Living room</span>-->
        </div>
        <div class="category-it">
            <a href="dinningroom.jsp" style=" text-decoration: none;"><img src="images/di2.webp" alt="Saraswati"></a>
            <span><a href="dinningroom.jsp" style=" text-decoration: none; color: black;">Dinning room</a></span>
<!--            <img src="images/di2.webp" alt="Christian">
            <span>Dinning room</span>-->
        </div>
        <div class="category-it">
            <a href="study_room.jsp" style=" text-decoration: none;"><img src="images/ho.jpg" alt="Saraswati"></a>
            <span><a href="study_room.jsp" style=" text-decoration: none; color: black;">Study room</a></span>
<!--            <img src="images/ho.jpg" alt="Islamic">
            <span>Study room</span>-->
        </div>
    </div>
</div>



<!-- ============sell banner Start============== -->
<div class="image-con">
    <img src="images/img/333333.jpg" alt="Background Image">
    <div class="text-content">
        <h1>Sell Your Paintings Online</h1>
        <p>Discover the joy of selling your artwork online. Connect with collectors and art enthusiasts worldwide.</p>
        <button class="cta-button" onclick="fun()">Start Selling</button> <!-- Added button -->
    </div>
  </div>


<!-- ============sell banner End============== -->

<!-- --------------By price--------------- -->

<h2 style="margin-bottom: 30px; margin-top: 30px; text-align: center;">Shop Painting by Price Range</h2>
<div class="c">
    
    <div class="category-contain">
        <!-- Your category items here -->
        <div class="category-it">
             <a href="price1.jsp" style=" text-decoration: none;"><img src="images/100.webp" alt="Saraswati"></a>
            <span><a href="price1.jsp" style=" text-decoration: none; color: black;"><h4>Rs 499 - Rs 999</h4></a></span>
           
        </div>
        <div class="category-it">
             <a href="price2.jsp" style=" text-decoration: none;"><img src="images/500.webp" alt="Saraswati"></a>
            <span><a href="price2.jsp" style=" text-decoration: none; color: black;"><h4>Rs 999 - Rs 1499</h4></a></span>
<!--            <img src="images/500.webp" alt="Christian">
            <span><h4>Rs 999 - Rs 1499</h4></span>-->
        </div>
        <div class="category-it">
            <a href="price3.jsp" style=" text-decoration: none;"><img src="images/400.jpg" alt="Saraswati"></a>
            <span><a href="price3.jsp" style=" text-decoration: none; color: black;"><h4>Rs 1499 - Rs 1999</h4></a></span>
<!--            <img src="images/400.jpg" alt="Christian">
            <span><h4>Rs 1499 - Rs 1999</h4></span>-->
        </div>
        <div class="category-it">
            <a href="price4.jsp" style=" text-decoration: none;"><img src="images/300.webp" alt="Saraswati"></a>
            <span><a href="price4.jsp" style=" text-decoration: none; color: black;"><h4>Rs 1999 - Rs 2999</h4></a></span>
<!--            <img src="images/300.webp" alt="Islamic">
            <span><h4>Rs 1999 - Rs 2999</h4></span>-->
        </div>
    </div>
</div>




<!---------------Artist Section----------------->


<h2 style="margin-bottom: 30px; margin-top: 30px; text-align: center;">Shop Painting by Artist</h2>
<div class="ccc">
<div class="category-c">
    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting","root","passord.9506");
            String sql = "select * from seller limit 4";
            PreparedStatement pst = con.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            // Array to store hyperlinks
            String[] hyperlinks = {"Dlip_Kumar_Paintings.jsp", "Sonika_Agarwal_Paintings.jsp", "Mandar_Painting.jsp", "Sarita_Nakra_Paintings.jsp"};
            int index = 0; // Index to iterate over hyperlinks array
            while(rs.next() && index < hyperlinks.length) { // Ensure we have enough hyperlinks
    %>
                <div class="category-itt">
                    <!-- Use different hyperlink for each image -->
                    <a href="<%=hyperlinks[index]%>" style="text-decoration: none;"><img src="images/<%=rs.getString(2)%>"></a>
                    <span><a href="<%=hyperlinks[index]%>" style="text-decoration: none; color: black;"><%=rs.getString(3)%></a></span>
                </div>
    <%
                index++; // Move to the next hyperlink
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    %>
</div>
</div>
<!---------------Artist Section End----------------->




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

 function fun() {
            // Redirect to edit address page
            window.location.href = "seller login.jsp";
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



     
       
       // --------------slider Start-------------------

  
   // script.js
   document.addEventListener('DOMContentLoaded', function() {
    const slides = document.querySelectorAll('.slide');
    let currentSlide = 0;

    function showSlide(index) {
        slides.forEach((slide, i) => {
            slide.style.opacity = i === index ? '1' : '0';
        });
    }

    // Show the first slide initially
    showSlide(currentSlide);

    // Event listeners for arrow keys
    document.addEventListener('keydown', function(event) {
        if (event.key === 'ArrowLeft') {
            currentSlide = (currentSlide - 1 + slides.length) % slides.length; // Loop back to the last slide
            showSlide(currentSlide);
        } else if (event.key === 'ArrowRight') {
            currentSlide = (currentSlide + 1) % slides.length; // Loop to the first slide
            showSlide(currentSlide);
        }
    });

    // Event listeners for arrow icons
    document.getElementById('prev').addEventListener('click', function() {
        currentSlide = (currentSlide - 1 + slides.length) % slides.length; // Loop back to the last slide
        showSlide(currentSlide);
    });

    document.getElementById('next').addEventListener('click', function() {
        currentSlide = (currentSlide + 1) % slides.length; // Loop to the first slide
        showSlide(currentSlide);
    });
});

// --------------slider End-------------------





// --------------menu bar-------------------

document.addEventListener('DOMContentLoaded', function() {
    const hamburgerMenu = document.querySelector('.hamburger-menu');
    const navLinks = document.querySelector('.nav-links');

    hamburgerMenu.addEventListener('click', function() {
        navLinks.classList.toggle('show');
    });
});




// ===========Religious Category==============



document.addEventListener('DOMContentLoaded', function() {
    const container = document.querySelector('.category-container');
    const leftArrow = document.querySelector('.arrow-button.left');
    const rightArrow = document.querySelector('.arrow-button.right');
    const categoryItems = document.querySelectorAll('.category-item');
    const itemWidth = categoryItems[0].offsetWidth + 20; // Width of one item with margin

    let currentIndex = 0;

    leftArrow.addEventListener('click', function() {
        if (currentIndex > 0) {
            currentIndex--;
            smoothScroll(currentIndex * itemWidth, 500); // 500ms duration
        }
    });

    rightArrow.addEventListener('click', function() {
        if (currentIndex < categoryItems.length - 1) {
            currentIndex++;
            smoothScroll(currentIndex * itemWidth, 500); // 500ms duration
        }
    });

    // Smooth scrolling function
    function smoothScroll(target, duration) {
        const start = container.scrollLeft;
        const change = target - start;
        let startTime = null;

        function animateScroll(currentTime) {
            if (!startTime) startTime = currentTime;
            const elapsed = currentTime - startTime;
            const progress = Math.min(elapsed / duration, 1);
            container.scrollLeft = start + change * progress;
            if (progress < 1) {
                window.requestAnimationFrame(animateScroll);
            }
        }

        window.requestAnimationFrame(animateScroll);
    }
});

// ===========Religious Category==============
 
       
    
    
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