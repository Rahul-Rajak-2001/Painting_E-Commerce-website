<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int orderId = Integer.parseInt(request.getParameter("order_id"));
    String reason = request.getParameter("reason");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");

        // Check if the order is eligible for cancellation
        String checkSql = "SELECT status FROM `order` WHERE order_id = ?";
        PreparedStatement checkPst = con.prepareStatement(checkSql);
        checkPst.setInt(1, orderId);
        ResultSet rs = checkPst.executeQuery();

        if (rs.next()) {
            String status = rs.getString("status");
            if (status.equals("Confirm") || status.equals("Shipped")) {
                // Update the order status to "Cancelled"
                String updateSql = "UPDATE `order` SET status = 'Cancelled' WHERE order_id = ?";
                PreparedStatement updatePst = con.prepareStatement(updateSql);
                updatePst.setInt(1, orderId);
                int result = updatePst.executeUpdate();

                if (result > 0) {
                    out.println("Order cancelled successfully.");
                } else {
                    out.println("Failed to cancel the order.");
                }
            } else {
                out.println("This order cannot be cancelled.");
            }
        } else {
            out.println("Order not found.");
        }

        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>