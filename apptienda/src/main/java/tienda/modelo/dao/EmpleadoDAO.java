package tienda.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import tienda.conexion.Conexion;
import tienda.modelo.bean.Empleado;

public class EmpleadoDAO {
    public static  Empleado buscarEmpleadoID(int cod) {
        Empleado emp=null;
            String sql ="Select*from empleado where idempleado=?";
            Connection cn= Conexion.abrir();
        try {
            PreparedStatement ps=cn.prepareStatement(sql);
            //asigar valor al parametro
            ps.setInt(1, cod);
            ResultSet rs=ps.executeQuery();
            if (rs.next()) {
                emp=new Empleado(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                
            }
            //create objetos
            ps.close();
            cn.close();
            rs.close();
            
            
        } catch (SQLException ex) {
            Logger.getLogger(EmpleadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return emp;
    }
    //---------------------------------
    public static ArrayList<Empleado> listar(){
        //declarar una variable tipo empleado
        Empleado emp;
        //arreglo de objetos empleados
            ArrayList<Empleado> empleados=new ArrayList<>();
            
            //listar todos los empleados
            String sql="select *from empleado";
            //conexion a la base de datos
            Connection cn=Conexion.abrir();
            //ejecutar sql
        try {
            
            PreparedStatement ps=cn.prepareStatement(sql);
            //ejecutar
            ResultSet rs=ps.executeQuery();
            //leer rs
            while (rs.next()) {
            //crear objeto empleado
            emp=new Empleado(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
            //agregar el obj empleado al arreglo
            empleados.add(emp);
            }
            //cerar
            ps.close();
            cn.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(EmpleadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return empleados;
    }
    
}
