package tienda.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import tienda.conexion.Conexion;
import tienda.modelo.bean.Pedidos;

public class PedidosDAO {

    public static ArrayList<Pedidos> obtenerPedidos(String nom) {
        Pedidos pedido = null;

        ArrayList<Pedidos> pd = new ArrayList<>();

        String sql = "SELECT p.*  FROM pedido_encabezado p JOIN empleado e ON p.idempleado = e.idempleado WHERE e.nombre=?";
        Connection cn = Conexion.abrir();
        try {
            PreparedStatement ps = cn.prepareStatement(sql);
            //asigar valor al parametro
            ps.setString(1, nom);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pedido = new Pedidos(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5));
                pd.add(pedido);
            }
            //create objetos
            ps.close();
            cn.close();
            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(EmpleadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pd;
    }

    public static ArrayList<Pedidos> obtenerPedidosF(String Finicial, String Ffinal) {
        Pedidos pedido = null;
        ArrayList<Pedidos> pd = new ArrayList<>();

        String sql = "SELECT * FROM pedido_encabezado p WHERE p.fecha BETWEEN ? AND ?";
        Connection cn = Conexion.abrir();
        try {
            PreparedStatement ps = cn.prepareStatement(sql);
            //asigar valor al parametro
            ps.setString(1, Finicial);
            ps.setString(2, Ffinal);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pedido = new Pedidos(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5));
                pd.add(pedido);
            }
            //create objetos
            ps.close();
            cn.close();
            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(EmpleadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pd;
    }
    
    public static ArrayList<Map<String, Object>> obtenerTodosLosPedidosConCliente() {
    ArrayList<Map<String, Object>> resultados = new ArrayList<>();
    String sql = "SELECT pedido_encabezado.fecha, pedido_encabezado.total, cliente.nombres AS nombreCliente, cliente.apellidos, pais.pais " +
                 "FROM pedido_encabezado " +
                 "JOIN cliente ON pedido_encabezado.idcliente = cliente.idcliente " +
                 "JOIN pais ON cliente.idpais = pais.idpais " +
                 "JOIN empleado ON pedido_encabezado.idempleado = empleado.idempleado";
    Connection cn = Conexion.abrir();

    try {
        PreparedStatement ps = cn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Map<String, Object> resultado = new HashMap<>();
            resultado.put("fecha", rs.getString("fecha"));
            resultado.put("total", rs.getInt("total"));
            resultado.put("nombreCliente", rs.getString("nombreCliente"));
            resultado.put("apellidosCliente", rs.getString("apellidos"));
            resultado.put("pais", rs.getString("pais"));
            resultados.add(resultado);
        }

        ps.close();
        cn.close();
        rs.close();
    } catch (SQLException ex) {
        Logger.getLogger(PedidosDAO.class.getName()).log(Level.SEVERE, null, ex);
    }

    return resultados;
}
    
}
