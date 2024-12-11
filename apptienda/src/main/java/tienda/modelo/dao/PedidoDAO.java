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
import java.util.List;
import tienda.conexion.Conexion;
import tienda.modelo.bean.Pedido;

/**
 *
 * @author Apo
 */
public class PedidoDAO {
    public static List<Pedido> listarPedidos() {
        List<Pedido> pedidos = new ArrayList<>();

        // Consulta SQL sin alias
        String sql = "SELECT pedido_detalle.idpedido_detalle, cliente.nombre, cliente.ap_paterno, cliente.ap_materno, "
                   + "pedido_detalle.idproducto, producto.nombre AS nombrep, producto.precio, producto.fecha_ven, "
                   + "pedido_detalle.cantidad, pedido_detalle.subtotal "
                   + "FROM pedido_detalle "
                   + "JOIN cliente ON pedido_detalle.idcliente = cliente.idcliente "
                   + "JOIN producto ON pedido_detalle.idproducto = producto.idproducto";

        try (Connection cn = Conexion.abrir();
             PreparedStatement ps = cn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setIdpedido_detalle(rs.getInt("idpedido_detalle"));
                pedido.setNombre(rs.getString("nombre"));
                pedido.setAp_paterno(rs.getString("ap_paterno"));
                pedido.setAp_materno(rs.getString("ap_materno"));
                pedido.setIdproducto(rs.getInt("idproducto"));
                pedido.setNombrep(rs.getString("nombrep"));
                pedido.setPrecio(rs.getInt("precio"));
                pedido.setFecha_ven(rs.getString("fecha_ven"));
                pedido.setCantidad(rs.getInt("cantidad"));
                pedido.setSubtotal(rs.getInt("subtotal"));
                pedidos.add(pedido);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            // Manejar la excepción según tus necesidades
        }

        return pedidos;
    }

}
