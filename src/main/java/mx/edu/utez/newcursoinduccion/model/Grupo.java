package mx.edu.utez.newcursoinduccion.model;

import java.io.Serializable;

public class Grupo implements Serializable {

    private int id_grupo;
    private String letra;
    private int cantidad;

    public Grupo() {
    }

    public Grupo(int id_grupo, String letra, int cantidad) {
        this.id_grupo = id_grupo;
        this.letra = letra;
        this.cantidad = cantidad;
    }

    public int getId_grupo() {return id_grupo; }

    public void setId_grupo(int id_grupo) {
        this.id_grupo = id_grupo;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getLetra() {
        return letra;
    }

    public void setLetra(String letra) {
        this.letra = letra;
    }
}
