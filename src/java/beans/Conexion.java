
package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Conexion {
    
    private Connection cnx;
    
    public Connection conecta() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String user="root";
            String password="admin";
            String url="jdbc:mysql://localhost:3306/melovibe";
            cnx = DriverManager.getConnection(url, user, password);
            return cnx;
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public int pruebaConexion() {
        Connection c = conecta();
        if (c!=null) {
            return 1;
        } else {
            return 0;
        }        
    }
}
