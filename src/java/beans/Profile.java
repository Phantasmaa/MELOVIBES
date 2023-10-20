package beans;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Profile {
    private int profileID;
    private String userName;
    private String userImage;
    private String city;
    private int age;
    private String bio;
    private String phoneNumber;
    private String gender;
    private User user;

    public Profile() {
    }

    public int getProfileID() {
        return profileID;
    }

    public void setProfileID(int profileID) {
        this.profileID = profileID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserImage() {
        return userImage;
    }

    public void setUserImage(String userImage) {
        this.userImage = userImage;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    
    public static Profile retrieveProfileFromDatabase(int profileID) {
    Profile profile = new Profile();
    Conexion c = new Conexion();
    Connection cnx = c.conecta();
    String query = "SELECT * FROM `Profile` WHERE `ProfileID` = ?";

    try (PreparedStatement pstmt = cnx.prepareStatement(query)) {
        pstmt.setInt(1, profileID);
        ResultSet result = pstmt.executeQuery();

        if (result.next()) {
            profile.setProfileID(result.getInt("ProfileID"));
            profile.setUserName(result.getString("UserName"));
            profile.setUserImage(result.getString("UserImage"));
            profile.setCity(result.getString("City"));
            profile.setAge(result.getInt("Age"));
            profile.setBio(result.getString("Bio"));
            profile.setPhoneNumber(result.getString("PhoneNumber"));
            profile.setGender(result.getString("Gender"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    
    
    

    return profile;
}
    
    public void updateProfile(String userName, String city, int age) {
    Conexion c = new Conexion();
    Connection cnx = c.conecta();
    String query = "UPDATE Profile SET UserName = ?, City = ?, Age = ? WHERE ProfileID = ?";

    try (PreparedStatement pstmt = cnx.prepareStatement(query)) {
        pstmt.setString(1, userName);
        pstmt.setString(2, city);
        pstmt.setInt(3, age);
        pstmt.setInt(4, this.profileID); 

        pstmt.executeUpdate();
        
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
    public void deleteProfile() {
    Conexion c = new Conexion();
    Connection cnx = c.conecta();
    String deleteProfileQuery = "DELETE FROM Profile WHERE ProfileID = ?";
    String deletePublicationsQuery = "DELETE FROM Publication WHERE ProfileID = ?";
    String deleteCommentsQuery = "DELETE FROM Comment WHERE ProfileID = ?";

    try {
        cnx.setAutoCommit(false); // Iniciar una transacción
        try (PreparedStatement pstmtProfile = cnx.prepareStatement(deleteProfileQuery);
             PreparedStatement pstmtPublications = cnx.prepareStatement(deletePublicationsQuery);
             PreparedStatement pstmtComments = cnx.prepareStatement(deleteCommentsQuery)) {

            pstmtComments.setInt(1, this.profileID);
            pstmtComments.executeUpdate();

            pstmtPublications.setInt(1, this.profileID);
            pstmtPublications.executeUpdate();

            pstmtProfile.setInt(1, this.profileID);
            pstmtProfile.executeUpdate();

            cnx.commit(); // Confirmar la transacción
        } catch (SQLException e) {
            cnx.rollback(); // Revertir la transacción en caso de error
            e.printStackTrace();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

}


