package dao;

import models.Comment;
import models.User;
import util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {
    private Connection conexion;
    public CommentDAO() {
        conexion = Conexion.getConexion();
    }
    public static int getNumberOfComments(int publicationID) {
        int numComments = 0;

        try (Connection connection = Conexion.getConexion();
             PreparedStatement statement = connection.prepareStatement("SELECT COUNT(*) AS NumComments FROM Comment WHERE PublicationID = ?")) {
            statement.setInt(1, publicationID);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                numComments = resultSet.getInt("NumComments");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return numComments;
    }


    public List<Comment> getCommentsByPublicationID(int publicationID) {
        List<Comment> comments = new ArrayList<>();
        String query = "SELECT * FROM Comment WHERE PublicationID = ?";

        try {
            PreparedStatement statement = conexion.prepareStatement(query);
            statement.setInt(1, publicationID);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Comment comment = mapRowToComment(resultSet);
                comments.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return comments;
    }

    public void createComment(Comment comment) {
        String query = "INSERT INTO Comment (ContentComment, PublicationID, UserID, Date) VALUES (?, ?, ?, ?)";

        try (PreparedStatement preparedStatement = conexion.prepareStatement(query)) {
            preparedStatement.setString(1, comment.getContentComment());
            preparedStatement.setInt(2, comment.getPublicationID());
            preparedStatement.setInt(3, comment.getUserID());
            preparedStatement.setTimestamp(4, comment.getDate());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    private Comment mapRowToComment(ResultSet resultSet) throws SQLException {
        Comment comment = new Comment();
        comment.setCommentID(resultSet.getInt("CommentID"));
        comment.setContentComment(resultSet.getString("ContentComment"));
        comment.setPublicationID(resultSet.getInt("PublicationID"));
        comment.setUserID(resultSet.getInt("UserID"));
        comment.setDate(resultSet.getTimestamp("Date"));


        UserDAO userDAO = new UserDAO();
        int userID = comment.getUserID();
        User user = userDAO.getUserByID(userID);
        comment.setUser(user);

        return comment;
    }

    
}
