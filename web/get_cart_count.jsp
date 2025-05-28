<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<% 
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting", "root", "passord.9506");
        String custEmail = (String) session.getAttribute("email");
        String getCustomerIdSql = "SELECT cust_id FROM customer WHERE email = ?";
        PreparedStatement getCustIdPst = con.prepareStatement(getCustomerIdSql);
        getCustIdPst.setString(1, custEmail);
        ResultSet custRs = getCustIdPst.executeQuery();
        if (custRs.next()) {
            int custId = custRs.getInt("cust_id");
            String sql = "SELECT COUNT(*) as count FROM cart WHERE cust_id = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, custId);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                out.print(rs.getInt("count"));
            }
        }
        con.close();
    } catch (Exception e) {
        System.out.println(e);
        out.print("0"); // Return 0 if there's an error
    }
%>
