package image;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
//import static java.lang.System.out;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/AddSellerImage")
public class AddSellerImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddSellerImage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
             PrintWriter out = response.getWriter();
		out.println("In do post method of Add Image servlet.");
                 
		Part file=request.getPart("image");
               
                String a  = request.getParameter("seller_name");
                //int b = Integer.parseInt(request.getParameter("contact_number"));
                 String b=request.getParameter("contact_number");
        String c = request.getParameter("email");
         String d=request.getParameter("state");
     String e=request.getParameter("city");
     String f=request.getParameter("Address");
     int s = Integer.parseInt(request.getParameter("pincode"));
        String g = request.getParameter("password");
        String h = request.getParameter("confirm_password");
		
		String ImageFileName=file.getSubmittedFileName();  // get selected image file name
		out.println("Selected Image File Name : "+ ImageFileName);
                
//                String FileName=file.getSubmittedFileName();  // get selected image file name
//		out.println("Selected Image File Name : "+FileName);
                
                
                
		
		String uploadPath="C:/Users/Rahul/OneDrive/Documents/NetBeansProjects/Painting/web/images/"+ImageFileName;  // upload path where we have to upload our actual image
		//String uploadPath="C:/Users/Rahul/OneDrive/Documents/NetBeansProjects/pro/web/images/"+FileName;  // upload path where we have to upload our actual image
                //File fileSaveDir = new File(uploadPath);
                out.println("Upload Path : "+uploadPath);
		 
          
		// Uploading our selected image into the images folder
		
		try
		{
		
		FileOutputStream fos=new FileOutputStream(uploadPath);
		InputStream is=file.getInputStream();
		
		byte[] data=new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		
		}
		
		catch(Exception k)
		{
			k.printStackTrace();
		}
		//**********************
		
		//getting database connection (jdbc code)
//		Connection connection=null;
		try 
		{
                     Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting","root","passord.9506");
   
    String sql="insert into seller(image,seller_name,contact_no,email,state, city, address, pincode,password,con_password) values('"+ImageFileName+"','"+a+"', '"+b+"','"+c+"','"+d+"','"+e+"','"+f+"','"+s+"','"+g+"','"+h+"')";
    PreparedStatement pst=con.prepareStatement(sql);
   int j=pst.executeUpdate();
   if(j>0)
			{
                            
//				out.println("Image added into database successfully.");
                            response.sendRedirect("seller login.jsp");
			}
			
			else
			{
				out.println("Failed to upload image.");
			}
    }
        
                    
                    
                    
                    
//              try 
//		{      
//                    
//                    
//                    
//                    
//                    
//                       
//          
//			Class.forName("com.mysql.cj.jdbc.Driver");
//			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","passord.9506");
//			PreparedStatement stmt;
//			String query="insert into image(imageFileName) values(?)";
//			stmt=connection.prepareStatement(query);
//                        stmt.setString(1,ImageFileName);
//                        //stmt.setString(1,FileName);   
//			int row=stmt.executeUpdate(); // it returns no of rows affected.
//			
//			if(row>0)
//			{
//				out.println("Image added into database successfully.");
//			}
//			
//			else
//			{
//				out.println("Failed to upload image.");
//			}
//			
//			
//		}
		catch (Exception k)
		{
			out.println(k);
		}
		
	}

}