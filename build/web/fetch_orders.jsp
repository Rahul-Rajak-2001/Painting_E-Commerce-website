<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");
    String sql = "SELECT o.order_id, o.order_date, o.painting_name, o.price, o.quantity, s.seller_name, o.Painting_image, o.cust_id, o.status " +
                 "FROM `order` o " +
                 "JOIN painting p ON o.painting_name = p.painting_name " +
                 "JOIN seller s ON p.seller_id = s.seller_id " +
                 "ORDER BY o.order_id ASC";
    PreparedStatement pst = con.prepareStatement(sql);
    ResultSet rs = pst.executeQuery();
    while (rs.next()) {
        String status = rs.getString("status");
        int orderId = rs.getInt("order_id");
%>
        <tr>
            <td><%= orderId %></td>
            <td><%= rs.getInt("cust_id") %></td>
            <td><img src="images/<%= rs.getString("Painting_image") %>" alt="<%= rs.getString("painting_name") %>" width="200" height="200"></td>
            <td><%= rs.getString("painting_name") %></td>
            <td><%= rs.getDouble("price") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td><%= rs.getString("seller_name") %></td>
            <td><%= rs.getString("order_date") %></td>
            <td>
                <% if ("Confirm".equalsIgnoreCase(status)) { %>
                    <select id="status_<%= orderId %>" onchange="updateStatus(<%= orderId %>)">
                        <option value="Confirm" selected>Confirm</option>
                        <option value="Shipped">Shipped</option>
                    </select>
                <% } else if ("Shipped".equalsIgnoreCase(status)) { %>
                    <select id="status_<%= orderId %>" onchange="updateStatus(<%= orderId %>)">
                        <option value="Shipped" selected>Shipped</option>
                        <option value="Delivered">Delivered</option>
                    </select>
                <% } else { %>
                    <%= status %>
                <% } %>
            </td>
        </tr>
<%
    }
    con.close();
} catch (Exception e) {
    out.println(e);
}
%>