
package tienda.modelo.bean;

/**
 *
 * @author EDISON
 */
public class Cliente {
    private int idcliente;
    private String nombre;
    private String ap_paterno;
    private String ap_materno;
    private String DNI;
    private String celular;

    public int getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(int idcliente) {
        this.idcliente = idcliente;
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

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public Cliente(int idcliente, String nombre, String ap_paterno, String ap_materno, String DNI, String celular) {
        this.idcliente = idcliente;
        this.nombre = nombre;
        this.ap_paterno = ap_paterno;
        this.ap_materno = ap_materno;
        this.DNI = DNI;
        this.celular = celular;
    }
    
    public Cliente() {
    }
}
