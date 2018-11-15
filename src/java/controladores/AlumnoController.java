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
import modelos.Alumno;
import modelos.Dto.DtoAlumno;

/**
 *
 * @author Gaston
 */
public class AlumnoController {

    Conexion con = new Conexion();

    // Metodos de alumnos
    public ArrayList<Alumno> consultarAlumnos() {
        ArrayList<Alumno> alumnos = new ArrayList();
        try {
            con.abrirConexion();
            Statement st = con.con.createStatement();
            ResultSet rs = st.executeQuery("Select * from Alumno;");
            while (rs.next()) {
                Alumno al = new Alumno();
                al.setId(rs.getInt(1));
                al.setLegajo(rs.getInt(2));
                al.setNombre(rs.getString(3));
                al.setApellido(rs.getString(4));
                al.setDni(rs.getString(5));
                al.setDireccion(rs.getString(6));
                al.setTelefono(rs.getString(7));
                al.setMail(rs.getString(8));
                alumnos.add(al);
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
        return alumnos;
    }

    public ArrayList<Alumno> consultarAlumnoPorId(int id) {
        Alumno alumno = new Alumno();
        ArrayList<Alumno> lista = new ArrayList();
        try {
            con.abrirConexion();
            PreparedStatement decla = con.con.prepareStatement("select * from alumno where id = ?");
            decla.setInt(1, id);
            ResultSet rs = decla.executeQuery();
            rs.next();
            alumno.setId(rs.getInt(1));
            alumno.setLegajo(rs.getInt(2));
            alumno.setNombre(rs.getString(3));
            alumno.setApellido(rs.getString(4));
            alumno.setDni(rs.getString(5));
            alumno.setDireccion(rs.getString(6));
            alumno.setTelefono(rs.getString(7));
            alumno.setMail(rs.getString(8));
            lista.add(alumno);
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

    public boolean agregarAlumno(Alumno alumno) {
        boolean inserto = false;
        try {
            con.abrirConexion();
            Statement st = con.con.createStatement();
            PreparedStatement decla = con.con.prepareStatement("insert into alumno(legajo, nombre, apellido, dni, direccion, telefono, mail) values(?, ?, ?, ?, ?, ?, ?)");
            decla.setInt(1, alumno.getLegajo());
            decla.setString(2, alumno.getNombre());
            decla.setString(3, alumno.getApellido());
            decla.setString(4, alumno.getDni());
            decla.setString(5, alumno.getDireccion());
            decla.setString(6, alumno.getTelefono());
            decla.setString(7, alumno.getMail());
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

    public boolean modificarAlumno(Alumno alumno) {
        boolean inserto = false;
        try {
            con.abrirConexion();
            Statement st = con.con.createStatement();
            PreparedStatement decla = con.con.prepareStatement("update alumno set legajo = ?, nombre = ?, apellido = ?, dni = ?, direccion = ?, telefono = ?, mail = ? where id = ?;");
            decla.setInt(1, alumno.getLegajo());
            decla.setString(2, alumno.getNombre());
            decla.setString(3, alumno.getApellido());
            decla.setString(4, alumno.getDni());
            decla.setString(5, alumno.getDireccion());
            decla.setString(6, alumno.getTelefono());
            decla.setString(7, alumno.getMail());
            decla.setInt(8, alumno.getId());
            decla.executeUpdate();
            inserto = true;
        } catch (Exception e) {
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

    public void borrarAlumno(int id) {
        try {
            con.abrirConexion();
            PreparedStatement decla = con.con.prepareStatement("delete from alumno where id = ?");
            decla.setInt(1, id);
            decla.executeUpdate();
        } catch (SQLException e) {
        } finally {
            try {
                con.cerrarConexion();
            } catch (Exception e) {
                System.out.println("Error en el cierre de la conexion:" + e.getMessage());
            }
        }
    }

    public ArrayList<DtoAlumno> alumnosPorCurso(int id) {
        ArrayList<DtoAlumno> lista = new ArrayList();
        try {
            con.abrirConexion();
            PreparedStatement decla = con.con.prepareStatement("select c.id, c.descripcion, a.legajo, a.nombre, a.apellido, a.dni, a.direccion, a.telefono, a.mail\n"
                    + "from alumno a, Inscripcion i, curso c\n"
                    + "where a.id = i.idAlumno\n"
                    + "and i.idCurso = c.id\n"
                    + "and i.idCurso = ?;");
            decla.setInt(1, id);
            ResultSet rs = decla.executeQuery();
            while (rs.next()) {
                DtoAlumno al = new DtoAlumno();
                al.setId(rs.getInt(1));
                al.setDescripcion(rs.getString(2));
                al.setLegajo(rs.getInt(3));
                al.setNombre(rs.getString(4));
                al.setApellido(rs.getString(5));
                al.setDni(rs.getString(6));
                al.setDireccion(rs.getString(7));
                al.setTelefono(rs.getString(8));
                al.setMail(rs.getString(9));
                lista.add(al);
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

    public ArrayList<DtoAlumno> alumnosConDescuento() {
        ArrayList<DtoAlumno> lista = new ArrayList();
        try {
            con.abrirConexion();
            PreparedStatement decla = con.con.prepareStatement("select distinct(a.id), a.legajo, a.dni, a.nombre, a.apellido\n"
                    + "  from Alumno a, Inscripcion i\n"
                    + "  where a.id = i.idAlumno\n"
                    + "  and i.porcentajeDescuento <> 0;");
            ResultSet rs = decla.executeQuery();
            while (rs.next()) {
                DtoAlumno al = new DtoAlumno();
                al.setId(rs.getInt(1));
                al.setLegajo(rs.getInt(2));
                al.setDni(rs.getString(3));
                al.setNombre(rs.getString(4));
                al.setApellido(rs.getString(5));
                lista.add(al);
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
