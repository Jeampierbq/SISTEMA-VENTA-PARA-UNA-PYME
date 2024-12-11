/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tienda.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import tienda.conexion.Conexion;
import tienda.modelo.bean.Pais;

public class PaisDAO {
    public static ArrayList<Pais> listarNoCliente() {
        //declarar una variable tipo empleado
        Pais pais;
        //arreglo de objetos empleados
        ArrayList<Pais> paises = new ArrayList<>();
        //listar todos los empleados
        String sql = "select * from pais p where p.idpais not in (select c.idpais from cliente c where c.idpais=p.idpais)";
        //conexion a la base de datos
        Connection cn = Conexion.abrir();
        //ejecutar sql
        try {
            PreparedStatement ps = cn.prepareStatement(sql);
            //ejecutar
            ResultSet rs = ps.executeQuery();
            //leer rs
            while (rs.next()) {
                //crear objeto empleado
                pais = new Pais(rs.getInt(1), rs.getString(2));
                //agregar el obj empleado al arreglo
                paises.add(pais);
            }
            //cerar
            ps.close();
            cn.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return paises;
    }
}
