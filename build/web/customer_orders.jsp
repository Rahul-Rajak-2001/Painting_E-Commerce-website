






































<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <style>
    /* ... (existing styles) ... */
/*       body {*/
/*      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f5f5f5;*/
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
           
            background-color: #f1f3f6;
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
       margin-top: -3px;
    }

    #edit-profile-btn {
      background-color: #333;
      color: #fff;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      cursor: pointer;
      
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
    
    /* ... (existing styles) ... */

     .contain {
            width: 95%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-top: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
           
        }
        h1 {
            text-align: center;
            color: #333;
            margin-top: -5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
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
            width: 100px;
            height: 100px;
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



        .delivery-message {
            background-color: #e0ffe0;
            color: #006600;
            padding: 10px;
            margin-top: 10px;
            border-left: 4px solid #00cc00;
            border-radius: 4px;
            font-size: 14px;
        }
        .refund-message {
            background-color: #ffdddd;
            color: #cc0000;
            padding: 10px;
            margin-top: 10px;
            border-left: 4px solid #ff0000;
            border-radius: 4px;
            font-size: 14px;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 30%;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
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
        .no-orders {
            text-align: center;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-top: 20px;
            border-radius: 8px;
            font-size: 20px;
        }
        .no-orders a {
            color: #0066cc;
            text-decoration: none;
            font-weight: bold;
        }
        .no-orders a:hover {
            text-decoration: underline;
        }
  </style>
   <script src="javascript/c.js"></script>
<script type="text/javascript">
           function show()
           {
              //var u=document.f1.t1.value;
              // var m=document.f1.t2.value;
              var pass = document.f1.password.value;
              var cpass = document.f1.confirm_password.value;
              
            if(pass!=cpass)
               {
                   alert("password not match");
                   return false;
               }
              
           }
           </script>
</head>
<body>
  <div class="container">
    <aside class="sidebar">
      <div class="user-info">
        <i class="fas fa-user-circle"></i>
        
        
     

<!-- Dashboard content -->


        
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
                  <li><a href="index.jsp" class="active"><i class="fas fa-home" ></i> Home</a></li>
                   <li><a href="customer_dshboard.jsp"><i class="fa-solid fa-user"></i> Profile</a></li>
               
                <li><a href="edit_customer_profiile.jsp"><i class="fas fa-edit"></i> Edit Profile</a></li>
                <li><a href="customer_orders.jsp"><i class="fas fa-shopping-cart"></i> Orders</a></li>
                <li><a href="customer.jsp"><i class="fas fa-comments"></i> Message</a></li>
              </ul>
            </nav>
          </aside>
          <main>
            <header>
              <h1>Welcome, <span id="username"><%= rs.getString("customer_name") %></span></h1>
              <!--<button id="edit-profile-btn"> Logout <i class="fa-solid fa-arrow-right-from-bracket"></i></button>-->
              <li><a href="logout.jsp" id="edit-profile-btn" style="text-decoration:none;"> Logout </a></li>
            </header>
              <div class="contain">
<!--        <h1>Orders History</h1>-->
        <%
//        int customerId = (Integer) session.getAttribute("customerId"); // Retrieve the customer ID from the session
        boolean hasOrders = false; // Flag to check if there are any orders

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");

            String sql1 = "SELECT o.order_id, o.order_date, o.painting_name, o.price, o.status, o.quantity, s.seller_name, o.Painting_image " +
                         "FROM `order` o " +
                         "JOIN painting p ON o.painting_name = p.painting_name " +
                         "JOIN seller s ON p.seller_id = s.seller_id " +
                         "WHERE o.cust_id = ? " +
                         "GROUP BY o.order_id, o.painting_name " +
                         "ORDER BY o.order_id ASC";
            PreparedStatement pst1 = con1.prepareStatement(sql1);
            pst1.setInt(1, customerId);
            ResultSet rs1 = pst1.executeQuery();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            if (rs1.next()) {
                hasOrders = true; // Set the flag to true if there are any orders
        %>
        <div class="responsive-table">
         <table>
    <thead>
        <tr>
            <th>Order ID</th>
            <th>Painting Image</th>
            <th>Painting Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Seller Name</th>
            <th>Order Date</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <%
        do {
            int orderId = rs1.getInt("order_id");
            String orderDate = rs1.getString("order_date");
            String status = rs1.getString("status");
        %>
        <tr data-order-id="<%= orderId %>">
            <td data-label="Order ID"><%= orderId %></td>
            <td data-label="Painting Image"><img src="images/<%= rs1.getString("Painting_image") %>" alt="<%= rs1.getString("painting_name") %>"></td>
            <td data-label="Painting Name"><%= rs1.getString("painting_name") %></td>
            <td data-label="Price"><%= rs1.getDouble("price") %></td>
            <td data-label="Quantity"><%= rs1.getInt("quantity") %></td>
            <td data-label="Seller Name"><%= rs1.getString("seller_name") %></td>
            <td data-label="Order Date"><%= orderDate %></td>
            <td class="status" data-label="Status"><%= status %></td>
           <td data-label="Cancel Order">
    <% if (status.equals("Confirm") || status.equals("Shipped")) { %>
        <button onclick="openModal(<%= orderId %>)">Cancel</button>
    <% } else if (status.equals("Delivered")) { %>
        <span>Delivered</span>
    <% } else { %>
        <span><%= status %></span>
    <% } %>
</td>
        </tr>
        <%
            if (status.equals("Confirm") || status.equals("Shipped")) {
                // Calculate the estimated delivery date (7 days from order date)
                Calendar cal = Calendar.getInstance();
                cal.setTime(sdf.parse(orderDate));
                cal.add(Calendar.DATE, 7);
                String estimatedDeliveryDate = sdf.format(cal.getTime());
        %>
        <tr data-order-id="<%= orderId %>_delivery">
            <td colspan="9">
                <div class="delivery-message" id="delivery-message-<%= orderId %>">
                    Your order will be delivered by <%= estimatedDeliveryDate %>.
                </div>
            </td>
        </tr>
        <%
            } else if (status.equals("Cancelled")) {
        %>
        <tr data-order-id="<%= orderId %>_cancelled">
            <td colspan="9">
                <div class="refund-message">
                    Your order has been cancelled. The refund will be processed shortly.
                </div>
            </td>
        </tr>
        <%
            }
        } while (rs1.next());
        %>
    </tbody>
</table>
        </div>
        <%
            } else {
        %>
        <div class="no-orders">
            <p>You have no orders. <a href="index.jsp">Start shopping now!</a></p>
        </div>
        <%
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>

        <!-- Existing Cancel Order Modal -->
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <h2>Cancel Order</h2>
                <form id="cancelForm" onsubmit="submitCancelForm(event)">
                    <input type="hidden" id="order_id" name="order_id">
                    <label for="reason">Reason for cancellation:</label><br>
                    <input type="radio" name="reason" value="Changed my mind" required> Changed my mind<br>
                    <input type="radio" name="reason" value="Found a better price" required> Found a better price<br>
                    <input type="radio" name="reason" value="Product not needed anymore" required> Product not needed anymore<br>
                    <input type="radio" name="reason" value="Other" required> Other<br><br>
                    <input type="submit" value="Submit">
                </form>
                <div id="cancelResult"></div>
            </div>
        </div>
        
        
        
        
        <!-- Return/Replace Modal -->
<div id="returnModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeReturnModal()">&times;</span>
        <h2>Return/Replace Order</h2>
        <form id="returnForm" onsubmit="submitReturnForm(event)">
            <input type="hidden" id="return_order_id" name="return_order_id">
            <label for="action">Choose action:</label><br>
            <input type="radio" name="action" value="Return" required> Return<br>
            <input type="radio" name="action" value="Replace" required> Replace<br>
            <label for="reason">Reason:</label><br>
            <textarea id="reason" name="reason" required></textarea><br><br>
            <input type="submit" value="Submit">
        </form>
        <div id="returnResult"></div>
    </div>
</div>
    </div>
            
          </main>
  
        
        
  
      </div>
   
     <script>
        // Function to open the modal and set the order ID
        function openModal(orderId) {
            resetModal();
            document.getElementById("order_id").value = orderId;
            document.getElementById("myModal").style.display = "block";
        }

        // Function to reset the modal form
        function resetModal() {
            var reasons = document.getElementsByName("reason");
            for (var i = 0; i < reasons.length; i++) {
                reasons[i].checked = false;
            }
            document.getElementById("cancelResult").innerHTML = "";
            document.getElementById("cancelForm").style.display = "block";
        }

        // Function to close the modal
        function closeModal() {
            document.getElementById("myModal").style.display = "none";
        }

        // Close the modal if the user clicks anywhere outside of it
        window.onclick = function(event) {
            if (event.target == document.getElementById("myModal")) {
                closeModal();
            }
        }

        // Function to handle form submission via AJAX
        function submitCancelForm(event) {
    event.preventDefault();

    var orderId = document.getElementById("order_id").value;
    var reason = document.querySelector('input[name="reason"]:checked').value;

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "cancel_order.jsp", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var responseText = xhr.responseText.trim();
            document.getElementById("cancelResult").innerHTML = responseText;
            document.getElementById("cancelForm").style.display = "none";
            if (responseText.includes("Order cancelled successfully.")) {
                updateOrderUI(orderId, "Cancelled");
                closeModal();
            }
        }
    };

    xhr.send("order_id=" + orderId + "&reason=" + encodeURIComponent(reason));
}

function updateOrderUI(orderId, status) {
    var row = document.querySelector("tr[data-order-id='" + orderId + "']");
    if (row) {
        var statusCell = row.querySelector("td.status");
        var actionCell = row.querySelector("td[data-label='Cancel Order']");
        if (statusCell) statusCell.textContent = status;
        if (actionCell) actionCell.innerHTML = "<span>Cancelled</span>";

        // Hide delivery message and show refund message
        var deliveryMessageRow = document.querySelector("tr[data-order-id='" + orderId + "_delivery']");
        if (deliveryMessageRow) deliveryMessageRow.style.display = "none";

        var refundMessageRow = document.querySelector("tr[data-order-id='" + orderId + "_cancelled']");
        if (!refundMessageRow) {
            refundMessageRow = document.createElement("tr");
            refundMessageRow.setAttribute("data-order-id", orderId + "_cancelled");
            refundMessageRow.innerHTML = `
                <td colspan="9">
                    <div class="refund-message">
                        Your order has been cancelled. The refund will be processed shortly.
                    </div>
                </td>
            `;
            row.parentNode.insertBefore(refundMessageRow, row.nextSibling);
        } else {
            refundMessageRow.style.display = "table-row";
        }
    }
}
        
        
        
        
        
        
        
        
        function openReturnModal(orderId) {
    resetReturnModal();
    document.getElementById("return_order_id").value = orderId;
    document.getElementById("returnModal").style.display = "block";
}

function resetReturnModal() {
    var actions = document.getElementsByName("action");
    for (var i = 0; i < actions.length; i++) {
        actions[i].checked = false;
    }
    document.getElementById("reason").value = "";
    document.getElementById("returnResult").innerHTML = "";
    document.getElementById("returnForm").style.display = "block";
}

function closeReturnModal() {
    document.getElementById("returnModal").style.display = "none";
}

function submitReturnForm(event) {
    event.preventDefault();

    var orderId = document.getElementById("return_order_id").value;
    var action = document.querySelector('input[name="action"]:checked').value;
    var reason = document.getElementById("reason").value;

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "return_replace_order.jsp", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var responseText = xhr.responseText.trim();
            document.getElementById("returnResult").innerHTML = responseText;
            document.getElementById("returnForm").style.display = "none";
            // Update the UI based on the response
            // You may want to refresh the page or update the specific order row
        }
    };

    xhr.send("order_id=" + orderId + "&action=" + encodeURIComponent(action) + "&reason=" + encodeURIComponent(reason));
}

