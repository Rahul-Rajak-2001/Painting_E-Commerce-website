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
      margin-bottom: 70px;
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
/*            background: rgba(210px);
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;*/
            
            
            
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
        input[type="email"],
        input[type="tel"],
        input[type="password"],
        input[type="file"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
/*            border: 1px solid #ccc;*/
/*            border-radius: 4px;*/
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

.I2{
    width: 197px;
    height: 35px;
    border: none;
    outline: none;
    border-bottom: 1px solid #ccc;
}
    


.ss{
    margin-top: -15px;
} 
.a{
    margin-top: 8px;
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
              <!--<button id="edit-profile-btn"> Logout <i class="fa-solid fa-arrow-right-from-bracket"></i></button>-->
              <li><a href="logout.jsp" id="edit-profile-btn" style="text-decoration: none;"> Logout </a></li>
            </header>
  
<div class="contain">
        <h2> Add category </h2>
         <form action="AddCategory.jsp" method="post" onsubmit="return showConfirmation();">
            
           <script>
        function showConfirmation() {
            var confirmAdd = confirm("Your Category will be added successfully.");
            return confirmAdd; // return true if the user clicks OK, false otherwise
//            window.href="seller dashboard.jsp"
        }
    </script>

            <label for="category">Category Name:</label>
            <input type="text" id="category" name="c" required><!-- comment -->
            
            <input type="submit" value="ADD">
        </form>
    </div>
           <%
            try
            {
             String a=request.getParameter("c");
           
             
              
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting","root","passord.9506");
    if(a!=null)
    {
    String sql1="insert into painting_category( category_name ) values('"+a+"')";
    PreparedStatement pst1=con1.prepareStatement(sql1);
   int j=pst1.executeUpdate();
    if(j>0)
    {
 response.sendRedirect("seller dashboard.jsp");
    }
    }
     }
    catch(Exception e)
            {
//                e.printStackTrace();
                //out.println(e);
            }
    %> 

            
          </main>
  
        <%
            }
          } catch (Exception e) {
//            out.println(e);
          }
        %>
        
  
      </div>
   
    
  </body>
</html>



