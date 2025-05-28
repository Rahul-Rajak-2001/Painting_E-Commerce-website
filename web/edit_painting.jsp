<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Painting</title>
  <!-- Add your CSS and JavaScript includes here -->
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f1f3f6;
    }

    .container {
        display: flex;
        height: 100vh;
        overflow: hidden; /* Prevent overall page scroll */
    }

    /* Sidebar Styles */
    .sidebar {
        background-color: #333;
        color: #fff;
        width: 250px;
        padding: 20px;
        display: flex;
        flex-direction: column;
        position: fixed; /* Make sidebar fixed */
        height: 100vh; /* Full viewport height */
        overflow-y: auto; /* Allow sidebar to scroll if content overflows */
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
        margin-left: 250px; /* Leave space for fixed sidebar */
        padding: 20px;
        height: 100vh;
        overflow-y: auto; /* Allow main content to scroll */
        width: calc(100% - 250px);
    }

    header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: -10px;
        margin-top: -10px;
    }

    #edit-profile-btn {
        background-color: #333;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
    }

    .contain {
        background: rgba(255, 255, 255, 0.8);
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        max-width: 400px;
        margin: auto;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    form {
        margin-top: 20px;
    }

    label {
        display: block;
        margin-bottom: 5px;
    }

    input[type="text"],
    input[type="number"],
    input[type="tel"],
    input[type="password"],
    input[type="file"] {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        box-sizing: border-box;
        border: none;
        outline: none;
        border-bottom: 1px solid #ccc;
    }

    .opt {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        box-sizing: border-box;
        border: none;
        outline: none;
        border-bottom: 1px solid #ccc;
    }

    input[type="submit"] {
        background-color: #333;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        width: 100%;
        display: block;
    }

    input[type="submit"]:hover {
        background-color: #555;
    }

    .I2 {
        width: 197px;
        height: 35px;
        border: none;
        outline: none;
        border-bottom: 1px solid #ccc;
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
            position: relative;
        }

        .user-info {
            margin-bottom: 0;
        }

        .sidebar nav ul {
            display: flex;
            justify-content: space-around;
            width: 100%;
        }

        main {
            margin-left: 0;
            width: 100%;
        }
    }
    
    
    h1{
        margin-left: 40px;
    }
</style>
<script src="javascript/c.js"></script>
<script type="text/javascript">
    function show() {
        var pass = document.f1.password.value;
        var cpass = document.f1.confirm_password.value;

        if (pass != cpass) {
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
        <%
            String sellerEmail = (String) session.getAttribute("e");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");

                String sql = "select seller_id,image,seller_name,contact_no,email, state , city, address, pincode from seller where email = ?";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setString(1, sellerEmail);
                ResultSet rs = pst.executeQuery();

                if (rs.next()) {
                    int sellerId = rs.getInt("seller_id");
        %>
                    <input type="hidden" id="customerIdInput" value="<%= sellerId %>">
        <%
                    session.setAttribute("seller", sellerId);
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
              <h1>Welcome, <span id="username"><%= rs.getString("seller_name") %></span></h1>
              <!--<li><a href="logout.jsp" id="edit-profile-btn" style="text-decoration: none;">Logout</a></li>-->
              <li><a href="#" id="edit-profile-btn" style="text-decoration: none;" onclick="history.back()">Back</a></li>
              
            </header>
            <div class="contain">
                <form action="Edit_Painting" method="post" enctype="multipart/form-data">
                    <h2>Edit Profile</h2>
                    <%
                        int paintingId = Integer.parseInt(request.getParameter("id"));
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");
                            String sql1 = "SELECT * FROM painting WHERE painting_id = ?";
                            PreparedStatement pst1 = con1.prepareStatement(sql1);
                            pst1.setInt(1, paintingId);
                            ResultSet rs1 = pst1.executeQuery();

                            if (rs1.next()) {
                                String paintingName = rs1.getString(3);
                                session.setAttribute("paintingId", paintingId);
                    %>
                    <label for="name">Painting Name:</label>
                    <input type="text" id="name" name="name" required value="<%= paintingName %>">
                    <img src="images/<%= rs1.getString(4) %>" alt="Painting Image" style="max-width: 150px;">
                    <label for="<%= paintingName %>">Upload Image: <%= paintingName %></label>
                    <input type="file" id="<%= paintingName %>" name="image" value="<%= rs1.getString(4) %>" required>
                    <label for="qty">Quantity:</label>
                    <input type="text" id="qty" name="qty" required value="<%= rs1.getInt(5) %>">
                    <label for="price">Price:</label>
                    <input type="number" id="price" name="price" required value="<%= rs1.getString(6) %>">
                    <label for="category">Category Name:</label>
                    <select name="opt" id="category" class="opt" required>
                        <option value="">Select</option>
                        <%
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");
                                String sql2 = "SELECT * FROM painting_category";
                                PreparedStatement pst2 = con2.prepareStatement(sql2);
                                ResultSet rs2 = pst2.executeQuery();
                                while (rs2.next()) {
                        %>
                                    <option value="<%= rs2.getString("category_name") %>" <%= rs2.getString("category_name").equals(rs1.getString(7)) ? "selected" : "" %>>
                                        <%= rs2.getString("category_name") %>
                                    </option>
                        <%
                                }
                            } catch (Exception e1) {
                                // Handle exception
                            }
                        %>
                    </select>
                    <input type="submit" value="Update">
                    <%
                            }
                        } catch (Exception e) {
                            // Handle exception
                        }
                    %>
                </form>
            </div>
          </main>
        <%
                }
            } catch (Exception e) {
                // Handle exception
            }
        %>
  </div>
</body>
</html>
