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
import modelos.Dto.DtoPrograma;
import modelos.Programa;
import modelos.TipoPrograma;

/**
 *
 * @author Gaston
 */
public class ProgramasController {

    Conexion con = new Conexion();

    // Metodos de programas
    public boolean agregarPrograma(Programa programa) {
        boolean inserto = false;
        try {
            con.abrirConexion();
            Statement st = con.con.createStatement();
            PreparedStatement decla = con.con.prepareStatement("insert into programa(idAlumno, nombre, idTipo, habilitado) values(?, ?, ?, ?)");
            decla.setInt(1, programa.getIdAlumno());
            decla.setString(2, programa.getNombre());
            decla.setInt(3, programa.getIdTipo());
            decla.setBoolean(4, programa.getHabilitado());
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

    public ArrayList<DtoPrograma> consultarProgramasHabilitados() {
        ArrayList<DtoPrograma> programas = new ArrayList();
        try {
            con.abrirConexion();
            Statement st = con.con.createStatement();
            ResultSet rs = st.executeQuery("select p.id, idAlumno, a.nombre, a.apellido, p.nombre, tp.nombre\n"
                    + "from Programa p, alumno a, TipoPrograma tp\n"
                    + "where p.idAlumno = a.id\n"
                    + "and p.idTipo = tp.id\n"
                    + "and p.habilitado = '1';");
            while (rs.next()) {
                DtoPrograma pr = new DtoPrograma();
                pr.setId(rs.getInt(1));
                pr.setIdAlumno(rs.getInt(2));
                pr.setNombreAlumno(rs.getString(3));
                pr.setApellidoAlumno(rs.getString(4));
                pr.setNombre(rs.getString(5));
                pr.setTipoPrograma(rs.getString(6));
                programas.add(pr);
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
        return programas;
    }

    public ArrayList<DtoPrograma> consultarProgramas() {
        ArrayList<DtoPrograma> programas = new ArrayList();
        try {
            con.abrirConexion();
            Statement st = con.con.createStatement();
            ResultSet rs = st.executeQuery("select p.id, idAlumno, a.nombre, a.apellido, p.nombre, tp.nombre\n"
                    + "from Programa p, alumno a, TipoPrograma tp\n"
                    + "where p.idAlumno = a.id\n"
                    + "and p.idTipo = tp.id\n;");
            while (rs.next()) {
                DtoPrograma pr = new DtoPrograma();
                pr.setId(rs.getInt(1));
                pr.setIdAlumno(rs.getInt(2));
                pr.setNombreAlumno(rs.getString(3));
                pr.setApellidoAlumno(rs.getString(4));
                pr.setNombre(rs.getString(5));
                pr.setTipoPrograma(rs.getString(6));
                programas.add(pr);
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
        return programas;
    }

    // Metodos para los tipos de programas
    public ArrayList<TipoPrograma> consultarTipoPrograma() {
        ArrayList<TipoPrograma> listadoTPrograma = new ArrayList();
        try {
            con.abrirConexion();
            Statement st = con.con.createStatement();
            ResultSet rs = st.executeQuery("Select * from TipoPrograma;");
            while (rs.next()) {
                TipoPrograma tp = new TipoPrograma();
                tp.setId(rs.getInt(1));
                tp.setNombre(rs.getString(2));
                listadoTPrograma.add(tp);
            }
            con.cerrarConexion();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listadoTPrograma;
    }
}
