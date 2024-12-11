/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tienda.modelo.bean;


public class Articulos {
    private int idarticulo; 
    private String nombre; 
    private String descripcion; 
    private int precion; 
    private String foto; 
    private int idcategoria;

    public int getIdarticulo() {
        return idarticulo;
    }

    public void setIdarticulo(int idarticulo) {
        this.idarticulo = idarticulo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getPrecion() {
        return precion;
    }

    public void setPrecion(int precion) {
        this.precion = precion;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public int getIdcategoria() {
        return idcategoria;
    }

    public void setIdcategoria(int idcategoria) {
        this.idcategoria = idcategoria;
    }

    public Articulos(int idarticulo, String nombre, String descripcion, int precion, String foto, int idcategoria) {
        this.idarticulo = idarticulo;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precion = precion;
        this.foto = foto;
        this.idcategoria = idcategoria;
    }

    public Articulos() {
    }
    
}
