<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
int sellerId = (Integer) session.getAttribute("sellerId"); // Retrieve the seller ID from the session

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");

    String sql = "SELECT o.order_id, o.order_date, o.painting_name, o.price, o.status, o.quantity, s.seller_name, p.image, o.cust_id " +
                 "FROM `order` o " +
                 "JOIN painting p ON o.painting_name = p.painting_name " +
                 "JOIN seller s ON p.seller_id = s.seller_id " +
                 "WHERE s.seller_id = ?";

    PreparedStatement pst = con.prepareStatement(sql);
    pst.setInt(1, sellerId);
    ResultSet rs = pst.executeQuery();

    while (rs.next()) {
%>
        <tr>
          <td><%= rs.getInt("order_id") %></td>
                 <td><%= rs.getInt("cust_id") %></td>
                
                
                <td><img src="images/<%= rs.getString("image") %>" alt="<%= rs.getString("painting_name") %>" width="200" height="200"></td>
                <td><%= rs.getString("painting_name") %></td>
                <td><%= rs.getDouble("price") %></td>
                <td><%= rs.getInt("quantity") %></td>
                <td><%= rs.getString("seller_name") %></td>
                 <td><%= rs.getString("order_date") %></td>
                  <td><%= rs.getString("status") %></td>
        </tr>
<%
    }

    con.close();
} catch (Exception e) {
    out.println(e);
}
%>





















