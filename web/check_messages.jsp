<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.io.*, java.util.*, java.sql.*"%>
<%@page contentType="text/html"%>
<%
    try {
        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");
        int customerId = Integer.parseInt(request.getParameter("customerId"));

        // Query for new messages
        String sql = "SELECT sender, message, timestamp FROM messages WHERE cust_id = ? AND timestamp > ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, customerId);
        pst.setTimestamp(2, Timestamp.valueOf(request.getParameter("lastTimestamp")));
        ResultSet rs = pst.executeQuery();

        // Construct JSON response
        JSONArray messagesArray = new JSONArray();
        while (rs.next()) {
            JSONObject messageObj = new JSONObject();
            messageObj.put("sender", rs.getString("sender"));
            messageObj.put("message", rs.getString("message"));
            messageObj.put("timestamp", rs.getTimestamp("timestamp").toString());
            messagesArray.put(messageObj);
        }

        // Close database connection
        con.close();

        // Send JSON response
        out.println(messagesArray.toString());
    } catch (Exception e) {
        out.println(e);
    }
%>
