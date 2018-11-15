/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Gaston
 */
public class Conexion {

    public Connection con;

    public void abrirConexion() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            con = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-D7T5PAG\\LOCAL:2800;databaseName=Academia", "sa", "local");
        } catch (Exception e) {
            System.out.println("Conexion abrir");
            System.out.println(e);
        }
    }

    public void cerrarConexion() {
        try {
            con.close();
        } catch (SQLException e) {
            System.out.println("Conexion cerrar");
            System.out.println(e);
        }
    }

}
