
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add to Cart Process</title>
<!--    <script>
        function showMessage() {
            alert("Item successfully added to your cart");
        }
    </script>-->
</head>
<body>
<%
    String paintingId = request.getParameter("painting_id");
    String quantity = request.getParameter("quantity");
    String custEmail = (String) session.getAttribute("email"); // Fetching customer email from the session
    int custId = 0;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");
        
        // Fetch customer ID using email
        String getCustomerIdSql = "SELECT cust_id FROM customer WHERE email = ?";
        PreparedStatement getCustIdPst = con.prepareStatement(getCustomerIdSql);
        getCustIdPst.setString(1, custEmail);
        ResultSet custRs = getCustIdPst.executeQuery();
        
        if(custRs.next()) {
            custId = custRs.getInt("cust_id");
        }
        
        String getProductSql = "SELECT * FROM painting WHERE painting_id = ?";
        PreparedStatement getPst = con.prepareStatement(getProductSql);
        getPst.setString(1, paintingId);
        ResultSet rs = getPst.executeQuery();
        
        if(rs.next()) {
            String image = rs.getString("image");
            String paintingName = rs.getString("painting_name");
            String price = rs.getString("price");
            String total = String.valueOf(Integer.parseInt(price) * Integer.parseInt(quantity));

            String sql = "INSERT INTO cart (cust_id, painting_id, image, painting_name, quantity, price, total) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, custId); // Setting customer ID
            pst.setString(2, paintingId);
            pst.setString(3, image);
            pst.setString(4, paintingName);
            pst.setString(5, quantity);
            pst.setString(6, price);
            pst.setString(7, total);
                pst.executeUpdate();
        }
        
        con.close();
    } catch (Exception e) {
       System.out.println(e);
    }
%>
    <script>
//        showMessage();
        window.history.back();
    </script>
</body>
</html>

