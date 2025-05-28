<%-- 
    Document   : display
    Created on : 11-Mar-2024, 4:12:45 pm
    Author     : Rahul
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            

        .c {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            margin: 20px;
            position: relative;
        }

        .category-contain {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-evenly;
            width: 100%;
            padding: 0 10px;
           
        }

        .category-it {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 10px;
            margin: 5px;
            cursor: pointer;
            flex: 1 1 calc(25% - 20px); /* Adjusted to 4 items per row */
            max-width: calc(25% - 20px); /* Adjusted to 4 items per row */
            box-sizing: border-box;
            transition: transform 0.1s ease;
        }

        /* .category-it img {
            max-width: 100%; /* Adjusted to be responsive */
            /* height: auto; /* Adjusted to be responsive */
            /* margin-bottom: 5px;
        } */ 

        .category-it img {
            max-width: 95%; /* Adjusted to be responsive */
            height: auto; /* Adjusted to be responsive */
            margin-bottom: 5px;
            /* margin-right: 26px; */

        }

        @media screen and (max-width: 1024px) {
            .category-it {
                flex: 1 1 calc(33.333% - 20px); /* Adjusted to 3 items per row */
                max-width: calc(33.333% - 20px); /* Adjusted to 3 items per row */
            }
        }

        @media screen and (max-width: 768px) {
            .category-it {
                flex: 1 1 calc(50% - 20px); /* Adjusted to 2 items per row */
                max-width: calc(50% - 20px); /* Adjusted to 2 items per row */
            }
        }

        @media screen and (max-width: 480px) {
            .category-it {
                flex: 1 1 calc(100% - 20px); /* Adjusted to 1 item per row */
                max-width: calc(100% - 20px); /* Adjusted to 1 item per row */
            }
        }


            </style>
    </head>
    <body>
     
<h1 style="color:red" align="center">DISPLAY IMAGE DETAIL</h1>

<div align="center">
<!--
<form action="NewServlet" method="post">
   Enter Image Id :
   <input type="number" name="imageId">
   <input type="submit" value="Display Image">
</form>-->
<!--<form action="display.jsp" method="post">
   Enter Image Id :
   <input type="number" name="id">
   <input type="submit" value="Display Image">
</form>-->


</div>

<hr>


<h2 style="margin-bottom: 20px;">Shop by religious categories</h2>
<div class="c">
    
    <div class="category-contain">
        <!-- Your category items here -->
        <div class="category-it">
<%
     
     
     
     
     
     
     
//     
//     
//       String imgFileName=(String)request.getAttribute("img");
//    String imgId=(String)request.getAttribute("id");
//     
//     
     
     
     
     
     
     
//     
//     
//     
     
		//int i=Integer.parseInt(request.getParameter("id"));
	String i=request.getParameter("id");	
		//getting database connection (jdbc code)
//				
				
                                
                                    
            try
            {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting","root","passord.9506");
                       String sql= "select * from seller limit 4";
                       //String sql= "select * from image";
                       PreparedStatement pst = con.prepareStatement(sql);
                       ResultSet rs = pst.executeQuery();
                       %>
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
<!--				try 
				{
                                    
       
					Class.forName("com.mysql.cj.jdbc.Driver");
					connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","passord.9506");
					Statement stmt;
					String query="select * from image where  imageId='"+i+"'";
					stmt=connection.createStatement();
					ResultSet rs=stmt.executeQuery(query);
					%>-->
                                        <%
					while(rs.next())
                                        {
                                         %>
<!--                                        if(rs.getInt("imageId")==id)
						{-->
                                                      
							<img src="images/<%=rs.getString(2)%>" style="width:300px;height:250px">
                                                        <%=rs.getString(3)%>
                                                       
<!--						}-->
                                                
                                         <%      
					}
                                        %>
                                     <%
				}
                                 
						
				catch (Exception e)
				{
					System.out.println(e);
				}
     
     
     
     
     
     
     
     
     
     %>
       </div>
    </div>
</div>
     
     
     
     
     
</body>
</html>





