package dao;

import com.mysql.cj.jdbc.CallableStatement;
import models.User;
import util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    private Connection conexion;

    public UserDAO() {
        conexion = Conexion.getConexion();
    }

    public User verificarCredenciales(String email, String password) {
        String consulta = "SELECT * FROM user WHERE Email = ? AND Password = ?";
        try {
            PreparedStatement statement = conexion.prepareStatement(consulta);
            statement.setString(1, email);
            statement.setString(2, password);

            ResultSet resultado = statement.executeQuery();

            if (resultado.next()) {
                User usuario = new User();
                usuario.setUserID(resultado.getInt("UserID"));
                usuario.setEmail(resultado.getString("Email"));
                usuario.setUserName(resultado.getString("username"));
                usuario.setPassword(resultado.getString("password"));
                usuario.setFirstName(resultado.getString("FirstName"));
                usuario.setLastName(resultado.getString("LastName"));
                usuario.setUserImage(resultado.getBytes("UserImage"));
                usuario.setCity(resultado.getString("City"));
                usuario.setAge(resultado.getInt("Age"));
                usuario.setBio(resultado.getString("Bio"));
                usuario.setPhoneNumber(resultado.getString("PhoneNumber"));
                usuario.setGender(resultado.getString("Gender"));

                
                return usuario;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public boolean registrarUsuario(String email, String password, String firstName, String lastName, String userName, String city, int age, String phoneNumber, String gender) {
        String consulta = "INSERT INTO user (Email, Password, FirstName, LastName, UserName, City, Age, PhoneNumber, Gender) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement statement = conexion.prepareStatement(consulta);
            statement.setString(1, email);
            statement.setString(2, password);
            statement.setString(3, firstName);
            statement.setString(4, lastName);
            statement.setString(5, userName);
            statement.setString(6, city);
            statement.setInt(7, age);
            statement.setString(8, phoneNumber);
            statement.setString(9, gender);

            int filasAfectadas = statement.executeUpdate();

            return filasAfectadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean actualizarUsuario(int userID, String username, String firstName, String lastName, String city, int age, String phoneNumber, String gender, String bio) {
        String consulta = "UPDATE user SET UserName = ?, FirstName = ?, LastName = ?, City = ?, Age = ?, PhoneNumber = ?, Gender = ?, Bio = ? WHERE UserID = ?";
        try {
            PreparedStatement statement = conexion.prepareStatement(consulta);
            statement.setString(1, username);
            statement.setString(2, firstName);
            statement.setString(3, lastName);
            statement.setString(4, city);
            statement.setInt(5, age);
            statement.setString(6, phoneNumber);
            statement.setString(7, gender);
            statement.setString(8, bio);
            statement.setInt(9, userID);

            int filasAfectadas = statement.executeUpdate();

            return filasAfectadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
    
    public boolean eliminarUsuario(int userID) {
    try {
        CallableStatement statement = (CallableStatement) conexion.prepareCall("{call DeleteUserData(?)}");
        statement.setInt(1, userID);
        
        statement.execute();
        
        return true;
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return false;
}
    
    
    public User getUserByID(int userID) {
    String consulta = "SELECT * FROM user WHERE UserID = ?";
    try {
        PreparedStatement statement = conexion.prepareStatement(consulta);
        statement.setInt(1, userID);

        ResultSet resultado = statement.executeQuery();

        if (resultado.next()) {
            User usuario = new User();
            usuario.setUserID(resultado.getInt("UserID"));
            usuario.setEmail(resultado.getString("Email"));
            usuario.setUserName(resultado.getString("username"));
            usuario.setPassword(resultado.getString("password"));
            usuario.setFirstName(resultado.getString("FirstName"));
            usuario.setLastName(resultado.getString("LastName"));
            usuario.setUserImage(resultado.getBytes("UserImage"));
            usuario.setCity(resultado.getString("City"));
            usuario.setAge(resultado.getInt("Age"));
            usuario.setBio(resultado.getString("Bio"));
            usuario.setPhoneNumber(resultado.getString("PhoneNumber"));
            usuario.setGender(resultado.getString("Gender"));
            return usuario;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return null;
}
    
    
    public User asignarDatosOtroUsuario(int userID) {
        String consulta = "SELECT * FROM user WHERE UserID = ?";
        try {
            PreparedStatement statement = conexion.prepareStatement(consulta);
            statement.setInt(1, userID);

            ResultSet resultado = statement.executeQuery();

            if (resultado.next()) {
                User usuario = new User();
                usuario.setUserID(resultado.getInt("UserID"));
                usuario.setUserName(resultado.getString("username"));
                usuario.setFirstName(resultado.getString("FirstName"));
                usuario.setLastName(resultado.getString("LastName"));
                usuario.setUserImage(resultado.getBytes("UserImage"));
                usuario.setCity(resultado.getString("City"));
                usuario.setAge(resultado.getInt("Age"));
                usuario.setBio(resultado.getString("Bio"));
                usuario.setPhoneNumber(resultado.getString("PhoneNumber"));
                usuario.setGender(resultado.getString("Gender"));
                return usuario;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public void changePassword(String mail, String password) {

        String consulta = "UPDATE user SET Password = ? WHERE Email = ?";

        try {
            PreparedStatement statement = conexion.prepareStatement(consulta);
            statement.setString(1, password);
            statement.setString(2, mail);

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<User> searchUsers(String searchTerm) {
        List<User> userList = new ArrayList<>();

        try {
            // Consulta SQL para buscar usuarios por nombre o nombre de usuario
            System.out.println(searchTerm);
            String sql = "SELECT * FROM User WHERE LOWER(FirstName) LIKE LOWER(?) OR LOWER(UserName) LIKE LOWER(?)";
            try (PreparedStatement statement = conexion.prepareStatement(sql)) {
                // Configurar los parámetros de búsqueda con el patrón
                statement.setString(1, searchTerm);
                statement.setString(2, searchTerm);

                // Ejecutar la consulta
                try (ResultSet resultSet = statement.executeQuery()) {
                    // Procesar los resultados y construir la lista de usuarios
                    while (resultSet.next()) {
                        System.out.println("si");
                        User user = new User();
                        user.setUserID(resultSet.getInt("UserID"));
                        user.setEmail(resultSet.getString("Email"));
                        user.setUserImage(resultSet.getBytes("UserImage"));
                        user.setFirstName(resultSet.getString("FirstName"));
                        user.setLastName(resultSet.getString("LastName"));
                        user.setUserName(resultSet.getString("UserName"));
                        // Agregar más campos según sea necesario
                        System.out.println(user.getUserName());
                        userList.add(user);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejar la excepción según tus necesidades
        }

        return userList;
    }
}
