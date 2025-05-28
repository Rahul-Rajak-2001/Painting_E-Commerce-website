

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
        <h2> Edit Profile</h2>
        <form action="edit_customer_profiile.jsp" method="post" onsubmit="return show()">
            <%
                String str1=(String)session.getAttribute("email");
            %>
                <%
                           Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting","root","passord.9506");
                      // String str1=(String)session.getAttribute("email");
                        String sql1="select* from customer where email = '"+str1+"'";
                        PreparedStatement pst1 = con.prepareStatement(sql1);
                        ResultSet rs1 = pst1.executeQuery();
                        while(rs1.next())
                        {
                      
                      
                           
                           %>
            
            
            

            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required value="<%=rs1.getString(2)%>"
                                     ><!-- comment -->
            
             <label for="email">Email:</label>
             <input type="email" id="email" name="email" required value="<%=rs1.getString(3)%>"
                                     ><!-- comment -->
             
             
             
             
             
             
             
             
            <label for="contact_number">Mobile No:</label>
            <input type="text" id="contact_number" name="contact_number" required value="<%=rs1.getString(4)%>">

            <p class="p"></p><label for="s" >State & City:</label>
            <select onchange="print_city('state', this.selectedIndex);" id="s" name="state"  required class="I2" value="<%=rs1.getString(5)%>"
                                     ></select>
            <select id="state" name="city" required class="I2" value="<%=rs1.getString(6)%>"
                                     ></select>
            <script>
               print_state("s");
            </script>
            
            <label for="Address" >Address:</label>
            <input type="text" id="Address" name="Address" required value="<%=rs1.getString(7)%>"
                                     >
             <label for="pincode">pincode:</label>
            <input type="text" id="pincode" name="pincode" required value="<%=rs1.getInt(8)%>"
                                     >
            
         <% }  %>

            <input type="submit" value="Update">
        </form>
    </div>
          <%
            try
            {
           String a=request.getParameter("name");
            String email=request.getParameter("email");
//             int c=Integer.parseInt(request.getParameter("contact_number"));
            String c=request.getParameter("contact_number");
   
   
    //int p=Integer.parseInt(request.getParameter("t8"));
    String d=request.getParameter("state");
     String e=request.getParameter("city");
     String f=request.getParameter("Address");
     int g=Integer.parseInt(request.getParameter("pincode"));
     
   
             
              
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting","root","passord.9506");
//    String sql1="insert into customer(customer_name,email,mobile_no,state,city,address,pincode,password,con_password) values('"+a+"','"+b+"', '"+c+"','"+d+"','"+e+"','"+f+"' ,'"+g+"','"+h+"' ,'"+i+"')";
    String sql2="Update customer set customer_name = '"+a+"',email= '"+email+"',mobile_no='"+c+"' , state='"+d+"',city='"+e+"', address ='"+f+"' , pincode = '"+g+"' where  email='"+str1+"'";
    PreparedStatement pst2=con2.prepareStatement(sql2);
   int j=pst2.executeUpdate();
    if(j>0)
    {
    session.setAttribute("email", email);
    response.sendRedirect("customer_dshboard.jsp");
    }
    }
    

    catch(Exception z)
            {
//                z.printStackTrace();
//                out.println(z);
            }
    %>  

            
          </main>
  
        <%
            }
          } catch (Exception e) {
            out.println(e);
          }
        %>
        
  
      </div>
   
    
  </body>
</html>


