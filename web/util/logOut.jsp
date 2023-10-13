<%
    HttpSession sesion = request.getSession();
    sesion.removeAttribute("logueado"); 
    sesion.invalidate();
%>

