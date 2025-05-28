












<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
	
		
</head>
<body>
		
	

	<%
	
		try
		{		
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/painting","root","passord.9506");
			String str1=(String)session.getAttribute("email");
		
			
//		
				String sql = "select cust_id, customer_name,email, mobile_no,state,city,address,pincode from customer where email = '"+str1+"'";
                                PreparedStatement pst= con.prepareStatement(sql);
				ResultSet rs=pst.executeQuery();
				{
					if(rs.next())
					
						
				%>
                               
                               
                                
                             
                                  
			       
                                 Customer ID &nbsp; &nbsp;&nbsp; : &nbsp;&nbsp; &nbsp;  <% out.println(rs.getInt(1));%>
                                
                                  
                                Name &nbsp; &nbsp; &nbsp; : &nbsp; &nbsp;&nbsp; <% out.println(rs.getString(2));%>
                                 
                                
                               
                                 
                               
                                  
                               Email &nbsp; &nbsp; &nbsp;  : &nbsp; &nbsp;&nbsp; <% out.println(rs.getString(3)); %>
                                
                               
                               
                                   Mobile No. &nbsp; &nbsp; &nbsp;   : &nbsp; &nbsp;&nbsp;  <%  out.println(rs.getInt(4)); %>
                                
                                    
                                   
                                                                Address &nbsp; &nbsp; &nbsp; : &nbsp; &nbsp;&nbsp;    
                                    <% 
                                        out.println(rs.getString(7) + ", " + rs.getString(6) + ", " + rs.getString(5) + ", -" + rs.getInt(8)); 
                                    %> 
                               

                                
                               <%
                                   }      
		}
		catch(Exception e)
		{
			//e.printStackTrace();
		out.println(e);
		}
		
		
	%>

				
</body>
</html>