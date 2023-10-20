package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Admin {
    private Connection connection;

    public Admin(Connection connection) {
        this.connection = connection;
    }

    public boolean authenticate(String adminEmail, String password) {
        try {
            String query = "SELECT * FROM Admin WHERE adminEmail = ? AND Password = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, adminEmail);
            statement.setString(2, password);

            ResultSet result = statement.executeQuery();
            
            return result.next(); 

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
