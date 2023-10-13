<%
    HttpSession s = request.getSession();
    String logueado = null;
    logueado = (String) s.getAttribute("logueado");

    // Verificar si ya se encuentra en la p�gina de inicio de sesi�n
    String currentURL = request.getRequestURI();
    if (currentURL.endsWith("/log/login.jsp")) {
        // No redirigir si ya est�s en la p�gina de inicio de sesi�n
    } else if (logueado != null && logueado.equals("OK")) {
        // El usuario ha iniciado sesi�n, contin�a
    } else {
        // Redirigir al usuario a la p�gina de inicio de sesi�n
        response.sendRedirect("../log/login.jsp");
    }
%>
