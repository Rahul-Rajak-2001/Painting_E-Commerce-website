<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String cartId = request.getParameter("cart_id");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");
        String sql = "delete from cart where cart_id = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, cartId);
        pst.executeUpdate();
        con.close();
      response.sendRedirect("add_to_cart.jsp");
%>
<script>
  
</script>

<%


    } catch (Exception e) {
       System.out.println(e);
    }
%>




