package dao;

import models.Publication;
import models.PublicationMarket;
import models.PublicationNormal;
import models.User;
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
                Publication publication = mapRowToPublication(resultado, new Publication());
                publications.add(publication);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return publications;
    }

    public List<PublicationNormal> getAllNormalPublications() {
        List<PublicationNormal> normalPublications = new ArrayList<>();
        String query = "SELECT * FROM Publication p INNER JOIN NormalPubli n ON p.PublicationID = n.PublicationID";

        try {
            Statement statement = conexion.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                PublicationNormal normalPublication = mapRowToPublication(resultSet, new PublicationNormal());
                normalPublications.add(normalPublication);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return normalPublications;
    }

    public List<PublicationMarket> getAllMarketPublications() {
        List<PublicationMarket> marketPublications = new ArrayList<>();
        String query = "SELECT * FROM Publication p INNER JOIN MarketPubli m ON p.PublicationID = m.PublicationID";

        try {
            Statement statement = conexion.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                PublicationMarket marketPublication = mapRowToPublication(resultSet, new PublicationMarket());
                marketPublication.setTitle(resultSet.getString("Tittle"));
                marketPublication.setPrice(resultSet.getDouble("Price"));

                marketPublications.add(marketPublication);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return marketPublications;
    }

    public List<Publication> getPublicationsByUserID(int userID) {
        List<Publication> publications = new ArrayList<>();
        String consulta = "SELECT * FROM Publication WHERE UserID = ?";

        try {
            PreparedStatement statement = conexion.prepareStatement(consulta);
            statement.setInt(1, userID);

            ResultSet resultado = statement.executeQuery();

            while (resultado.next()) {
                Publication publication = mapRowToPublication(resultado, new Publication());
                publications.add(publication);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return publications;
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

    private <T extends Publication> T mapRowToPublication(ResultSet resultSet, T publication) throws SQLException {
        UserDAO userDAO = new UserDAO();

        int userID = resultSet.getInt("UserID");
        User user = userDAO.getUserByID(userID);

        publication.setPublicationID(resultSet.getInt("PublicationID"));
        publication.setContent(resultSet.getString("ContentPubli"));
        publication.setImage(resultSet.getString("ImagePubli"));
        publication.setActive(resultSet.getBoolean("ActivePubli"));
        publication.setMarket(resultSet.getBoolean("Market"));
        publication.setDate(resultSet.getTimestamp("Date"));
        publication.setUserID(userID);
        publication.setUser(user);

        return publication;
    }

    public List<PublicationNormal> getNormalPublicationsByUserID(int userID) {
        List<PublicationNormal> normalPublications = new ArrayList<>();
        String query = "SELECT * FROM Publication p INNER JOIN NormalPubli n ON p.PublicationID = n.PublicationID WHERE p.UserID = ?";

        try {
            PreparedStatement statement = conexion.prepareStatement(query);
            statement.setInt(1, userID);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                PublicationNormal normalPublication = mapRowToPublication(resultSet, new PublicationNormal());
                normalPublications.add(normalPublication);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return normalPublications;
    }

    public List<PublicationMarket> getMarketPublicationsByUserID(int userID) {
        List<PublicationMarket> marketPublications = new ArrayList<>();
        String query = "SELECT * FROM Publication p INNER JOIN MarketPubli m ON p.PublicationID = m.PublicationID WHERE p.UserID = ?";

        try {
            PreparedStatement statement = conexion.prepareStatement(query);
            statement.setInt(1, userID);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                PublicationMarket marketPublication = mapRowToPublication(resultSet, new PublicationMarket());
                marketPublication.setTitle(resultSet.getString("Tittle"));
                marketPublication.setPrice(resultSet.getDouble("Price"));

                marketPublications.add(marketPublication);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return marketPublications;
    }

    public void createNormalPublication(PublicationNormal normalPublication) {

        String query = "INSERT INTO Publication (ContentPubli, ImagePubli, ActivePubli, Market, Date, UserID) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement preparedStatement = conexion.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, normalPublication.getContent());
            preparedStatement.setString(2, normalPublication.getImage());
            preparedStatement.setBoolean(3, normalPublication.isActive());
            preparedStatement.setBoolean(4, false); 
            preparedStatement.setTimestamp(5, normalPublication.getDate());
            preparedStatement.setInt(6, normalPublication.getUserID());

            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int publicationID = generatedKeys.getInt(1);
                        normalPublication.setPublicationID(publicationID);

                        String normalQuery = "INSERT INTO NormalPubli (PublicationID) VALUES (?)";
                        try (PreparedStatement normalStatement = conexion.prepareStatement(normalQuery)) {
                            normalStatement.setInt(1, publicationID);
                            normalStatement.executeUpdate();
                        }
                    } else {
                        throw new SQLException("No se pudo obtener el ID generado para la publicación normal.");
                    }
                }
            } else {
                throw new SQLException("No se pudo insertar la publicación normal, ninguna fila afectada.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void createMarketPublication(PublicationMarket marketPublication) {
        String query = "INSERT INTO Publication (ContentPubli, ImagePubli, ActivePubli, Market, Date, UserID) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement preparedStatement = conexion.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, marketPublication.getContent());
            preparedStatement.setString(2, marketPublication.getImage());
            preparedStatement.setBoolean(3, marketPublication.isActive());
            preparedStatement.setBoolean(4, true);
            preparedStatement.setTimestamp(5, marketPublication.getDate());
            preparedStatement.setInt(6, marketPublication.getUserID());

            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int publicationID = generatedKeys.getInt(1);
                        marketPublication.setPublicationID(publicationID);

                        String marketQuery = "INSERT INTO MarketPubli (PublicationID, Tittle, Price) VALUES (?, ?, ?)";
                        try (PreparedStatement marketStatement = conexion.prepareStatement(marketQuery)) {
                            marketStatement.setInt(1, publicationID);
                            marketStatement.setString(2, marketPublication.getTitle());
                            marketStatement.setDouble(3, marketPublication.getPrice());
                            marketStatement.executeUpdate();
                        }
                    } else {
                        throw new SQLException("No se pudo obtener el ID generado para la publicación de mercado.");
                    }
                }
            } else {
                throw new SQLException("No se pudo insertar la publicación de mercado, ninguna fila afectada.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
