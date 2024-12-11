/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tienda.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import tienda.conexion.Conexion;
import tienda.modelo.bean.Cliente;
import tienda.modelo.bean.Pais;

/**
 *
 * @author EDISON
 */
public class ClienteDAO {
    public static ArrayList<Cliente> listarClienteSinP() {
    // Declarar una variable tipo cliente
    Cliente c;
    // Arreglo de objetos clientes
    ArrayList<Cliente> clientes = new ArrayList<>();
    // Listar todos los clientes
    String sql = "SELECT * FROM cliente";
    // Conexión a la base de datos
    Connection cn = Conexion.abrir();
    // Ejecutar SQL
    try {
        PreparedStatement ps = cn.prepareStatement(sql);
        // Ejecutar
        ResultSet rs = ps.executeQuery();
        // Leer rs
        while (rs.next()) {
            // Crear objeto cliente
            c = new Cliente(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
            // Agregar el objeto cliente al arreglo
            clientes.add(c);
        }
        // Cerrar
        ps.close();
        cn.close();
        rs.close();
    } catch (SQLException ex) {
        Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return clientes;
}
    
    public static void insertar(Cliente cliente) {
    // Instrucción SQL para insertar cliente en la base de datos sin incluir el ID
    String sql = "INSERT INTO CLIENTE (NOMBRE, AP_PATERNO, AP_MATERNO, DNI, CELULAR) VALUES (?, ?, ?, ?, ?)";
    Connection cn = Conexion.abrir();
    try {
        PreparedStatement ps = cn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, cliente.getNombre());
        ps.setString(2, cliente.getAp_paterno());
        ps.setString(3, cliente.getAp_materno());
        ps.setString(4, cliente.getDNI());
        ps.setString(5, cliente.getCelular());

        int filasAfectadas = ps.executeUpdate();

        if (filasAfectadas > 0) {
            // Obtener el ID generado automáticamente
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                int idGenerado = generatedKeys.getInt(1);
                cliente.setIdcliente(idGenerado);
            }
        }

        ps.close();
        cn.close();

    } catch (SQLException ex) {
        Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
}


    public static Cliente obtenerClientePorID(int idcliente) {
    Cliente cliente = null;
    String sql = "SELECT * FROM CLIENTE WHERE IDCLIENTE = ?";
    Connection cn = Conexion.abrir();

    try {
        PreparedStatement ps = cn.prepareStatement(sql);
        ps.setInt(1, idcliente);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            cliente = new Cliente();
            cliente.setIdcliente(rs.getInt("IDCLIENTE"));
            cliente.setNombre(rs.getString("NOMBRE"));
            cliente.setAp_paterno(rs.getString("APATERNO"));
            cliente.setAp_materno(rs.getString("AMATERNO"));
            cliente.setDNI(rs.getString("DNI"));
            cliente.setCelular(rs.getString("CELULAR"));
        }

        rs.close();
        ps.close();
        cn.close();

    } catch (SQLException ex) {
        Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
    }

    return cliente;
}

}
