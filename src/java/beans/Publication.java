package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Publication {

    private int publicationID;
    private String content;
    private String image;
    private boolean active;
    private boolean market;
    private int dateID;
    private int profileID;
    private Profile profile; // Una referencia al perfil del usuario que hizo la publicación
    private Calendar calendar;

    public Publication() {
    }

    public int getPublicationID() {
        return publicationID;
    }

    public void setPublicationID(int publicationID) {
        this.publicationID = publicationID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public boolean isMarket() {
        return market;
    }

    public void setMarket(boolean market) {
        this.market = market;
    }

    public int getDateID() {
        return dateID;
    }

    public void setDateID(int dateID) {
        this.dateID = dateID;
    }

    public int getProfileID() {
        return profileID;
    }

    public void setProfileID(int profileID) {
        this.profileID = profileID;
    }

    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }

    public Calendar getCalendar() {
        return calendar;
    }

    public void setCalendar(Calendar calendar) {
        this.calendar = calendar;
    }

    public static List<Publication> getAllPublications() {
        List<Publication> publications = new ArrayList<>();
        Conexion c = new Conexion();
        Connection cnx = c.conecta();
        String query = "SELECT * FROM `Publication`"; // Sin filtro por perfil

        try (PreparedStatement pstmt = cnx.prepareStatement(query)) {
            ResultSet result = pstmt.executeQuery();

            while (result.next()) {
                Publication publication = new Publication();
                publication.setPublicationID(result.getInt("PublicationID"));
                publication.setContent(result.getString("ContentPubli"));
                publication.setImage(result.getString("ImagePubli"));
                publication.setActive(result.getBoolean("ActivePubli"));
                publication.setMarket(result.getBoolean("Market"));
                publication.setDateID(result.getInt("DateID"));
                publication.setProfileID(result.getInt("ProfileID"));

                // Recupera el perfil del usuario que hizo la publicación y asígnalo a la publicación
                User user = new User();
                Profile profile = user.retrieveUserProfileFromDatabase(publication.getProfileID());
                publication.setProfile(profile);

                // Recupera la fecha asociada a esta publicación y asígnala a la publicación
                Calendar calendar = Calendar.retrieveCalendarFromDatabase(publication.getDateID());
                publication.setCalendar(calendar);

                publications.add(publication);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return publications;
    }

    public static List<Publication> getPublicationsForProfile(int profileID) {
        List<Publication> publications = new ArrayList<>();
        Conexion c = new Conexion();
        Connection cnx = c.conecta();
        String query = "SELECT * FROM `Publication` WHERE `ProfileID` = ?";

        try (PreparedStatement pstmt = cnx.prepareStatement(query)) {
            pstmt.setInt(1, profileID);
            ResultSet result = pstmt.executeQuery();

            while (result.next()) {
                Publication publication = new Publication();
                publication.setPublicationID(result.getInt("PublicationID"));
                publication.setContent(result.getString("ContentPubli"));
                publication.setImage(result.getString("ImagePubli"));
                publication.setActive(result.getBoolean("ActivePubli"));
                publication.setMarket(result.getBoolean("Market"));
                publication.setDateID(result.getInt("DateID"));
                publication.setProfileID(result.getInt("ProfileID"));

                // Recupera el perfil del usuario que hizo la publicación y asígnalo a la publicación
                User user = new User();
                Profile profile = user.retrieveUserProfileFromDatabase(publication.getProfileID());
                publication.setProfile(profile);

                // Recupera la fecha asociada a esta publicación y asígnala a la publicación
                Calendar calendar = Calendar.retrieveCalendarFromDatabase(publication.getDateID());
                publication.setCalendar(calendar);

                publications.add(publication);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return publications;
    }
}
