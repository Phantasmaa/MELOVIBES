<%
    HttpSession s = request.getSession();
    String logueado = null;
    logueado = (String) s.getAttribute("logueado");

    if (logueado != null && logueado.equals("OK")) {
        response.sendRedirect("../user/feed.jsp");
    } else {
        
    }
%>