/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controladores.AlumnoController;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Alumno;

/**
 *
 * @author Gaston
 */
@WebServlet(name = "EditarAlumnoServlet", urlPatterns = {"/editarAlumno"})
public class EditarAlumnoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String idAlumno = request.getParameter("id");
        int id = Integer.parseInt(idAlumno);
        System.out.println(id);
        AlumnoController alumnoCont = new AlumnoController();
        request.setAttribute("alumnoEditar", alumnoCont.consultarAlumnoPorId(id));
        RequestDispatcher rd = request.getRequestDispatcher("formularioAlumnoModificacion.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            System.out.println("Pasó algo");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        int id = Integer.parseInt(request.getParameter("id"));
        int legajo = Integer.parseInt(request.getParameter("legajo"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String dni = request.getParameter("dni");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String email = request.getParameter("mail");

        Alumno al = new Alumno(id, legajo, nombre, apellido, dni, direccion, telefono, email);

        AlumnoController con = new AlumnoController();
        boolean inserto = con.modificarAlumno(al);
//        request.setAttribute("comprobacion", inserto);
//        RequestDispatcher rd = request.getRequestDispatcher("");
        String redirect = "";
        if (inserto) {
            redirect = "listarAlumnos";
        } else {
            redirect = "error.jsp";
        }
        try {
            response.sendRedirect(redirect);
        } catch (IOException ex) {
            System.out.println("Pasó algo");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
