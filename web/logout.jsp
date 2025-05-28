<%@page import="javax.servlet.http.HttpSession"%>
<%
    // Invalidate the session
    session.invalidate();
    // Redirect to the login page or index page
    response.sendRedirect("index.jsp");
%>
