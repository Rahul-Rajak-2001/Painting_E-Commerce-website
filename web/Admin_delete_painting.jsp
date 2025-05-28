<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   
       int painting_id = Integer.parseInt(request.getParameter("painting_id"));
//     int cust_id = (Integer)session.getAttribute("cust_id");
     
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");
        String sql = "delete from painting where painting_id = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, painting_id);
        pst.executeUpdate();
//        con.close();
      response.sendRedirect("admin-view_all_paintings.jsp");
%>


<%


    } catch (Exception e) {
       System.out.println(e);
    }
%>




