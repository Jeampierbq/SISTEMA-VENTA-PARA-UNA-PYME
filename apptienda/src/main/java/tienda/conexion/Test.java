/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tienda.conexion;

import java.sql.Connection;
import tienda.modelo.bean.Usuario;
import tienda.modelo.dao.UsuarioDAO;

/**
 *
 * @author Dell
 */
public class Test {

    public static void main(String[] args) {
        Connection cn=Conexion.abrir();
        System.out.println("Conexion:"+cn);
//        Usuario us = UsuarioDAO.valirarUsuario("xyz", "123");
//        System.out.println(":" + us.getIdemp());

    }

}
