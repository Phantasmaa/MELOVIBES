package beans;

import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User {

    private boolean admin = false;
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

    public boolean getAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
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

        return 0;
    }

    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }

    public static void logout(HttpSession session) {
        session.removeAttribute("usuario");
        session.invalidate();
    }

    Profile retrieveUserProfileFromDatabase(int userID) {
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

        return null;
    }

    public void insertUser(String email, String firstName, String lastName, String password) {
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            String query = "insert into user (Email, FirstName, LastName, Password) values (?,?,?,?);";

            PreparedStatement sentencia = cnx.prepareStatement(query);

            sentencia.setString(1, email);
            sentencia.setString(2, firstName);
            sentencia.setString(3, lastName);
            sentencia.setString(4, password);

            sentencia.executeUpdate();
            sentencia.close();
            cnx.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    
    
    public void editUser(String userName, String name, String lastName, String city, int age, String phoneNumber, String gender, String bio, int userID) {
        try {

            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            
            String queryUser = "UPDATE User "
              + "SET FirstName = ?,  LastName = ?"
              + "WHERE UserID = ?;";
            PreparedStatement sentenciaUser = cnx.prepareStatement(queryUser);
            sentenciaUser.setString(1, name);
            sentenciaUser.setString(2, lastName);
            sentenciaUser.setInt(3, userID);
            sentenciaUser.executeUpdate();
            sentenciaUser.close();
            
            String query = "UPDATE Profile "
              + "SET UserName = ?, City = ?, Age = ?, PhoneNumber = ?, Gender = ?, Bio = ?"
              + "WHERE UserID = ?;";

            PreparedStatement sentencia = cnx.prepareStatement(query);

            sentencia.setString(1, userName);
            sentencia.setString(2, city);
            sentencia.setInt(3, age);
            sentencia.setString(4, phoneNumber);
            sentencia.setString(5, gender);
            sentencia.setString(6, bio);
            sentencia.setInt(7, userID);

            sentencia.executeUpdate();
            sentencia.close();
            cnx.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    

    public void deleteUser(int userID) {
    try {
        Conexion c = new Conexion();
        Connection cnx = c.conecta();

        // Llamar al procedimiento almacenado
        String callProcedure = "CALL DeleteUserData(?)";
        PreparedStatement callStatement = cnx.prepareStatement(callProcedure);
        callStatement.setInt(1, userID);
        callStatement.execute();
        callStatement.close();
        
        cnx.close();
    } catch (SQLException e) {
        System.out.println(e.getMessage());
    }
}
}
