
package tienda.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import tienda.conexion.Conexion;
import tienda.modelo.bean.Categoria;


public class CategoriaDAO {
    public static  Categoria buscarCategoriaID(int id) {
        Categoria cat=null;
            String sql ="Select*from categoria where idcategoria=?";
            Connection cn= Conexion.abrir();
        try {
            PreparedStatement ps=cn.prepareStatement(sql);
            //asigar valor al parametro
            ps.setInt(1, id);
            ResultSet rs=ps.executeQuery();
            if (rs.next()) {
                cat=new Categoria(rs.getInt(1),rs.getString(2));
            }
            //create objetos
            ps.close();
            cn.close();
            rs.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(EmpleadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cat;
    }
    
}
