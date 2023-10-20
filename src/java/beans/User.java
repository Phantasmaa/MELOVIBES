package beans;

import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
    private int userID;
    private String email;
    private String firstName;
    private String lastName;
    private String password;
    private Profile profile; 

    public User() {
    }

    public User(String email, String firstName, String lastName, String password) {
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int authenticate(String username, String password) {
        Conexion c = new Conexion();
        Connection cnx = c.conecta();
        String query = "SELECT * FROM `User` WHERE `Email` = ? AND `Password` = ?";

        try (PreparedStatement pstmt = cnx.prepareStatement(query)) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet result = pstmt.executeQuery();

            if (result.next()) {
                // Usuario autenticado
                this.userID = result.getInt("UserID");
                this.email = result.getString("Email");
                this.firstName = result.getString("FirstName");
                this.lastName = result.getString("LastName");
                this.password = result.getString("Password");
                
                // Recupera el perfil del usuario desde la base de datos y asígnalo al usuario
                Profile profile = retrieveUserProfileFromDatabase(this.userID);
                this.profile = profile;
                
                return 1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Usuario no autenticado
        return 0;
    }
    
    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }
    
    // Método para cerrar la sesión
    public static void logout(HttpSession session) {
        session.removeAttribute("usuario");
        session.invalidate();
    }

    private Profile retrieveUserProfileFromDatabase(int userID) {
    Conexion c = new Conexion();
    Connection cnx = c.conecta();
    String query = "SELECT * FROM `Profile` WHERE `UserID` = ?";

    try (PreparedStatement pstmt = cnx.prepareStatement(query)) {
        pstmt.setInt(1, userID);
        ResultSet result = pstmt.executeQuery();

        if (result.next()) {
            Profile profile = new Profile();
            profile.setProfileID(result.getInt("ProfileID"));
            profile.setUserName(result.getString("UserName"));
            profile.setUserImage(result.getString("UserImage"));
            profile.setCity(result.getString("City"));
            profile.setAge(result.getInt("Age"));
            profile.setBio(result.getString("Bio"));
            profile.setPhoneNumber(result.getString("PhoneNumber"));
            profile.setGender(result.getString("Gender"));
            return profile;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return null; // Devuelve null si no se encuentra un perfil para el usuario.
}

}
