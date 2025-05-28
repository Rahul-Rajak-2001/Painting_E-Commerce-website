

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <style>
    /* General Styles */
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f9f9f9;
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
      background-color: #fff;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 12px;
      margin-top: -5px;
    }

    #edit-profile-btn {
      background-color: #333;
      color: #fff;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    #edit-profile-btn:hover {
      background-color: #555;
    }

    /* Dashboard Boxes Styles */
  
   
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

    
    h3 {
      margin-top: 7px;
      margin-bottom: -7px;
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
</head>
<body>
  <div class="container">
    <aside class="sidebar">
      <div class="user-info">
        <img src="images/photo-1633332755192-727a05c4013d.avif" alt="Admin Image">
        <h3 id="username">Manish Kartik</h3>
      </div>
      <nav>
        <ul>
          <li><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
          <li><a href="admin-view_all_customers.jsp"> <i class="fas fa-users"></i> View Customers</a></li>
          <li><a href="admin-view_all_seller.jsp"><i class="fas fa-store"></i> View Sellers</a></li>
          <li><a href="admin-view_all_paintings.jsp"><i class="fas fa-palette"></i> View Paintings</a></li>
          <li><a href="customer_message.jsp"><i class="fas fa-comments"></i> Message with customer</a></li>
          <li><a href="sellerMessages.jsp"><i class="fas fa-comments"></i> Message with Seller</a></li>
          <li><a href="admin-view-all-order.jsp"><i class="fas fa-comments"></i>View All Orders</a></li>
        </ul>
      </nav>
    </aside>
    <main>
      <header>
        <h1>View All Orders</h1>
<!--        <button id="edit-profile-btn">Logout</button>-->
        <!--<li><a href="admin-login.jsp" id="edit-profile-btn"style="text-decoration:none;"> Logout </a></li>-->
         <li><a href="logout.jsp" id="edit-profile-btn"style="text-decoration:none;"> Logout </a></li>
      </header>
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
    

      <!-- Dashboard Boxes -->
     
    </main>
  </div>
        <script>
        function fetchOrders() {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "fetch_orders.jsp", true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById("ordersTableBody").innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }

        function updateStatus(orderId) {
            var status = document.getElementById("status_" + orderId).value;
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "update_status.jsp", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    fetchOrders(); // Refresh the orders table after updating
                }
            };
            xhr.send("orderId=" + orderId + "&status=" + status);
        }

        setInterval(fetchOrders, 3000); // Fetch orders every 10 seconds
        window.onload = fetchOrders;
    </script>
</body>
</html>


