

<%@page import="java.sql.*" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@page import="java.time.LocalDateTime" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Customer Dashboard</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <link rel="stylesheet" href="styles.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f1f3f6;
      overflow: hidden;
    }

    .contain {
      display: flex;
      height: 100vh;
    }

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

    main {
      flex: 1;
      padding: 20px;
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
    }

    @media (max-width: 768px) {
      .contain {
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

    .chat-container {
      flex-grow: 1;
      display: flex;
      flex-direction: column;
      height: 100%;
      border-radius: 5px;
      border: 1px solid #ddd;
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
      border-top: 1px solid #ddd;
    }

    .input-container form {
      display: flex;
      width: 100%;
      position: relative;
    }

    #messageInput {
      flex: 1;
      padding: 10px 20px;
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

    .message-timestamp {
      color: white;
      margin-left: 0;
      margin-top: 1px;
    }

    h1 {
      margin: 30px auto;
    }
  </style>
</head>
<body>
  <div class="contain">
    <aside class="sidebar">
      <div class="user-info">
        <i class="fas fa-user-circle"></i>
        <%
          // Get the customer's email from the session
          String customerEmail = (String) session.getAttribute("email");

          // Connect to the database and retrieve the customer ID
          try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");

            String sql = "SELECT cust_id, customer_name, email, mobile_no, state, city, address, pincode FROM customer WHERE email = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, customerEmail);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
              int customerId = rs.getInt("cust_id");
        %>
              <!-- Pass the customerId value to JavaScript using a hidden input field -->
              <h3 id="username"><%= rs.getString("customer_name") %></h3>
            </div>
            <nav>
              <ul>
                <li><a href="index.jsp" class="active"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="customer_dshboard.jsp"><i class="fa-solid fa-user"></i> Profile</a></li>
                <li><a href="edit_customer_profiile.jsp"><i class="fas fa-edit"></i> Edit Profile</a></li>
                <li><a href="customer_orders.jsp"><i class="fas fa-shopping-cart"></i> Orders</a></li>
                <li><a href="customer.jsp"><i class="fas fa-comments"></i> Message</a></li>
              </ul>
            </nav>
          </aside>
          <main>
            <header>
              <h1>Have Any Queery ?</h1>
              <a href="logout.jsp" id="edit-profile-btn" style="text-decoration:none;"> Logout </a>
            </header>

            <div class="chat-container">
              <div class="messages">
                <%
                try {
                  // Establishing database connection
                  Class.forName("com.mysql.cj.jdbc.Driver");
                  Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");

                  // Retrieve both admin and customer messages
                  String sql1 = "SELECT 'admin' AS sender, cust_id, customer_name, message, timestamp FROM AdminMessageCustomer WHERE cust_id = ? " +
                                "UNION " +
                                "SELECT 'customer' AS sender, cust_id, customer_name, message, timestamp FROM message WHERE cust_id = ? " +
                                "ORDER BY timestamp ASC"; // Order by timestamp in ascending order
                  PreparedStatement pst1 = con1.prepareStatement(sql1);
                  pst1.setInt(1, customerId);
                  pst1.setInt(2, customerId);
                  ResultSet rs1 = pst1.executeQuery();
                  while (rs1.next()) {
                    String sender = rs1.getString("sender");
                    String message = rs1.getString("message");
                    Timestamp timestamp = rs1.getTimestamp("timestamp");
                    LocalDateTime messageTime = timestamp.toLocalDateTime();
                    String formattedTime = messageTime.format(DateTimeFormatter.ofPattern("HH:mm"));
                %>
                <div class="message <%= sender.equals("admin") ? "admin-message" : "customer-message" %>">
                  <div class="message-text"><%= message %></div>
                  <div class="message-metadata">
                    <% if (sender.equals("customer")) { %>
                      <!-- <span class="tick-icon double-tick">&#x2705;</span> -->
                    <% } %>
                    <span class="message-timestamp"><%= formattedTime %></span>
                  </div>
                </div>
                <%
                  }

                  con1.close();
                } catch (Exception e) {
                  out.println(e);
                }
                %>
              </div>
              <div class="input-container">
                <form action="customer.jsp" method="post">
                  <%
                  try {
                    // Establishing database connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");

                    // Retrieving customer information
                    String customerInfoSql = "SELECT cust_id, customer_name FROM customer WHERE email = ?";
                    PreparedStatement customerInfoPst = con2.prepareStatement(customerInfoSql);
                    customerInfoPst.setString(1, (String) session.getAttribute("email"));
                    ResultSet customerInfoRs = customerInfoPst.executeQuery();
                    if (customerInfoRs.next()) {
                  %>
                  <input type="hidden" name="customer_id" value="<%= customerInfoRs.getInt(1) %>">
                  <input type="hidden" name="cust_name" value="<%= customerInfoRs.getString(2) %>">
                  <% 
                    }
                    con2.close();
                  } catch (Exception e) {
                    out.println(e);
                  }
                  %>
                  <input type="text" placeholder="Type your message..." id="messageInput" name="mess" required>
                  <button type="submit" id="sendMessageBtn"><i class="fas fa-paper-plane"></i></button>
                </form>
              </div>
            </div>

            <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
              try {
                // Establishing database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");

                // Getting form data
                int customerIdPost = Integer.parseInt(request.getParameter("customer_id"));
                String customerNamePost = request.getParameter("cust_name");
                String messagePost = request.getParameter("mess");

                // Inserting message into the database
                String insertSql = "INSERT INTO message (cust_id, customer_name, message) VALUES (?, ?, ?)";
                PreparedStatement insertPst = con3.prepareStatement(insertSql);
                insertPst.setInt(1, customerIdPost);
                insertPst.setString(2, customerNamePost);
                insertPst.setString(3, messagePost);
                int rowsAffected = insertPst.executeUpdate();
                con3.close();

                if (rowsAffected > 0) {
                  response.sendRedirect("customer.jsp");
                }
              } catch (Exception e) {
                out.println(e);
              }
            }
            %>
          </main>
        <%
            }
          } catch (Exception d) {
            out.println(d);
          }
        %>
      </div>
    <script src="javascript/chat.js"></script>
  </body>
</html>

