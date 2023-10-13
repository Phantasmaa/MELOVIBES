document.getElementById("registroForm").addEventListener("submit", function(event) {
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
    var mensajeError = document.getElementById("mensajeError");

    if (password !== confirmPassword) {
        mensajeError.textContent = "Las contraseñas no coinciden.";
        event.preventDefault(); // Evita que se envíe el formulario
    }
});

function clicked(e)
{
    if(alert("Registro exitoso")) {
        e.preventDefault();
    }
}