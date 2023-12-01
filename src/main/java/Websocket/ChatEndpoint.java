package Websocket;

import dao.MessageDAO;
import jakarta.websocket.*;
import com.google.gson.Gson;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;
import models.Message;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@ServerEndpoint("/chat")
public class ChatEndpoint {

    private static final Gson gson = new Gson();

    @OnOpen
    public void onOpen(Session session) {
        // Lógica al abrir la conexión
    }

    @OnMessage
    public void onMessage(String jsonMessage, Session session) {
        Message message = gson.fromJson(jsonMessage, Message.class);

        // Asegúrate de tener un mecanismo para identificar la pareja de chat
        String chatKey = generateChatKey(message.getSenderId(), message.getReceiverId());

        MessageDAO messageDAO = new MessageDAO();
        messageDAO.saveMessage(message);

        // Enviar el mensaje solo a la pareja de chat
        for (Session client : session.getOpenSessions()) {
            if (isInChat(client, chatKey)) {
                client.getAsyncRemote().sendText(gson.toJson(message));
            }
        }
    }

    @OnClose
    public void onClose(Session session) {
        // Lógica al cerrar la conexión
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        // Lógica al producirse un error
    }

    // Método para generar una clave única para la pareja de chat
    private String generateChatKey(int userId1, int userId2) {
        List<Integer> userIds = Arrays.asList(userId1, userId2);
        Collections.sort(userIds);
        return userIds.get(0) + "_" + userIds.get(1);
    }

    // Método para verificar si la sesión pertenece a la pareja de chat
    private boolean isInChat(Session session, String chatKey) {
        // Implementa lógica para verificar si la sesión pertenece a la pareja de chat
        // Puedes almacenar esta información en una estructura de datos en memoria
        // (por ejemplo, un ConcurrentHashMap) o en una base de datos según tus necesidades.
        // Retorna true si la sesión pertenece al chat, de lo contrario, false.
        // Ten en cuenta que esta implementación es básica y podrías mejorarla según tus requisitos.
        return true;  // Actualiza esto con la lógica real de verificación.
    }
}
