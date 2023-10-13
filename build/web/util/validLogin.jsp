<%
String user = request.getParameter("user");
String password = request.getParameter("password");

String[] users = {"12", "admin"};
String[] passwords = {"12", "admin"};

String mensaje = "";
boolean userFound = false;

for (int i = 0; i < users.length; i++) {
    if (user != null && password != null && user.equals(users[i]) && password.equals(passwords[i])) {
        HttpSession sesion = request.getSession();
        sesion.setAttribute("logueado", "OK");
        mensaje = "activo";
        userFound = true;
        // Enviar a la página deseada
        if (user.equals("12")) {
            response.sendRedirect("../views/user/feed.jsp");
        } else if (user.equals("admin")) {
            response.sendRedirect("../views/admin/adminPorfiles.jsp");
        }
        break;
    }
}

if (!userFound) {
    %>
    <script>
        alert("Error de contraseña");
    </script>
    <%
    response.sendRedirect("../views/log/login.jsp");}
%>




