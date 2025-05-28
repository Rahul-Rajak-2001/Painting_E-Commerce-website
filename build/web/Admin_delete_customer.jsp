<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   
       int cust_id = Integer.parseInt(request.getParameter("cust_id"));
//     int cust_id = (Integer)session.getAttribute("cust_id");
     
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");
        String sql = "delete from customer where cust_id = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, cust_id);
        pst.executeUpdate();
//        con.close();
      response.sendRedirect("admin-view_all_customers.jsp");
%>


<%


    } catch (Exception e) {
       System.out.println(e);
    }
%>




