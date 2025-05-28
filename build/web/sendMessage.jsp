<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%
    // Get the message content, sender, and customer ID from the request parameters
    String messageContent = request.getParameter("message");
    String sender = request.getParameter("sender");
    int customerId = Integer.parseInt(request.getParameter("customerId"));

    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish a connection to the database
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");

        // Prepare the SQL statement to insert a new message
        String sql = "INSERT INTO messages (customer_id, message_content, sender) VALUES (?, ?, ?)";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, customerId);
        pst.setString(2, messageContent);
        pst.setString(3, sender);

        // Execute the SQL statement
        pst.executeUpdate();

        // Close the database connection
        con.close();
    } catch (Exception e) {
        // Print any exceptions that occur
        out.println(e);
    }
%>