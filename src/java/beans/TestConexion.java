
package beans;

/**
 *
 * @author manue
 */
public class TestConexion {
       public static void main(String[] args){
        Conexion c = new Conexion();
        if(c.conecta() != null){
            System.out.println("Conexión correcta");
        }
        else{
            System.out.println("Conexión mala :(");
        }
    }
} 

