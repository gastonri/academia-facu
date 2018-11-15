/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modelos.Curso;
import modelos.Usuario;

/**
 *
 * @author Gaston
 */
public class AcademiaController {

    Conexion con = new Conexion();

    public String login(Usuario us) {
        String usuario = "";
        try {
            con.abrirConexion();
            PreparedStatement decla = con.con.prepareStatement("select usuario from curso where nombreUsuario = ? and contrasenia = ?");
            decla.setString(1, us.getUsuario());
            decla.setString(2, us.getContrasenia());
            ResultSet rs = decla.executeQuery();
            if (rs.next()) {
                usuario = rs.getString(1);
            }
        } catch (SQLException e) {
        } finally {
            try {
                con.cerrarConexion();
            } catch (Exception e) {
                System.out.println("Error en el cierre de la conexion:" + e.getMessage());
            }
        }
        return usuario;
    }
}
