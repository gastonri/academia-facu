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
public class Examen {

    private int id;
    private int idAlumno;
    private int idTipoExamen;
    private int nota;
    private boolean aprobado;

    public Examen() {
    }

    public Examen(int id, int idAlumno, int idTipoExamen, int nota, boolean aprobado) {
        this.id = id;
        this.idAlumno = idAlumno;
        this.idTipoExamen = idTipoExamen;
        this.nota = nota;
        this.aprobado = aprobado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdAlumno() {
        return idAlumno;
    }

    public void setIdAlumno(int idAlumno) {
        this.idAlumno = idAlumno;
    }

    public int getIdTipoExamen() {
        return idTipoExamen;
    }

    public void setIdTipoExamen(int idTipoExamen) {
        this.idTipoExamen = idTipoExamen;
    }

    public int getNota() {
        return nota;
    }

    public void setNota(int nota) {
        this.nota = nota;
    }

    public boolean getAprobado() {
        return aprobado;
    }

    public void setAprobado(boolean aprobado) {
        this.aprobado = aprobado;
    }

    public boolean estaAprobado(int nota) {
        boolean aprobado = false;
        if (nota >= 4) {
            aprobado = true;
        }
        return aprobado;
    }
}
