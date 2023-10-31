document.getElementById("desconectar").addEventListener("click", function() {
          var xhr = new XMLHttpRequest();
          xhr.open("GET", "../../util/logOut.jsp", true);
          xhr.onload = function() {
            if (xhr.status === 200) {
              window.location.href = "../log/login.jsp";
            } else {
              alert("Error al cerrar la sesión");
            }
          };
          xhr.send();
        });