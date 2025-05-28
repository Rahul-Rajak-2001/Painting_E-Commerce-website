<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Seller Dashboard</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <link rel="stylesheet" href="styles.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
    /* ... (existing styles) ... */
       body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f5f5f5;
    }

    .container {
      display: flex;
      height: 100vh;
    }

    /* Sidebar Styles */
    .sidebar {
      background-color: #333;
      color: #fff;
      width: 250px;
      padding: 20px;
      display: flex;
      flex-direction: column;
    }

    .user-info {
      text-align: center;
      margin-bottom: 30px;
    }

    .user-info img {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      margin-bottom: 10px;
    }

    .sidebar nav ul {
      list-style-type: none;
      padding: 0;
      margin: 0;
    }

    .sidebar nav a {
      display: flex;
      align-items: center;
      color: #fff;
      text-decoration: none;
      padding: 10px;
      transition: background-color 0.3s;
    }

    .sidebar nav a:hover {
      background-color: #555;
    }

    .sidebar nav a i {
      margin-right: 10px;
    }

    /* Main Content Styles */
    main {
      flex: 1;
      padding: 20px;
    }

    header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 20px;
      margin-top: -5px;
    }

    #edit-profile-btn {
      background-color: #333;
      color: #fff;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      cursor: pointer;
    }

    /* Customer Profile Styles */
    .profile-container {
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      padding: 20px;
    }

    .profile-container h1 {
      font-size: 24px;
      margin-bottom: 20px;
    }

    .profile-info {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      grid-gap: 20px;
    }

    .profile-info span {
      font-weight: bold;
    }

    /* Responsive Styles */
    @media (max-width: 768px) {
      .container {
        flex-direction: column;
        height: auto;
      }

      .sidebar {
        width: 100%;
        height: auto;
        flex-direction: row;
        justify-content: space-between;
      }

      .user-info {
        margin-bottom: 0;
      }

      .sidebar nav ul {
        display: flex;
        justify-content: space-around;
        width: 100%;
      }

     
    }
    
/*   
      .contain {
            width: 95%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-top: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
           
        }*/
        h1 {
            
            color: #333;
            margin-left: 33%;
/*            justify-content: center;*/
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        img {
            width: 130px;
            height: 130px;
        }
/*        .responsive-table {
            overflow-x: auto;
        }*/

        .responsive-table {
    overflow-x: auto;
    max-height: 650px; /* Adjust this value as needed */
    overflow-y: auto;
}


    .responsive-table table {
    border-collapse: separate;
    border-spacing: 0;
}

.responsive-table thead {
    position: sticky;
    top: 0;
    background-color: #f2f2f2; /* Match your existing th background color */
    z-index: 1;
}

.responsive-table th {
    background-color: #f2f2f2; /* Match your existing th background color */
}



        
        @media screen and (max-width: 600px) {
            table {
                display: block;
                width: 100%;
            }
            thead, tbody, th, td, tr {
                display: block;
            }
            th {
                text-align: right;
            }
            td {
                text-align: right;
                border: none;
                position: relative;
                padding-left: 50%;
            }
            td:before {
                content: attr(data-label);
                position: absolute;
                left: 0;
                width: 50%;
                padding-left: 15px;
                font-weight: bold;
                text-align: left;
            }
        }
       
        
    
  </style>
  <script>
        // Function to fetch and update the orders table
        function fetchOrders1() {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "fetch_orders1.jsp", true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById("ordersTableBody").innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }

        // Fetch orders every 10 seconds
        setInterval(fetchOrders1, 100);

        // Fetch orders initially when the page loads
        window.onload = fetchOrders1;
    </script>
</head>
<body>
  <div class="container">
    <aside class="sidebar">
      <div class="user-info">
<!--        <i class="fas fa-user-circle"></i>-->
        
        
        <%
    String sessEmail = (String) session.getAttribute("e");
    if (sessEmail == null) {
        // User is not logged in, redirect to the login page
        response.sendRedirect("seller login.jsp");
    } else {
        // User is logged in, display dashboard content
        // Your dashboard content here
%>

<!-- Dashboard content -->


        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
         
          <%
          // Get the customer's email from the session
          String sellerEmail = (String) session.getAttribute("e");

          // Connect to the database and retrieve the customer ID
          try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");

           String sql = "select seller_id,image,seller_name,contact_no,email, state , city, address, pincode from seller where email = ?";
            //String sql = "SELECT cust_id, customer_name, email, mobile_no, state, city, address, pincode FROM customer WHERE email = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, sellerEmail);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
              int sellerId = rs.getInt("seller_id");
        %>
              <!-- Pass the customerId value to JavaScript using a hidden input field -->
              <input type="hidden" id="customerIdInput" value="<%= sellerId %>">
        <%
              session.setAttribute("sellerId", sellerId); // Set the customer ID in the session
        %>
        
        <img src="images/<%=rs.getString("image")%>">
        
              <h3 id="username"><%= rs.getString("seller_name") %></h3>
            </div>
            <nav>
              <ul>
                <li><a href="index.jsp"> Home</a></li>
                 <li><a href="seller dashboard.jsp"> Profile</a></li>
                <li><a href="edit_seller_profiile.jsp"> Edit Profile</a></li>
                <li><a href="AddProduct.jsp">Add Painting</a></li>
                 <li><a href="AddCategory.jsp">Add Category </a></li>
                  <li><a href="view_painting.jsp">View Painting </a></li>
                   <li><a href="Seller-message-admin.jsp">Message</a></li>
                    <li><a href="seller_orders.jsp">View Orders</a></li>
             
              </ul>
            </nav>
          </aside>
          <main>
            <header>
              <h1>View All Orders</h1>
              <!--<button id="edit-profile-btn"> Logout <i class="fa-solid fa-arrow-right-from-bracket"></i></button>-->
               <li><a href="logout.jsp" id="edit-profile-btn"style="text-decoration:none;"> Logout </a></li>
            </header>

<!--           <h1>Admin Orders</h1>-->

<div class="responsive-table">
    <table>
        <thead>
            <tr>
              <th>Order ID</th>
                 <th>Customer ID</th>
                  <th>Painting Image</th>
                
                <th>Painting Name</th>
               
                <th>Painting Price</th>
                <th>Quantity</th>
                <th>Seller Name</th>
                <th>Order Date</th>
                <th>Order Status</th>
            </tr>
        </thead>
        <tbody id="ordersTableBody">
            <!-- Order rows will be dynamically inserted here by fetch_orders.jsp -->
        </tbody>
    </table>
</div>  
          </main>
        <%
            }
          } catch (Exception e) {
            out.println(e);
          }
        %>
        
      <%
    }
%>
      </div>
    </div>

  
  </body>
</html>