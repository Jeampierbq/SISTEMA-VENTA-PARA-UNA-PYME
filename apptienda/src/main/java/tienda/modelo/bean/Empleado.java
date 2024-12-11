/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tienda.modelo.bean;


public class Empleado {
    private int idimp;
    private String nombre;
    private String app;
    private String apm;
    private String cargo;

    public int getIdimp() {
        return idimp;
    }

    public void setIdimp(int idimp) {
        this.idimp = idimp;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApp() {
        return app;
    }

    public void setApp(String app) {
        this.app = app;
    }

    public String getApm() {
        return apm;
    }

    public void setApm(String apm) {
        this.apm = apm;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public Empleado(int idimp, String nombre, String app, String apm, String cargo) {
        this.idimp = idimp;
        this.nombre = nombre;
        this.app = app;
        this.apm = apm;
        this.cargo = cargo;
    }
    
}
