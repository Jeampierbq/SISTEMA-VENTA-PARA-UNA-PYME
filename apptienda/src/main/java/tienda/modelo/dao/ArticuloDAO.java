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
import tienda.modelo.bean.Articulos;
import tienda.modelo.bean.Producto;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import tienda.modelo.bean.ProductoProximoExpirar;

public class ArticuloDAO {

    public static ArrayList<Producto> listar() {
        //declarar una variable tipo empleado
        Producto art;
        //arreglo de objetos empleados
        ArrayList<Producto> producto = new ArrayList<>();
        //listar todos los empleados
        String sql = "select *from producto";
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
                art = new Producto(rs.getInt(1), rs.getString(2),rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getInt(7));
                //agregar el obj empleado al arreglo
                producto.add(art);
            }
            //cerar
            ps.close();
            cn.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return producto;
    }
    
public static ArrayList<Producto> listarfecha() {
   //declarar una variable tipo empleado
        Producto art;
        //arreglo de objetos empleados
        ArrayList<Producto> producto = new ArrayList<>();
        //listar todos los empleados
        String sql = "SELECT * FROM producto ORDER BY fecha_ven ASC  LIMIT 3;";
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
                art = new Producto(rs.getInt(1), rs.getString(2),rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getInt(7));
                //agregar el obj empleado al arreglo
                producto.add(art);
            }
            //cerar
            ps.close();
            cn.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return producto;
}


    public static ArrayList<Producto> obtenerArticulos(String ctg) {
        Producto producto = null;

        ArrayList<Producto> ar = new ArrayList<>();

        String sql = "SELECT a.* FROM producto a JOIN categoria c ON a.idcategoria = c.idcategoria WHERE c.categoria=?;";
        Connection cn = Conexion.abrir();
        try {
            PreparedStatement ps = cn.prepareStatement(sql);
            //asigar valor al parametro
            ps.setString(1, ctg);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                producto = new Producto(rs.getInt(1), rs.getString(2),rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getInt(7));
                ar.add(producto);
            }
            //create objetos
            ps.close();
            cn.close();
            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(EmpleadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ar;
    }

    public static ArrayList<Producto> obtenerArticulosE(String ctg) {
        Producto producto = null;

        ArrayList<Producto> ar = new ArrayList<>();

        String sql = "SELECT a.* FROM pedido_detalle pd JOIN pedido_encabezado pe ON pd.idpedido = pe.idpedido JOIN articulo a ON pd.idarticulo = a.idarticulo\n"
                + "JOIN empleado e ON pe.idempleado = e.idempleado WHERE e.nombre = ?";
        Connection cn = Conexion.abrir();
        try {
            PreparedStatement ps = cn.prepareStatement(sql);
            //asigar valor al parametro
            ps.setString(1, ctg);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                producto = new Producto(rs.getInt(1), rs.getString(2),rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getInt(7));
                ar.add(producto);
            }
            //create objetos
            ps.close();
            cn.close();
            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(EmpleadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ar;
    }

    public static ArrayList<Producto> ArticuloMayor() {
        Producto producto = null;

        ArrayList<Producto> ar = new ArrayList<>();

        String sql = "select *from producto where producto.precio=(select max(precio) from articulo)";
        Connection cn = Conexion.abrir();
        try {
            PreparedStatement ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                producto = new Producto(rs.getInt(1), rs.getString(2),rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getInt(7));
                ar.add(producto);
            }
            //create objetos
            ps.close();
            cn.close();
            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(EmpleadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ar;
    }

    public static ArrayList<Producto> obtenerArticulosN(String nombre) {
        Producto producto = null;

        ArrayList<Producto> ar = new ArrayList<>();

        String sql = "select *from producto a where a.nombre =?";
        Connection cn = Conexion.abrir();
        try {
            PreparedStatement ps = cn.prepareStatement(sql);
            //asigar valor al parametro
            ps.setString(1, nombre);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                producto = new Producto(rs.getInt(1), rs.getString(2),rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getInt(7));
                ar.add(producto);
            }
            //create objetos
            ps.close();
            cn.close();
            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(EmpleadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ar;
    }
    public static ArrayList<Articulos> listarArticulosNoPed() {
        Articulos articulo = null;

        ArrayList<Articulos> ar = new ArrayList<>();

        String sql = "select * from articulo a where a.idarticulo not in (select pd.idarticulo from pedido_detalle pd where a.idarticulo=pd.idarticulo);";
        Connection cn = Conexion.abrir();
        try {
            PreparedStatement ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                articulo = new Articulos(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getInt(6));
                ar.add(articulo);
            }
            //create objetos
            ps.close();
            cn.close();
            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(EmpleadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ar;
    }
    public static ArrayList<Articulos> listarArticulosPed() {
        Articulos articulo = null;

        ArrayList<Articulos> ar = new ArrayList<>();

        String sql = "select a.* from articulo a JOIN pedido_detalle pd ON a.idarticulo=pd.idarticulo";
        Connection cn = Conexion.abrir();
        try {
            PreparedStatement ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                articulo = new Articulos(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getInt(6));
                ar.add(articulo);
            }
            //create objetos
            ps.close();
            cn.close();
            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(EmpleadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ar;
    }
    
    public static void insertar(Producto producto, int cantidad) {
    // instruccion sql para insertar empleado en la bd
    String sql = "INSERT INTO PRODUCTO (NOMBRE, DESCRIPCION, PRECIO, FOTO, FECHA_VEN, IDCATEGORIA) VALUES (?, ?, ?, ?, ?, ?)";
    Connection cn = Conexion.abrir();
    
    try {
        PreparedStatement ps = cn.prepareStatement(sql);

        // Repetir la inserción según la cantidad
        for (int i = 0; i < cantidad; i++) {
            ps.setString(1, producto.getNombre());
            ps.setString(2, producto.getDescripcion());
            ps.setDouble(3, producto.getPrecio());
            ps.setString(4, producto.getFoto());
            ps.setString(5, producto.getFecha_ven());
            ps.setInt(6, producto.getIdcategoria());

            // Imprimir la instrucción SQL
            System.out.println("SQL a ejecutar: " + ps.toString());

            ps.executeUpdate();
        }

        ps.close();
        cn.close();

    } catch (SQLException ex) {
        Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
}


    
    public static void eliminar(int idProducto) {
        String sql = "DELETE FROM PRODUCTO WHERE IDPRODUCTO=?";
        Connection cn = Conexion.abrir();
        try {
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, idProducto);
            ps.executeUpdate();

            ps.close();
            cn.close();
        } catch (SQLException ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void editar(Producto producto) {
    try {
        // SQL para actualizar un empleado
        String sql = "UPDATE PRODUCTO SET NOMBRE=?, DESCRIPCION=?, PRECIO=?, FOTO=?, FECHA_VEN=?, IDCATEGORIA=? WHERE IDPRODUCTO=?";
        Connection cn = Conexion.abrir();
        
        // Preparar la instrucción SQL
        PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, producto.getNombre());
            ps.setString(2, producto.getDescripcion());
            ps.setDouble(3, producto.getPrecio());
            ps.setString(4, producto.getFoto());
            ps.setString(5, producto.getFecha_ven());
            ps.setInt(6, producto.getIdcategoria());
            ps.setInt(7, producto.getIdproducto());// Asumiendo que getIdEmpleado devuelve el ID del empleado a editar

        // Ejecutar la actualización
        ps.executeUpdate();
        
        // Cerrar objetos
        cn.close();
        ps.close();
    } catch (SQLException ex) {
        Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    }
    
    public static Producto buscarArticuloID(int cod) {
        Producto art = null;
        String sql = "SELECT*FROM PRODUCTO WHERE IDPRODUCTO=?";
        Connection cn = Conexion.abrir();

        try {
            PreparedStatement ps = cn.prepareStatement(sql);
            //asignar valor al paremetro ?
            ps.setInt(1, cod);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                 art = new Producto(rs.getInt(1), rs.getString(2),rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getInt(7));

            }
            //cerrar objetos
            ps.close();
            cn.close();
            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return art;

    }
    
    public static Producto obtenerProductoProximaFechaVencimiento() {
    Producto producto = null;

    String sql = "SELECT * FROM PRODUCTO WHERE FECHA_VEN >= CURDATE() ORDER BY FECHA_VEN ASC LIMIT 1";
    Connection cn = Conexion.abrir();

    try {
        PreparedStatement ps = cn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            producto = new Producto(
                rs.getInt("IDPRODUCTO"),
                rs.getString("NOMBRE"),
                rs.getString("DESCRIPCION"),
                rs.getDouble("PRECIO"),
                rs.getString("FOTO"),
                rs.getString("FECHA_VEN"),
                rs.getInt("IDCATEGORIA")
            );
        }

        ps.close();
        cn.close();
        rs.close();
    } catch (SQLException ex) {
        Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
    }

    return producto;
}
    
   public static ArrayList<Producto> obtenerProductosProximosExpirarConDetalle() {
    ArrayList<Producto> productosProximosExpirarConDetalle = new ArrayList<>();
    Connection cn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // Obtener la fecha actual utilizando LocalDate
    LocalDate fechaActual = LocalDate.now();
    String fechaActualStr = fechaActual.format(DateTimeFormatter.ofPattern("dd/MM/yy"));

    // Consulta SQL para obtener productos próximos a expirar (en los próximos 7 días)
    String sql = "SELECT FROM PRODUCTO.IDPRODUCTO, PRODUCTO.NOMBRE, PRODUCTO.DESCRIPCION, PRODUCTO.PRECIO, PRODUCTO.FOTO, "
            + "PRODUCTO.FECHA_VEN, CATEGORIA.CATEGORIA, COUNT(PRODUCTO.IDPRODUCTO) AS CANTIDAD "
            + "FROM PRODUCTO "
            + "JOIN CATEGORIA ON PRODUCTO.IDCATEGORIA = CATEGORIA.IDCATEGORIA "
            + "WHERE TO_DATE(PRODUCTO.FECHA_VEN, 'DD/MM/YY') <= (TO_DATE(?, 'DD/MM/YY') + INTERVAL '7' DAY) "
            + "GROUP BY PRODUCTO.IDPRODUCTO, PRODUCTO.NOMBRE, PRODUCTO.DESCRIPCION, PRODUCTO.PRECIO, PRODUCTO.FOTO, "
            + "PRODUCTO.FECHA_VEN, CATEGORIA.CATEGORIA "
            + "ORDER BY PRODUCTO.FECHA_VEN ASC";

    try {
        cn = Conexion.abrir();
        ps = cn.prepareStatement(sql);

        // Asignar la fecha actual al parámetro de la consulta
        ps.setString(1, fechaActualStr);

        rs = ps.executeQuery();

        while (rs.next()) {
            Producto producto = new Producto();
            producto.setIdproducto(rs.getInt("IDPRODUCTO"));
            producto.setNombre(rs.getString("NOMBRE"));
            producto.setDescripcion(rs.getString("DESCRIPCION"));
            producto.setPrecio(rs.getDouble("PRECIO"));
            producto.setFoto(rs.getString("FOTO"));
            producto.setFecha_ven(rs.getString("FECHA_VEN"));
            producto.setIdcategoria(rs.getInt("CATEGORIA")); // Asumiendo que es el ID de la categoría

            productosProximosExpirarConDetalle.add(producto);
        }
    } catch (SQLException ex) {
        Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, "Error al obtener productos próximos a expirar con detalle", ex);
    } finally {
        // Cerrar objetos en este bloque
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (cn != null) {
                cn.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, "Error al cerrar recursos JDBC", ex);
        }
    }

    return productosProximosExpirarConDetalle;
}
public static ArrayList<String> getCategorias() {
        ArrayList<String> categorias = new ArrayList<>();

        // Consulta para obtener todas las categorías de la tabla 'categoria'
        String sql = "SELECT DISTINCT Categoria FROM categoria";
        Connection cn = Conexion.abrir();

        try {
            ResultSet rs;
            try (PreparedStatement ps = cn.prepareStatement(sql)) {
                rs = ps.executeQuery();
                while (rs.next()) {
                    categorias.add(rs.getString("Categoria"));
                }
            }
            cn.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(EmpleadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return categorias;
    }


}
