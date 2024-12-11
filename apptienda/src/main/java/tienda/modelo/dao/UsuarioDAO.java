/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tienda.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import tienda.conexion.Conexion;
import tienda.modelo.bean.Usuario;

public class UsuarioDAO {

    public static Usuario valirarUsuario(String us,String pas) {
        //variable tipo usuario
        Usuario user=null;
        //instruccion sql para buscar usuario
        String sql="Select*from usuario where usuario=? and password=?";
        //conexion a la bd
        Connection cn=Conexion.abrir();
        try {
            //ejecutar sql
            PreparedStatement ps=cn.prepareStatement(sql);
            //asignar parametros ?,?
            ps.setString(1, us);
            ps.setString(2, pas);
            //metodo que la ejecuta
         ResultSet rs=   ps.executeQuery();
         //leer rs
         if(rs.next()){
             //objeto usuario
             user=new Usuario();
             //asignar valores a las propiedades 
             //del objeto usuario:encapsulamiento
             user.setIdus(rs.getInt("idusuario"));
             user.setUsuario(rs.getString("usuario"));
             user.setPassword(rs.getString("password"));
             user.setIdemp(rs.getInt("idempleado"));       
         }
            
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }
}
