
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
      margin-right: 20px;
    }

    #edit-profile-btn:hover {
      background-color: #555;
    }

  
  

   .box {
      background-color: #e9ecef;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      padding: 20px;
      text-align: center;
      border-radius: 5px;
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #dad9d9;
             /*border-bottom: 1px solid #e3e3e3;*/
        }
        th {
            background-color:  #dedcdc;
            font-weight: bold;
            text-transform: uppercase;
            font-size: 14px;
            color: #666;
        }
        tr:hover {
            background-color: #e8e5e5;
        }
        /* Style for the remove icon */
        .remove-icon {
            color: #e74c3c;
            cursor: pointer;
        }
        .remove-icon:hover {
            color: #c0392b;
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
        <h1>View All Customer</h1>
        <li><a href="logout.jsp" id="edit-profile-btn"style="text-decoration:none;"> Logout </a></li>
      </header>

        
      <!-- Dashboard Boxes -->
      <div class="contain">
       
        <table id="userTable">
            <tr>
                <th>User ID</th>
                <th>Name</th>
                <th>Date of Birth</th>
                <th>Age</th>
                <th>Email</th>
                <th>Mobile no</th>
                <th>State</th>
                <th>City</th>
                <th>Action</th>
            </tr>
            <% 
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting","root","passord.9506");
                String sql= "select cust_id, customer_name, email, mobile_no, state, city, address, pincode from customer";
                PreparedStatement pst = con.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                        int cust_id = rs.getInt("cust_id");
               // out.println(customerId);
        %>
        
               <input type="hidden" id="customerIdInput" value="<%= cust_id %>">
        <%
              session.setAttribute("cust_id", cust_id); // Set the customer ID in the session
        %>
            
           
            <tr>
                <td><%= rs.getString(1) %></td>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(4) %></td>
                <td><%= rs.getString(5) %></td>
                <td><%= rs.getString(6) %></td>
                <td><%= rs.getString(7) %></td>
                <td><%= rs.getString(8) %></td>
                <!-- Add remove icon -->
                <td><i class="fas fa-trash-alt remove-icon" onclick="deleteRow('<%= rs.getString(1) %>')"></i></td>
            </tr>
            <% 
                }
                con.close();
            } catch(Exception e) {
                // Handle exception
            }
            %>
        </table>
    </div>
     
    </main>
  </div>

  <script>
        function deleteRow(cust_id) {
            if (confirm("Are you sure you want to delete this user?")) {
                window.location.href = "Admin_delete_customer.jsp?cust_id=" + cust_id;
            }
        }
    </script>
</body>
</html>
