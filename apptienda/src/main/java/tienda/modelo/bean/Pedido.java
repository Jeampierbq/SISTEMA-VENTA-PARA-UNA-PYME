/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tienda.modelo.bean;

/**
 *
 * @author Apo
 */
public class Pedido {
    private int idpedido_detalle;
    private String nombre;
    private String ap_paterno;
    private String ap_materno;
    private int idproducto;
    private String nombrep;
    private int precio;
    private String fecha_ven;
    private int cantidad;
    private int subtotal;

    public int getIdpedido_detalle() {
        return idpedido_detalle;
    }

    public void setIdpedido_detalle(int idpedido_detalle) {
        this.idpedido_detalle = idpedido_detalle;
    }

    public String getNombrep() {
        return nombrep;
    }

    public void setNombrep(String nombrep) {
        this.nombrep = nombrep;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getAp_paterno() {
        return ap_paterno;
    }

    public void setAp_paterno(String ap_paterno) {
        this.ap_paterno = ap_paterno;
    }

    public String getAp_materno() {
        return ap_materno;
    }

    public void setAp_materno(String ap_materno) {
        this.ap_materno = ap_materno;
    }

    public int getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(int idproducto) {
        this.idproducto = idproducto;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public String getFecha_ven() {
        return fecha_ven;
    }

    public void setFecha_ven(String fecha_ven) {
        this.fecha_ven = fecha_ven;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(int subtotal) {
        this.subtotal = subtotal;
    }

    public Pedido(int idpedido_detalle, String nombrep, String nombre, String ap_paterno, String ap_materno, int idproducto, int precio, String fecha_ven, int cantidad, int subtotal) {
        this.idpedido_detalle = idpedido_detalle;
        this.nombrep = nombrep;
        this.nombre = nombre;
        this.ap_paterno = ap_paterno;
        this.ap_materno = ap_materno;
        this.idproducto = idproducto;
        this.precio = precio;
        this.fecha_ven = fecha_ven;
        this.cantidad = cantidad;
        this.subtotal = subtotal;
    }

    public Pedido() {
    }

   
    
}
