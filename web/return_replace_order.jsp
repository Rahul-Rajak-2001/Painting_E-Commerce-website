<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int orderId = Integer.parseInt(request.getParameter("order_id"));
    String action = request.getParameter("action");
    String reason = request.getParameter("reason");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");

        // Update the order status to "Returned" or "Replacement Requested"
        String newStatus = action.equals("Return") ? "Returned" : "Replacement Requested";
        String updateSql = "UPDATE `order` SET status = ? WHERE order_id = ?";
        PreparedStatement pst = con.prepareStatement(updateSql);
        pst.setString(1, newStatus);
        pst.setInt(2, orderId);
        int result = pst.executeUpdate();

        if (result > 0) {
            out.println(action + " request submitted successfully.");
        } else {
            out.println("Failed to submit " + action.toLowerCase() + " request.");
        }

        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>