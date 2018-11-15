/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controladores.CursoController;
import modelos.Inscripcion;
import controladores.ExamenController;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Gaston
 */
@WebServlet(name = "InscribirAlumnoServlet", urlPatterns = {"/inscribirAlumno"})
public class InscribirAlumnoServlet extends HttpServlet {

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
        ExamenController examenCont = new ExamenController();
        request.setAttribute("idAlumno", idAlumno);
        request.setAttribute("promedio", examenCont.consultarPromedioAlumno(id));
        RequestDispatcher rd = request.getRequestDispatcher("formularioInscripcionCurso.jsp");
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
        int idAlumno = Integer.parseInt(request.getParameter("idAlumno"));
        int idCurso = Integer.parseInt(request.getParameter("idCurso"));
        float descuento = Float.parseFloat(request.getParameter("descuento"));

        Inscripcion ins = new Inscripcion();
        ins.setIdAlumno(idAlumno);
        ins.setIdCurso(idCurso);
        ins.setDescuento(descuento);

        CursoController con = new CursoController();
        boolean inserto = con.inscribirCursada(ins);
//        request.setAttribute("comprobacion", inserto);
//        RequestDispatcher rd = request.getRequestDispatcher("listarAlumnos");
//        System.out.println(requestDis.);
        String redirect = "";
        if (inserto) {
            redirect = "listarAlumnos";
        } else {
            redirect = "error.jsp";
        }
        try {
            response.sendRedirect(redirect);
//            rd.forward(request, response);
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
