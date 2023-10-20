<%
    HttpSession s = request.getSession();
    String logueado = null;
    logueado = (String) s.getAttribute("logueado");
    String currentURL = request.getRequestURI();
    if (currentURL.endsWith("/log/login.jsp") || currentURL.endsWith("/log/register.jsp") || currentURL.endsWith("/log/restorePassword.jsp")) {
    } else if (logueado != null && logueado.equals("OK")) {
    } else {
        response.sendRedirect("../log/login.jsp");
    }
%>
