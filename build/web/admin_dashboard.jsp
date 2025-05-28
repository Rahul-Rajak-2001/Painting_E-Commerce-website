








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
    }

    #edit-profile-btn:hover {
      background-color: #555;
    }

    /* Dashboard Boxes Styles */
    .dashboard-boxes {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
      gap: 20px;
      margin-top: 20px;
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

      .dashboard-boxes {
        grid-template-columns: repeat(auto-fill, minmax(100%, 1fr));
      }
    }

    .box i {
      font-size: 30px;
      margin-bottom: -20px;
      color: #333;
    }
    h3 {
      margin-top: 7px;
      margin-bottom: -7px;
    }

    /* p {
      margin-top: 7px;
    } */
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
        <h1>Welcome, <span id="username">Manish Kartik</span></h1>
         <li><a href="logout.jsp" id="edit-profile-btn"style="text-decoration:none;"> Logout </a></li>
      </header>

  
      <%
        // Database connection details
     
        int totalCustomers = 0;
        int totalSellers = 0;
        int totalPaintings = 0;
        int totalSales = 0;

        try {
          Class.forName("com.mysql.cj.jdbc.Driver");
        Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");

          // Fetch total customers
          Statement stmt = con.createStatement();
          ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM customer");
          if (rs.next()) {
            totalCustomers = rs.getInt(1);
          }

          // Fetch total sellers
          rs = stmt.executeQuery("SELECT COUNT(*) FROM seller");
          if (rs.next()) {
            totalSellers = rs.getInt(1);
          }

          // Fetch total paintings
          rs = stmt.executeQuery("SELECT COUNT(*) FROM painting");
          if (rs.next()) {
            totalPaintings = rs.getInt(1);
          }

          // Fetch total sales
          rs = stmt.executeQuery("SELECT SUM(amount) FROM payment");
          if (rs.next()) {
            totalSales = rs.getInt(1);
          }

          con.close();
        } catch (Exception e) {
          e.printStackTrace();
        }
      %>

      <!-- Dashboard Boxes -->
      <section class="dashboard-boxes">
        <div class="box">
          <i class="fas fa-users"></i>
          <h3>Total Customers</h3>
          <p><%= totalCustomers %></p>
        </div>

        <div class="box">
          <i class="fas fa-store"></i>
          <h3>Total Sellers</h3>
          <p><%= totalSellers %></p>
        </div>

        <div class="box">
          <i class="fas fa-palette"></i>
          <h3>Total Paintings</h3>
          <p><%= totalPaintings %></p>
        </div>

        <div class="box">
          <i class="fas fa-users"></i>
          <h3>Total Sales</h3>
          <p>&#x20b9; <%= totalSales %></p>
        </div>
      </section>
    </main>
  </div>
        <script>
     setTimeout(function() {
                    window.location.reload(); // Refresh the page
                }, 10000);
</script>
</body>
</html>








