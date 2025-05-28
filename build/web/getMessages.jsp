
























<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Customer Dashboard</title>
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

      .profile-info {
        grid-template-columns: 1fr;
      }
    }
    
    /* ... (existing styles) ... */

    .chat-container {
        margin-top: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        padding: 20px;
    }

    .chat-messages {
        max-height: 300px;
        overflow-y: auto;
        padding: 10px;
        border: 1px solid #ddd;
        margin-bottom: 10px;
    }

    .message {
        margin-bottom: 10px;
        padding: 8px 12px;
        border-radius: 20px;
        max-width: 70%;
    }

    .customer-message {
        background-color: #007bff;
        color: #fff;
        align-self: flex-end;
    }

    .admin-message {
        background-color: #ddd;
        align-self: flex-start;
    }

    .message-timestamp {
        font-size: 12px;
        color: #888;
        margin-left: 5px;
    }

    .chat-form {
        display: flex;
    }

    .chat-form input[type="text"] {
        flex: 1;
        padding: 8px 12px;
        border: 1px solid #ddd;
        border-radius: 20px;
        outline: none;
    }

    .chat-form button[type="submit"] {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 8px 16px;
        border-radius: 20px;
        margin-left: 10px;
        cursor: pointer;
    }
  </style>
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
              session.setAttribute("seller", sellerId); // Set the customer ID in the session
        %>
        
        <img src="images/<%=rs.getString(2)%>">
        
              <h3 id="username"><%= rs.getString(3) %></h3>
            </div>
            <nav>
              <ul>
                <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="edit_customer_profiile.jsp"><i class="fas fa-edit"></i> Edit Profile</a></li>
                <li><a href="AddProduct.jsp"><i class="fas fa-shopping-cart"></i> Add Painting</a></li>
                <li><a href="AddCategory.jsp"><i class="fas fa-comments"></i> Add Category </a></li>
              </ul>
            </nav>
          </aside>
          <main>
            <header>
              <h1>Welcome, <span id="username"><%= rs.getString(3) %></span></h1>
              <!--<button id="edit-profile-btn"> Logout <i class="fa-solid fa-arrow-right-from-bracket"></i></button>-->
               <li><a href="logout.jsp" id="edit-profile-btn"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout </a></li>
            </header>

            <div class="profile-container">
              <h1><u>View Profile</u></h1>
              <div class="profile-info">
                <span>Name: </span><span><%= rs.getString(3) %></span>
                <span>Email: </span><span><%= rs.getInt(4) %></span>
                <span>Mobile No.: </span><span><%= rs.getString(5) %></span>
                <span>Address: </span><span><%= rs.getString(8) + ", " + rs.getString(7) + ", " + rs.getString(6) + ", -" + rs.getInt(9) %></span>
              </div>
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

    <script>
      // Get the customer ID from the hidden input field
      var customerId = $("#customerIdInput").val();

      $(document).ready(function() {
        // Send message
        $("#sendMessageBtn").click(function(e) {
          e.preventDefault();
          var messageContent = $("#messageInput").val().trim();
          if (messageContent !== "") {
            $.ajax({
              url: "sendMessage.jsp",
              type: "POST",
              data: {
                message: messageContent,
                sender: "customer",
                customerId: customerId
              },
              success: function(response) {
                // Clear the input field
                $("#messageInput").val("");
                // Retrieve and display the messages
                getMessages();
              }
            });
          }
        });

        // Retrieve and display messages
        function getMessages() {
          $.ajax({
            url: "getMessages.jsp",
            type: "GET",
            data: { customerId: customerId },
            success: function(response) {
              $(".chat-messages").html(response);
            }
          });
        }

        // Initial retrieval of messages
        getMessages();
      });
    </script>
  </body>
</html>