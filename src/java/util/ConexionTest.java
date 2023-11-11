package util;

public class ConexionTest {
       public static void main(String[] args){
        Conexion c = new Conexion();
        if(c.getConexion() != null){
            System.out.println("Conexión correcta");
        }
        else{
            System.out.println("Conexión mala :(");
        }
    }
} 