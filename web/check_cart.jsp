<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%
    int custId = Integer.parseInt(request.getParameter("cust_id"));
    int itemCount = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");
        
        String sql = "SELECT COUNT(*) as count FROM cart WHERE cust_id = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, custId);
        ResultSet rs = pst.executeQuery();
        
        if(rs.next()) {
            itemCount = rs.getInt("count");
        }
        
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    // Return cart items count as JSON
    out.println("{\"count\": " + itemCount + "}");
%>
