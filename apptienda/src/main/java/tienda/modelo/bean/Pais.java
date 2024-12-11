
package tienda.modelo.bean;


public class Pais {
    private int idpais;
    private String pais;

    public int getIdpais() {
        return idpais;
    }

    public void setIdpais(int idpais) {
        this.idpais = idpais;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public Pais(int idpais, String pais) {
        this.idpais = idpais;
        this.pais = pais;
    }
}
