<%-- 
    Document   : formularioInscripcionExamen
    Created on : 14/11/2018, 11:16:59
    Author     : Gaston
--%>

<%@page import="modelos.Curso"%>
<%@page import="controladores.CursoController"%>
<%@page import="modelos.Alumno"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controladores.AlumnoController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="inscribirAlumno">
            <div>
                <%
                    String idAlumno = (String) request.getAttribute("idAlumno");
                %>
                <input type="hidden" value="<%= idAlumno%>" name="idAlumno" />
            </div>
            <div>
                <label>Curso:</label>
                <select id="idCurso" name="idCurso">
                    <option>Seleccione</option>
                    <%
                        CursoController conCur = new CursoController();
                        ArrayList cursos = conCur.consultarCursos();
                        for (Object curso : cursos) {
                            Curso cur = (Curso) curso;
                    %>                    
                    <option value="<%= cur.getId()%>"><%= cur.getDescripcion()%></option>
                    <% }%>
                </select>

            </div>
            <div>
                <%
                    Float promedio = (Float) request.getAttribute("promedio");
                %>
            </div>
            <div>
                <label>Descuento de <%= promedio * 100%>%</label>
                <input type="hidden" value="<%= promedio%>" name="descuento" />
            </div>
            <div>
                <input type="submit" value="Guardar inscripción"/>
            </div>
        </form>
    </body>
</html>
