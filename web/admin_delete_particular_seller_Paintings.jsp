<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int painting_id = Integer.parseInt(request.getParameter("painting_id"));
    String sellerId = request.getParameter("seller_id"); // Assuming you have the seller_id parameter
//     String sellerId = request.getParameter("seller_id");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");
        String sql = "DELETE FROM painting WHERE painting_id = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, painting_id);
        pst.executeUpdate();
        con.close();

        // Redirect to the View_particular_seller_Paintings.jsp with the seller_id parameter
        String redirectURL = "View_particular_seller_Paintings.jsp?seller_id=" + sellerId;
        response.sendRedirect(redirectURL);
    } catch (Exception e) {
        out.println(e);
    }
%>