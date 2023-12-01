package dao;

import models.Message;
import models.User;
import util.Conexion;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MessageDAO {

    private Connection conexion;

    public MessageDAO() {
        conexion = Conexion.getConexion();
    }

    public List<Message> getMessages(int senderId, int receiverId) {
        List<Message> messages = new ArrayList<>();
        try {
            String query = "SELECT * FROM Message WHERE (SenderID = ? AND RecieverID = ?) OR (SenderID = ? AND RecieverID = ?) ORDER BY Date ASC";
            try (PreparedStatement preparedStatement = conexion.prepareStatement(query)) {
                preparedStatement.setInt(1, senderId);
                preparedStatement.setInt(2, receiverId);
                preparedStatement.setInt(3, receiverId);
                preparedStatement.setInt(4, senderId);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        Message message = new Message();
                        message.setMessageId(resultSet.getInt("MessageID"));
                        message.setSenderId(resultSet.getInt("SenderID"));
                        message.setReceiverId(resultSet.getInt("RecieverID"));
                        message.setContent(resultSet.getString("Content"));
                        message.setDate(resultSet.getDate("Date"));
                        messages.add(message);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return messages;
    }

    public void saveMessage(Message message) {
        try {
            String query = "INSERT INTO Message (SenderID, RecieverID, Content, Date) VALUES (?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = conexion.prepareStatement(query)) {
                preparedStatement.setInt(1, message.getSenderId());
                preparedStatement.setInt(2, message.getReceiverId());
                preparedStatement.setString(3, message.getContent());
                preparedStatement.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Message> getLatestMessages(int userId) {
        List<Message> latestMessages = new ArrayList<>();

        try {
            String sql = "SELECT MessageID, SenderID, RecieverID, Content, Date " +
                    "FROM (" +
                    "    SELECT MessageID, SenderID, RecieverID, Content, Date, " +
                    "           ROW_NUMBER() OVER (PARTITION BY LEAST(SenderID, RecieverID), GREATEST(SenderID, RecieverID) ORDER BY Date DESC) AS row_num " +
                    "    FROM Message " +
                    ") AS ranked " +
                    "WHERE row_num = 1 AND (SenderID = ? OR RecieverID = ?)";

            try (PreparedStatement statement = conexion.prepareStatement(sql)) {
                statement.setInt(1, userId);
                statement.setInt(2, userId);

                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        Message message = new Message();
                        message.setMessageId(resultSet.getInt("MessageID"));
                        message.setSenderId(resultSet.getInt("SenderID"));
                        message.setReceiverId(resultSet.getInt("RecieverID"));
                        message.setContent(resultSet.getString("Content"));
                        message.setDate(resultSet.getDate("Date"));

                        latestMessages.add(message);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejar la excepción según tus necesidades
        }

        return latestMessages;
    }

}

