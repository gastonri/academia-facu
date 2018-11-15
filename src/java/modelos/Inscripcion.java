/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

/**
 *
 * @author Gaston
 */
public class Inscripcion {

    private int idAlumno;
    private int idCurso;
    private float descuento;

    public Inscripcion() {
    }

    public Inscripcion(int idAlumno, int idCurso, float descuento) {
        this.idAlumno = idAlumno;
        this.idCurso = idCurso;
        this.descuento = descuento;
    }

    public int getIdAlumno() {
        return idAlumno;
    }

    public void setIdAlumno(int idAlumno) {
        this.idAlumno = idAlumno;
    }

    public int getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(int idCurso) {
        this.idCurso = idCurso;
    }

    public float getDescuento() {
        return descuento;
    }

    public void setDescuento(float descuento) {
        this.descuento = descuento;
    }
}
