<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

			<style>
	  body{
               background-image: linear-gradient(45deg, rgb(240, 90, 48), rgb(239, 80, 36),rgb(212, 147, 17)); 
               

            }
            .a{
                margin-top: 105px;
                text-align: center;
                letter-spacing: 2px;
                 color: black;
                 font-size: 47px;
                 margin-bottom: 76px;
            }
            .s1{
    margin-left: 178px;
    margin-top: 50px;
     color: white;
     
     font-size: 30px;
}
.s2{
    margin-left: 549px;
    margin-top: 50px;
     color: white;
     
     font-size: 30px;
}
.s3{
    margin-left: 102px;
    margin-top: 50px;
     color: white;
   
     font-size: 30px;
}
.s4{
    margin-left: 450px;
    margin-top: 50px;
     color: white;
    
     font-size: 30px;
}
.s5{
    margin-left: 150px;
    margin-top: 50px;
     color: white;
     font-size: 30px;
}
.s6{
    margin-left: 188px;
    margin-top: 50px;
     color: white;
    
     font-size: 30px;
}
.s7{
    margin-left: 210px;
    margin-top: 50px;
     color: white;
    
     font-size: 30px;
}
.s8{
    margin-left: 466px;
    margin-top: 50px;
     color: white;
     font-size: 30px;
}
.s9{
    margin-left: 167px;
    margin-top: 50px;
     color: white;
     margin-bottom: 300px;
     font-size: 30px;
}
.s10{
    margin-left: 130px;
    margin-top: 50px;
     color: white;
    
     font-size: 30px;
}
/*.con{
    width: 100%;
    
}
.con1{
    width: 45%;
    display: flex;
    display: inline;
    justify-content: center;
    float: left;
    margin-left: 20px;
}
.con2{
    
    width: 45%;
    display: flex;
    display: inline;
    justify-content: center;
    float: right;

}*/

	</style>
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
				String sql = "select seller_id,image,seller_name,contact_no,email from seller where email = '"+str1+"'";
                                PreparedStatement pst= con.prepareStatement(sql);
				ResultSet rs=pst.executeQuery();
				{
					if(rs.next())
					
						
				%>
                               
                                <h1 class="a"><u>Your Profile</u></h1>
                                
                              
			       
                                  <span class="s1">user ID &nbsp; &nbsp;&nbsp; : &nbsp;&nbsp; &nbsp;  <% out.println(rs.getInt(1));%></span>
                                
                                  
                                <span class="s2">Name &nbsp; &nbsp; &nbsp; : &nbsp; &nbsp;&nbsp;  <img src="images/<%=rs.getString(2)%>"></span><br><br><br>
                                 
                                
                               
                                 
                               
                                  
                                <span class="s3">Date of Birth &nbsp; &nbsp; &nbsp;  : &nbsp; &nbsp;&nbsp; <% out.println(rs.getString(3)); %></span>
                                
                               
                               
                                    <span class="s4"> Age &nbsp; &nbsp; &nbsp;   : &nbsp; &nbsp;&nbsp;  <%  out.println(rs.getInt(4)); %>  </span><br><br><br>
                                
                                    
                                    <span class="s5">Email ID &nbsp; &nbsp; &nbsp; : &nbsp; &nbsp;&nbsp;    <%out.println(rs.getString(5)); %> </span>
                                
			        
                                  
				
                        
                                
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