<%
    HttpSession s = request.getSession();
    String logueado = null;
    logueado = (String) s.getAttribute("logueado");

    // Verificar si ya se encuentra en la página de inicio de sesión
    String currentURL = request.getRequestURI();
    if (currentURL.endsWith("/log/login.jsp")) {
        // No redirigir si ya estás en la página de inicio de sesión
    } else if (logueado != null && logueado.equals("OK")) {
        // El usuario ha iniciado sesión, continúa
    } else {
        // Redirigir al usuario a la página de inicio de sesión
        response.sendRedirect("../log/login.jsp");
    }
%>
