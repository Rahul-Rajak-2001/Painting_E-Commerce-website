<%@page import="java.time.format.DateTimeFormatter" %>
<%@page import="java.time.LocalDateTime" %>
<%@page import="java.sql.*" %>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");
    int seller_id = Integer.parseInt(request.getParameter("seller_id"));

    String sql = "SELECT sender, message, timestamp FROM ( " +
                 "SELECT 'admin' AS sender, message, timestamp FROM adminmessageseller WHERE seller_id = ? " +
                 "UNION " +
                 "SELECT 'seller' AS sender, message, timestamp FROM sellermessage WHERE seller_id = ? " +
                 ") AS messages ORDER BY timestamp ASC";
    PreparedStatement pst = con.prepareStatement(sql);
    pst.setInt(1, seller_id);
    pst.setInt(2, seller_id);
    ResultSet rs = pst.executeQuery();
    while (rs.next()) {
        String sender = rs.getString("sender");
        String message = rs.getString("message");
        Timestamp timestamp = rs.getTimestamp("timestamp");
        LocalDateTime messageTime = timestamp.toLocalDateTime();
        String formattedTime = messageTime.format(DateTimeFormatter.ofPattern("HH:mm"));
        String messageClass = sender.equals("admin") ? "admin-message" : "seller-message";
%>
<div class="message <%= messageClass %>">
    <%= message %>
    <div class="message-metadata">
        <span class="message-timestamp"><%= formattedTime %></span>
    </div>
</div>
<%
    }
    con.close();
} catch (Exception e) {
    out.println(e);
}
%>