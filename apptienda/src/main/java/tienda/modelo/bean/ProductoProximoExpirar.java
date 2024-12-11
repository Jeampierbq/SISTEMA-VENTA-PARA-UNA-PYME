/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tienda.modelo.bean;

/**
 *
 * @author Apo
 */
public class ProductoProximoExpirar {
    private String nombre;
    private String categoria;
    private int cantidad;
    private String fechaVencimiento;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getFechaVencimiento() {
        return fechaVencimiento;
    }

    public void setFechaVencimiento(String fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }

    public ProductoProximoExpirar(String nombre, String categoria, int cantidad, String fechaVencimiento) {
        this.nombre = nombre;
        this.categoria = categoria;
        this.cantidad = cantidad;
        this.fechaVencimiento = fechaVencimiento;
    }

    public ProductoProximoExpirar() {
    }
    
    
}