// Function to update order status (call this function when you receive updates from the server)
function updateOrderStatus(orderId, newStatus) {
    var statusCell = document.querySelector("tr[data-order-id='" + orderId + "'] td.status");
    var actionsCell = document.querySelector("tr[data-order-id='" + orderId + "'] td[data-label='Actions']");
    var deliveryMessageRow = document.querySelector("tr[data-order-id='" + orderId + "_delivery']");

    if (statusCell) {
        statusCell.textContent = newStatus;
    }

    if (actionsCell) {
        if (newStatus === "Delivered") {
            actionsCell.innerHTML = "<button onclick='openReturnModal(" + orderId + ")'>Return/Replace</button>";
        } else if (newStatus !== "Confirm") {
            actionsCell.innerHTML = "<span>No actions available</span>";
        }
    }

    if (deliveryMessageRow) {
        if (newStatus === "Delivered") {
            deliveryMessageRow.style.display = "none";
        } else if (newStatus === "Shipped") {
            deliveryMessageRow.style.display = "table-row";
        }
    }
}






    // Existing JavaScript code...

    // Function to handle real-time updates
    function setupEventSource() {
        var customerId = <%= customerId %>; // Assuming you have the customer ID available
        var eventSource = new EventSource("order_updates?customerId=" + customerId);

        eventSource.onmessage = function(event) {
            var data = JSON.parse(event.data);
            updateOrderStatus(data.orderId, data.status);
        };

        eventSource.onerror = function(error) {
            console.error("EventSource failed:", error);
            eventSource.close();
        };
    }

    // Function to update order status
    function updateOrderStatus(orderId, newStatus) {
    var row = document.querySelector("tr[data-order-id='" + orderId + "']");
    if (row) {
        var statusCell = row.querySelector("td.status");
        var actionCell = row.querySelector("td[data-label='Cancel Order']");

        if (statusCell) {
            statusCell.textContent = newStatus;
        }

        if (actionCell) {
            if (newStatus === "Shipped") {
                actionCell.innerHTML = "<button onclick='openModal(" + orderId + ")'>Cancel</button>";
            } else if (newStatus === "Delivered") {
                actionCell.innerHTML = "<button onclick='openReturnModal(" + orderId + ")'>Return/Replace</button>";
            } else {
                actionCell.innerHTML = "<span>" + newStatus + "</span>";
            }
        }

        // Update delivery message
        var deliveryMessageRow = document.querySelector("tr[data-order-id='" + orderId + "_delivery']");
        if (deliveryMessageRow) {
            if (newStatus === "Shipped") {
                deliveryMessageRow.style.display = "table-row";
            } else {
                deliveryMessageRow.style.display = "none";
            }
        }
    }
}
    // Call this function when the page loads
    window.onload = function() {
        setupEventSource();
    };

    </script>
    
    <%
            }
          } catch (Exception e) {
            out.println(e);
          }
        %>
  </body>
</html>


