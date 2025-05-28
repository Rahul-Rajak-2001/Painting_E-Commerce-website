<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.itextpdf.text.*"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
    // Retrieve the order ID from the request parameter
    int orderId = Integer.parseInt(request.getParameter("orderId"));

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish a connection to the database
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");

        // Retrieve order details from the database
        String sql = "SELECT o.order_id, c.customer_name, c.email, o.painting_name, o.quantity, o.price, p.date, p.amount " +
                     "FROM `order` o " +
                     "JOIN customer c ON o.cust_id = c.cust_id " +
                     "JOIN payment p ON o.order_id = p.order_id " +
                     "WHERE o.order_id = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, orderId);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            // Set the content type and disposition for the PDF file
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=\"invoice_" + orderId + ".pdf\"");

            // Create a PDF document
            Document document = new Document();
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            PdfWriter.getInstance(document, baos);

            // Open the document
            document.open();

//            // Add content to the document
//            document.add(new Paragraph("Invoice"));
//            document.add(new Paragraph("Order ID: " + orderId));
            
            
            
              document.add(new Paragraph("Invoice"));
            document.add(new Paragraph("Order ID: " + orderId));
            document.add(new Paragraph("Customer Name: " + rs.getString("customer_name")));
            document.add(new Paragraph("Email: " + rs.getString("email")));
            document.add(new Paragraph("Painting Name: " + rs.getString("painting_name")));
            document.add(new Paragraph("Quantity: " + rs.getInt("quantity")));
            document.add(new Paragraph("Price: " + rs.getDouble("price")));
            document.add(new Paragraph("Payment Date: " + rs.getString("date")));
            document.add(new Paragraph("Total Amount: " + rs.getDouble("amount")));
            // ... (rest of the code to add order details to the PDF)

            // Close the document
            document.close();

            // Write the PDF document to the response output stream
            baos.writeTo(response.getOutputStream());
        } else {
            // Order not found, display a message
            response.setContentType("text/html");
            PrintWriter o = response.getWriter();
            out.println("<html><body><p>Order not found.</p></body></html>");
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
        response.setContentType("text/html");
        PrintWriter o = response.getWriter();
        out.println("<html><body><p>Error: " + e.getMessage() + "</p></body></html>");
    }
%>