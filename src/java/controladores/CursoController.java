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
import modelos.Curso;
import modelos.Inscripcion;

/**
 *
 * @author Gaston
 */
public class CursoController {

    Conexion conec = new Conexion();

    // Metodos del curso
    public ArrayList<Curso> consultarCursos() {
        ArrayList<Curso> listadoCurso = new ArrayList();
        try {
            conec.abrirConexion();
            Statement st = conec.con.createStatement();
            ResultSet rs = st.executeQuery("Select * from Curso;");
            while (rs.next()) {
                Curso curso = new Curso();
                curso.setId(rs.getInt(1));
                curso.setDescripcion(rs.getString(2));
                listadoCurso.add(curso);
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            try {
                conec.cerrarConexion();
            } catch (Exception e) {
                System.out.println("Error en el cierre de la conexion:" + e.getMessage());
            }
        }
        return listadoCurso;
    }

    public void agregarCurso(Curso curso) {
        try {
            conec.abrirConexion();
            Statement st = conec.con.createStatement();
            PreparedStatement decla = conec.con.prepareStatement("insert into curso(descripcion) values(?)");
            decla.setString(1, curso.getDescripcion());
            decla.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            try {
                conec.cerrarConexion();
            } catch (Exception e) {
                System.out.println("Error en el cierre de la conexion:" + e.getMessage());
            }
        }
    }

    public boolean modificarCurso(Curso curso) {
        boolean inserto = false;
        try {
            conec.abrirConexion();
            Statement st = conec.con.createStatement();
            PreparedStatement decla = conec.con.prepareStatement("update curso set descripcion = ? where id = ?;");
            decla.setString(1, curso.getDescripcion());
            decla.setInt(2, curso.getId());
            decla.executeUpdate();
            inserto = true;
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                conec.cerrarConexion();
            } catch (Exception e) {
                System.out.println("Error en el cierre de la conexion:" + e.getMessage());
            }
        }
        return inserto;
    }

    public ArrayList<Curso> consultarCursoPorId(int id) {
        Curso curso = new Curso();
        ArrayList<Curso> lista = new ArrayList();
        try {
            conec.abrirConexion();
            PreparedStatement decla = conec.con.prepareStatement("select * from curso where id = ?");
            decla.setInt(1, id);
            ResultSet rs = decla.executeQuery();
            rs.next();
            curso.setId(rs.getInt(1));
            curso.setDescripcion(rs.getString(2));
            lista.add(curso);
        } catch (SQLException e) {
        } finally {
            try {
                conec.cerrarConexion();
            } catch (Exception e) {
                System.out.println("Error en el cierre de la conexion:" + e.getMessage());
            }
        }
        return lista;
    }

    public void borrarCurso(int id) {
        try {
            conec.abrirConexion();
            PreparedStatement decla = conec.con.prepareStatement("delete from curso where id = ?");
            decla.setInt(1, id);
            decla.executeQuery();
//            ResultSet rs = decla.executeQuery();
        } catch (SQLException e) {
        } finally {
            try {
                conec.cerrarConexion();
            } catch (Exception e) {
                System.out.println("Error en el cierre de la conexion:" + e.getMessage());
            }
        }
    }

    public boolean inscribirCursada(Inscripcion ins) {
        boolean inserto = false;
        try {
            conec.abrirConexion();
            Statement st = conec.con.createStatement();
            PreparedStatement decla = conec.con.prepareStatement("insert into inscripcion values(?, ?, ?)");
            decla.setInt(1, ins.getIdCurso());
            decla.setInt(2, ins.getIdAlumno());
            decla.setFloat(3, ins.getDescuento());
            decla.executeUpdate();
            inserto = true;
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            try {
                conec.cerrarConexion();
            } catch (Exception e) {
                System.out.println("Error en el cierre de la conexion:" + e.getMessage());
            }
        }
        return inserto;
    }
}
