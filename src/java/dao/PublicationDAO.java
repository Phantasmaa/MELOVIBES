package dao;

import models.Publication;
import models.User; // Asegúrate de importar la clase User
import util.Conexion;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PublicationDAO {

    private Connection conexion;

    public PublicationDAO() {
        conexion = Conexion.getConexion();
    }

    public List<Publication> getAllPublications() {
        List<Publication> publications = new ArrayList<>();
        String consulta = "SELECT * FROM Publication";

        try {
            Statement statement = conexion.createStatement();
            ResultSet resultado = statement.executeQuery(consulta);

            while (resultado.next()) {
                Publication publication = mapRowToPublication(resultado);
                publications.add(publication);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return publications;
    }

    public List<Publication> getPublicationsByUserID(int userID) {
        List<Publication> publications = new ArrayList<>();
        String consulta = "SELECT * FROM Publication WHERE UserID = ?";

        try {
            PreparedStatement statement = conexion.prepareStatement(consulta);
            statement.setInt(1, userID);

            ResultSet resultado = statement.executeQuery();

            while (resultado.next()) {
                Publication publication = mapRowToPublication(resultado);
                publications.add(publication);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return publications;
    }

    private Publication mapRowToPublication(ResultSet resultado) throws SQLException {
        UserDAO userDAO = new UserDAO();

        int userID = resultado.getInt("UserID");
        User user = userDAO.getUserByID(userID);

        return new Publication(
                resultado.getInt("PublicationID"),
                resultado.getString("ContentPubli"),
                resultado.getString("ImagePubli"),
                resultado.getBoolean("ActivePubli"),
                resultado.getBoolean("Market"),
                resultado.getTimestamp("Date"),
                userID,
                user
        );
    }
    
    
        public void createPublication(Publication publication) {
        String query = "INSERT INTO Publication (ContentPubli, ImagePubli, ActivePubli, Market, Date, UserID) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement preparedStatement = conexion.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, publication.getContent());
            preparedStatement.setString(2, publication.getImage());
            preparedStatement.setBoolean(3, publication.isActive());
            preparedStatement.setBoolean(4, publication.isMarket());
            preparedStatement.setTimestamp(5, publication.getDate());
            preparedStatement.setInt(6, publication.getUserID());

            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows > 0) {
                // La publicación se insertó correctamente, obtener el ID generado
                try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int publicationID = generatedKeys.getInt(1);
                        publication.setPublicationID(publicationID);
                    } else {
                        throw new SQLException("No se pudo obtener el ID generado para la publicación.");
                    }
                }
            } else {
                throw new SQLException("No se pudo insertar la publicación, ninguna fila afectada.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    
}
