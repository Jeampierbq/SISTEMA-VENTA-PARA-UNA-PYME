
package tienda.modelo.bean;


public class Pedidos {
    private int id;
    private String fecha;
    private int total;
    private int idemp;
    private int idcliente;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getIdemp() {
        return idemp;
    }

    public void setIdemp(int idemp) {
        this.idemp = idemp;
    }

    public int getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(int idcliente) {
        this.idcliente = idcliente;
    }

    public Pedidos(int id, String fecha, int total, int idemp, int idcliente) {
        this.id = id;
        this.fecha = fecha;
        this.total = total;
        this.idemp = idemp;
        this.idcliente = idcliente;
    }
    
}
