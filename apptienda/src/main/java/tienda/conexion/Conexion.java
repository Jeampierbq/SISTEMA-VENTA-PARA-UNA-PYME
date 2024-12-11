/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tienda.conexion;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    //atributos estaticos
    private static String url="jdbc:mysql://localhost/bdproyecto";
    private static String usuario="root";
    private static String password="12345678";
    private static Connection cn;
    //metodo para abrir la conexion
    public static Connection abrir(){
        try {
            //registrar driver
            Class.forName("com.mysql.jdbc.Driver");
            //abrir la conexion
            cn=DriverManager.getConnection(url, usuario, password);
            return cn;
        } catch (Exception ex) {
            return null;
        }
    }
    
    
    
}
