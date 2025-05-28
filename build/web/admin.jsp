<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
      overflow-y: auto; 
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
      display: flex;
      flex-direction: column;
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

    /* Chat Container Styles */
    .chat-container {
      flex-grow: 1;
      display: flex;
      flex-direction: column;
      height: 100%;
      border-radius: 5px; /* Rounded corners */
      border: 1px solid #ddd; /* Light border */
      overflow: hidden;
    }

    .messages {
      flex-grow: 1;
      overflow-y: auto;
      padding: 20px;
      display: flex;
      flex-direction: column;
      background-color: #f5f5f5;
    }

    .message {
      margin-bottom: 10px;
      padding: 10px 15px;
      border-radius: 20px;
      max-width: 70%;
      word-wrap: break-word;
    }

    .customer-message {
      background-color: #007bff;
      color: #fff;
      align-self: flex-start;
    }

    .admin-message {
      background-color: #28a745;
      color: #fff;
      align-self: flex-end;
    }

    .input-container {
      display: flex;
      padding: 10px;
      background-color: #f8f9fa;
      align-items: center;
      border-top: 1px solid #ddd; /* Light border at the top */
    }

    .input-container form {
      display: flex;
      width: 100%;
      position: relative;
    }

    #messageInput {
      flex: 1;
      padding: 10px 40px 10px 20px; /* Add padding to the right for the icon */
      border-radius: 20px;
      border: 1px solid #ccc;
      font-size: 14px;
      width: 100%;
      box-sizing: border-box;
    }

    #sendMessageBtn {
      position: absolute;
      right: 10px;
      top: 50%;
      transform: translateY(-50%);
      border: none;
      background: none;
      cursor: pointer;
      font-size: 18px;
      color: #007bff;
    }

    #sendMessageBtn:hover {
      color: #0056b3;
    }

    .message-metadata {
      text-align: left;
      font-size: 12px;
      margin-top: 5px;
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
        <h1>Welcome, <span id="username">Manish Kartik</span></h1>
        <!--<button id="edit-profile-btn"><i class="fas fa-edit"></i> Edit Profile</button>-->
         <button id="edit-profile-btn" onclick="history.back()"> Back</button>
      </header>
      <div class="chat-container">
        <div class="messages">
            <% 
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");
                int cust_id = Integer.parseInt(request.getParameter("cust_id"));

                String sql = "SELECT sender, message, timestamp FROM ( " +
                             "SELECT 'admin' AS sender, message, timestamp FROM AdminMessageCustomer WHERE cust_id = ? " +
                             "UNION " +
                             "SELECT 'customer' AS sender, message, timestamp FROM message WHERE cust_id = ? " +
                             ") AS messages ORDER BY timestamp ASC";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setInt(1, cust_id);
                pst.setInt(2, cust_id);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    String sender = rs.getString("sender");
                    String message = rs.getString("message");
                    Timestamp timestamp = rs.getTimestamp("timestamp");
                    LocalDateTime messageTime = timestamp.toLocalDateTime();
                    String formattedTime = messageTime.format(DateTimeFormatter.ofPattern("HH:mm"));
                    String messageClass = sender.equals("admin") ? "admin-message" : "customer-message";
            %>
            <div class="message <%= messageClass %>">
                <%= message %>
                <div class="message-metadata">
                    <span class="message-timestamp"><%= formattedTime %></span>
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
        <div class="input-container">
            <form action="admin.jsp" method="post">
                <input type="hidden" name="customer_id" value="<%= request.getParameter("cust_id") %>">
                <input type="text" placeholder="Type your message..." id="messageInput" name="message" required>
                <button type="submit" id="sendMessageBtn"><i class="fas fa-paper-plane"></i></button>
            </form>
        </div>
      </div>
      <% 
      if ("POST".equalsIgnoreCase(request.getMethod())) {
          try {
              Class.forName("com.mysql.cj.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");

              int customerId = Integer.parseInt(request.getParameter("customer_id"));
              String message = request.getParameter("message");

              String insertSql = "INSERT INTO AdminMessageCustomer (cust_id, customer_name, message) VALUES (?, (SELECT customer_name FROM customer WHERE cust_id = ?), ?)";
              PreparedStatement insertPst = con.prepareStatement(insertSql);
              insertPst.setInt(1, customerId);
              insertPst.setInt(2, customerId);
              insertPst.setString(3, message);
              int rowsAffected = insertPst.executeUpdate();
              if (rowsAffected > 0) {
                  response.sendRedirect("admin.jsp?cust_id=" + customerId);
              }
              con.close();
          } catch (Exception e) {
              out.println(e);
          }
      }
      %>
    </main>
  </div>
  <script>
    function getMessages() {
        var customerId = <%= request.getParameter("cust_id") %>;
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "get_messages.jsp?cust_id=" + customerId, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                document.querySelector(".messages").innerHTML = xhr.responseText;
            }
        };
        xhr.send();
    }

    // Call the getMessages function every 2 seconds
    setInterval(getMessages, 1000);
  </script>
</body>
</html>
