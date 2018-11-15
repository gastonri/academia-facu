/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controladores.CursoController;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Curso;

/**
 *
 * @author Gaston
 */
@WebServlet(name = "EditarCursoServlet", urlPatterns = {"/editarCurso"})
public class EditarCursoServlet extends HttpServlet {

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
        String idCurso = request.getParameter("id");
        int id = Integer.parseInt(idCurso);
        System.out.println(id);
        CursoController cursoCont = new CursoController();
        request.setAttribute("cursoEditar", cursoCont.consultarCursoPorId(id));
        RequestDispatcher rd = request.getRequestDispatcher("formularioCursoModificacion.jsp");
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
        String descripcion = request.getParameter("descripcion");
        Curso cur = new Curso();
        cur.setId(id);
        cur.setDescripcion(descripcion);

        CursoController con = new CursoController();
        boolean inserto = con.modificarCurso(cur);
//        request.setAttribute("comprobacion", inserto);
//        RequestDispatcher rd2 = getServletContext().getRequestDispatcher("/pantallaAltaCompleta.jsp");
//        rd2.forward(request, response);
        String redirect = "";
        if (inserto) {
            redirect = "listarCursos";
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
