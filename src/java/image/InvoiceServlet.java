package image;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.*;

@WebServlet("/invoice")
public class InvoiceServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=invoice_" + orderId + ".pdf");
        

        try (OutputStream out = response.getOutputStream()) {
            Document document = new Document();
            PdfWriter writer = PdfWriter.getInstance(document, out);
            document.open();

            // Retrieve order details from the database
            Connection con = null;
            PreparedStatement pst = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");

                String sql = "SELECT o.order_id, o.order_date, o.painting_name, o.price, o.status, o.quantity, s.seller_name, c.name, c.email " +
                             "FROM `order` o " +
                             "JOIN painting p ON o.painting_name = p.painting_name " +
                             "JOIN seller s ON p.seller_id = s.seller_id " +
                             "JOIN customer c ON o.cust_id = c.cust_id " +
                             "WHERE o.order_id = ?";
                pst = con.prepareStatement(sql);
                pst.setInt(1, orderId);
                rs = pst.executeQuery();

                if (rs.next()) {
                    // Invoice header
                    Paragraph title = new Paragraph("Invoice", new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD));
                    title.setAlignment(Element.ALIGN_CENTER);
                    document.add(title);

                    document.add(new Paragraph("Order ID: " + rs.getInt("order_id")));
                    document.add(new Paragraph("Order Date: " + rs.getString("order_date")));
                    document.add(new Paragraph("Customer Name: " + rs.getString("name")));
                    document.add(new Paragraph("Customer Email: " + rs.getString("email")));
                    document.add(new Paragraph(" ")); // Empty line for spacing

                    // Order details
                    PdfPTable table = new PdfPTable(5);
                    table.addCell("Painting Name");
                    table.addCell("Seller Name");
                    table.addCell("Price");
                    table.addCell("Quantity");
                    table.addCell("Total");

                    table.addCell(rs.getString("painting_name"));
                    table.addCell(rs.getString("seller_name"));
                    table.addCell(String.valueOf(rs.getDouble("price")));
                    table.addCell(String.valueOf(rs.getInt("quantity")));
                    table.addCell(String.valueOf(rs.getDouble("price") * rs.getInt("quantity")));

                    document.add(table);

                    // Footer
                    document.add(new Paragraph(" "));
                    document.add(new Paragraph("Thank you for your purchase!"));
                } else {
                    // Handle the case where no order is found
                    document.add(new Paragraph("Order not found."));
                }
            } catch (SQLException | DocumentException | ClassNotFoundException e) {
                e.printStackTrace();
            } finally {
                // Close resources
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (pst != null) {
                    try {
                        pst.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (con != null) {
                    try {
                        con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }

            document.close();
            writer.close();
        } catch (DocumentException e) {
            e.printStackTrace();
        }
    }
}