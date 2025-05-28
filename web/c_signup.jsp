
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/seller signup.css">
        <style>
              body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('https://images.unsplash.com/photo-1496483353456-90997953e2d2');
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f1f3f6;
        }
        .container {
            background: rgba(210px);
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
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
       .back-btn {
    position: fixed;
    top: 30px;
    right: 30px;
    background-color: #333;
    color: white;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 4px;
    font-size: 16px;
}
.back-btn:hover {
    background-color: #555;
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
      <a href="#" class="back-btn" onclick="history.back()">Back</a>
    <div class="container">
        <h2> Sign Up Form</h2>
        <form action="c_signup.jsp" method="post"  name="f1" onsubmit="return show()">
            
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><!-- comment -->
            
             <label for="email">Email:</label>
             <input type="email" id="email" name="email" required><!-- comment -->
             
             
             
             
             
             
             
             
            <label for="contact_number">Mobile No:</label>
            <input type="text" id="contact_number" name="contact_number" required>

            <p class="p"></p><label for="s" class="ss">State & City:</label>
            <select onchange="print_city('state', this.selectedIndex);" id="s" name="state"  required class="I2"></select>
            <select id="state" name="city" required class="I2"></select>
            <script>
               print_state("s");
            </script>
            
            <label for="Address" class="a" >Address:</label>
            <input type="text" id="Address" name="Address" required>
             <label for="pincode">pincode:</label>
            <input type="text" id="pincode" name="pincode" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <label for="confirm_password">Confirm Password:</label>
            <input type="password" id="confirm_password" name="confirm_password" required>

            <input type="submit" value="Sign Up">
        </form>
    </div>
      
      
        <%
            try
            {
           String a=request.getParameter("name");
            String b=request.getParameter("email");
            // int c=Integer.parseInt(request.getParameter("contact_number"));
    
   String c=request.getParameter("contact_number");
   
    //int p=Integer.parseInt(request.getParameter("t8"));
    String d=request.getParameter("state");
     String e=request.getParameter("city");
     String f=request.getParameter("Address");
     int g=Integer.parseInt(request.getParameter("pincode"));
        String h = request.getParameter("password");
        String i = request.getParameter("confirm_password");
   
             
              
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting","root","passord.9506");
    String sql="insert into customer(customer_name,email,mobile_no,state,city,address,pincode,password,con_password) values('"+a+"','"+b+"', '"+c+"','"+d+"','"+e+"','"+f+"' ,'"+g+"','"+h+"' ,'"+i+"')";
    PreparedStatement pst=con.prepareStatement(sql);
   int j=pst.executeUpdate();
    if(j>0)
    {
    response.sendRedirect("customer_login.jsp");
    }
    }
    

    catch(Exception z)
            {
                //e.printStackTrace();
                //out.println(z);
            }
    %>

      
     
</body>
</html>








