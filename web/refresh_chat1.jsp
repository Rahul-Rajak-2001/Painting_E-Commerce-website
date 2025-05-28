<%@page import="java.sql.*" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@page import="java.time.LocalDateTime" %>

<%
try {
    // Establishing database connection
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");
    int sellerId = (Integer) session.getAttribute("sellerId");

    // Retrieve both admin and customer messages
    String sql = "SELECT 'admin' AS sender, seller_id, seller_name, message, timestamp FROM adminmessageseller WHERE seller_id = ? " +
                 "UNION " +
                 "SELECT 'seller' AS sender, seller_id, seller_name, message, timestamp FROM sellermessage WHERE seller_id = ? " +
                 "ORDER BY timestamp ASC"; // Order by timestamp in ascending order
    PreparedStatement pst = con.prepareStatement(sql);
    pst.setInt(1, sellerId);
    pst.setInt(2, sellerId);
    ResultSet rs = pst.executeQuery();
    while (rs.next()) {
        String sender = rs.getString("sender");
        String message = rs.getString("message");
        Timestamp timestamp = rs.getTimestamp("timestamp");
        LocalDateTime messageTime = timestamp.toLocalDateTime();
        String formattedTime = messageTime.format(DateTimeFormatter.ofPattern("HH:mm"));
        if (sender.equals("admin")) {
%>
<div class="message admin-message">
    <%= message %>
    <div class="message-metadata">
        <span class="message-timestamp"><%= formattedTime %></span>
    </div>
</div>
<%
        } else if (sender.equals("seller")) {
%>
<div class="message customer-message">
    <%= message %>
    <div class="message-metadata">
        <span class="message-timestamp"><%= formattedTime %></span>
    </div>
</div>
<%
        }
    }

    con.close();
} catch (Exception e) {
    out.println(e);
}
%>