<%@ page import="models.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Collections" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="models.Message" %>
<%@ page import="dao.MessageDAO" %>

<%
    User user = (User) session.getAttribute("usuario");
    UserDAO userDAO = new UserDAO();
    int receiverId = Integer.parseInt(request.getParameter("sendto")); // Ajusta esto según cómo obtienes el ID del destinatario
    User userToSend = userDAO.getUserByID(receiverId);

    MessageDAO messageDAO = new MessageDAO();
    List<Message> messages = messageDAO.getMessages(user.getUserID(), receiverId);

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../../content/Images/Administracion/logoMeloVibeBrowserTab.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <link rel="stylesheet" href="../../content/Styles/Usuario/feedStyles.css">
    <link rel="stylesheet" href="../../content/Styles/Usuario/chatStyles.css">


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    <title>Chat | MeloVibe</title>
</head>
<body>
<div class="row vh-100">
    <%@include file="../menus/leftMenuEmpty.jsp" %>
    <div class="container-fluid col-md-8" id="contenido">
        <div id="cabecera" class="row justify-content-between">
             <div id="backBtn" class="col-2 text-start" onclick="goBack()" style="cursor: pointer;">
                <i class="bi bi-arrow-left-circle"></i>  Atrás
            </div>
            <div class="col-3"> </div>
            <div class="col-4 text-end mb-3" id="create">
                Chat
            </div>
        </div>

        <div class="receptor mt-2">
            <img src="<%=userToSend.getUserImage()%>" alt="Foto" class="img-fluid rounded-circle mt-2" width="50" onclick="location.href ='OtherProfile?userID='+receiverId" style="cursor: pointer;">
            <%=userToSend.getUserName()%> - <%=userToSend.getFirstName()%>
        </div>

        <div id="chatMessages"></div>
        <%
            for (Message message : messages) {
                String mensajeClass = (message.getSenderId() == user.getUserID()) ? "sent-message" : "received-message";
        %>
        <div class="<%= mensajeClass %>">
            <p><%= message.getContent() %></p>
            <!--<p><%//new SimpleDateFormat("yyyy-MM-dd").format(message.getDate()) %></p>-->
        </div>
        <%
            }
        %>
        <div class="row custom-row justify-content-center mt-4">
            <div class="input-group mb-3">
                <input type="text" class="form-control mensaje-input" placeholder="Escribe un comentario" aria-label="Escribe un comentario" aria-describedby="button-addon2" id="messageInput">
                <button class="btn btn-primary mt-1 boton" type="button" onclick="sendMessage()">Enviar</button>
            </div>
        </div>
    </div>
    <%@include file="../menus/rightMenuAux.jsp" %>
</div>

<script>
    const socket = new WebSocket("ws://localhost:8080/MELOVIBES/chat");

    socket.onopen = (event) => {
        console.log("WebSocket connection opened:", event);
    };

    socket.onmessage = (event) => {
        console.log("WebSocket message received:", event);
        const data = JSON.parse(event.data);
        console.log("Parsed data:", data);

        // Mostrar el mensaje en el chat
        showChatMessage(data);
    };

    socket.onclose = (event) => {
        console.log("WebSocket connection closed:", event);
    };

    socket.onerror = (event) => {
        console.error("WebSocket error:", event);
    };

    function showChatMessage(message) {
        const chatMessages = document.getElementById('chatMessages');

        // Verificar si el mensaje es para el usuario actual
        const isSentByCurrentUser = message.senderId === <%= user.getUserID() %>;

        const messageElement = document.createElement('div');
        const timestamp = new Date().toLocaleTimeString();

        // Aplicar estilos diferentes según si el mensaje fue enviado por el usuario actual
        if (isSentByCurrentUser) {
            messageElement.classList.add('sent-message'); // Agrega una clase para mensajes enviados por el usuario
        } else {
            messageElement.classList.add('received-message');
        }

        messageElement.textContent = message.content;

        chatMessages.insertBefore(messageElement, chatMessages.firstChild);
    }





    function sendMessage() {
        const messageInput = document.getElementById('messageInput');
        const message = messageInput.value;

        const messageObject = {
            senderId: <%= user.getUserID() %>,
            receiverId: <%= receiverId %>,
            content: message
        };

        console.log("Receiver ID:", <%= receiverId %>); // Agrega esta línea para imprimir el receiverId
        socket.send(JSON.stringify(messageObject));
        messageInput.value = '';
        console.log("Mensaje enviado");
    }

     function goBack() {
                          window.history.back();
                      }

</script>

</body>
</html>
