/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import modelos.Dto.DtoExamen;
import modelos.Examen;
import modelos.TipoExamen;

/**
 *
 * @author Gaston
 */
public class ExamenController {

    Conexion con = new Conexion();

    // Metodos para los tipos de examenes
    public ArrayList<TipoExamen> consultarTipoExamen() {
        ArrayList<TipoExamen> listadoTExamen = new ArrayList();
        try {
            con.abrirConexion();
            Statement st = con.con.createStatement();
            ResultSet rs = st.executeQuery("Select * from TipoExamen;");
            while (rs.next()) {
                TipoExamen te = new TipoExamen();
                te.setId(rs.getInt(1));
                te.setNombre(rs.getString(2));
                listadoTExamen.add(te);
            }
            con.cerrarConexion();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listadoTExamen;
    }

    public boolean agregarExamen(Examen ex) {
        boolean inserto = false;
        try {
            con.abrirConexion();
            Statement st = con.con.createStatement();
            PreparedStatement decla = con.con.prepareStatement("insert into examen(idAlumno, idTipoExamen, nota, aprobado) values(?, ?, ?, ?)");
            decla.setInt(1, ex.getIdAlumno());
            decla.setInt(2, ex.getIdTipoExamen());
            decla.setInt(3, ex.getNota());
            decla.setBoolean(4, ex.getAprobado());
            decla.executeUpdate();
            inserto = true;
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            try {
                con.cerrarConexion();
            } catch (Exception e) {
                System.out.println("Error en el cierre de la conexion:" + e.getMessage());
            }
        }
        return inserto;
    }

    // Para descuento
    public float consultarPromedioAlumno(int id) {
        float descuento = 0;
        try {
            con.abrirConexion();
            Statement st = con.con.createStatement();
            PreparedStatement decla = con.con.prepareStatement("select avg(ex.nota) from Examen ex where ex.idAlumno = ?");
            decla.setInt(1, id);
            ResultSet rs = decla.executeQuery();
            if (rs.next()) {
                if (rs.getInt(1) > 9) {
                    descuento = 0.5f;
                } else if (rs.getInt(1) == 8) {
                    descuento = 0.2f;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            try {
                con.cerrarConexion();
            } catch (Exception e) {
                System.out.println("Error en el cierre de la conexion:" + e.getMessage());
            }
        }
        return descuento;
    }

        public float consultarPromedio(int id) {
        float promedio = 0;
        try {
            con.abrirConexion();
            Statement st = con.con.createStatement();
            PreparedStatement decla = con.con.prepareStatement("select avg(ex.nota) from Examen ex where ex.idAlumno = ?");
            decla.setInt(1, id);
            ResultSet rs = decla.executeQuery();
            if (rs.next()) {
                promedio = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            try {
                con.cerrarConexion();
            } catch (Exception e) {
                System.out.println("Error en el cierre de la conexion:" + e.getMessage());
            }
        }
        return promedio;
    }

    
    public ArrayList<DtoExamen> obtenerExamenesDesaprobados() {
        ArrayList<DtoExamen> lista = new ArrayList();
        try {
            con.abrirConexion();
            PreparedStatement decla = con.con.prepareStatement("select ex.id, al.legajo, al.nombre, al.apellido, ex.nota, ex.aprobado, cur.descripcion, tip.nombre\n"
                    + "from Examen ex, alumno al, curso cur, TipoExamen tip, Inscripcion ins\n"
                    + "where ex.idAlumno = al.id\n"
                    + "and al.id = ins.idAlumno\n"
                    + "and ins.idCurso = cur.id\n"
                    + "and ex.idTipoExamen = tip.id\n"
                    + "and ex.aprobado = 0;");
            ResultSet rs = decla.executeQuery();
            while (rs.next()) {
                DtoExamen ex = new DtoExamen();
                ex.setId(rs.getInt(1));
                ex.setLegajo(rs.getInt(2));
                ex.setNombre(rs.getString(3));
                ex.setApellido(rs.getString(4));
                ex.setNota(rs.getInt(5));
                ex.setAprobado(rs.getBoolean(6));
                ex.setDescripcion(rs.getString(7));
                ex.setNombre(rs.getString(8));
                lista.add(ex);
            }
        } catch (SQLException e) {
        } finally {
            try {
                con.cerrarConexion();
            } catch (Exception e) {
                System.out.println("Error en el cierre de la conexion:" + e.getMessage());
            }
        }
        return lista;
    }
}
