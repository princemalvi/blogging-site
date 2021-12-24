<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%  
    session.invalidate();
    response.sendRedirect("login.jsp?logout=1");
%> 