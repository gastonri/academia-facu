/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos.Dto;

/**
 *
 * @author Gaston
 */
public class DtoExamen {
//    ex.id, al.legajo, al.nombre, al.apellido, ex.nota, ex.aprobado, cur.descripcion, tip.nombre

    private int id;
    private int legajo;
    private String nombre;
    private String apellido;
    private int nota;
    private boolean aprobado;
    private String descripcion;
    private String nombreExamen;

    public DtoExamen() {
    }

    public DtoExamen(int id, int legajo, String nombre, String apellido, int nota, boolean aprobado, String descripcion, String nombreExamen) {
        this.id = id;
        this.legajo = legajo;
        this.nombre = nombre;
        this.apellido = apellido;
        this.nota = nota;
        this.aprobado = aprobado;
        this.descripcion = descripcion;
        this.nombreExamen = nombreExamen;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLegajo() {
        return legajo;
    }

    public void setLegajo(int legajo) {
        this.legajo = legajo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getNota() {
        return nota;
    }

    public void setNota(int nota) {
        this.nota = nota;
    }

    public boolean isAprobado() {
        return aprobado;
    }

    public void setAprobado(boolean aprobado) {
        this.aprobado = aprobado;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getNombreExamen() {
        return nombreExamen;
    }

    public void setNombreExamen(String nombreExamen) {
        this.nombreExamen = nombreExamen;
    }

}
