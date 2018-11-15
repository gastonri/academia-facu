<%-- 
    Document   : guardarPrograma
    Created on : 10/11/2018, 15:24:34
    Author     : Gaston
--%>
<%@page import="controladores.ProgramasController"%>
<%@page import="modelos.Programa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int alumno = Integer.parseInt(request.getParameter("idAlumno"));
    String nombreProg = request.getParameter("nombrePrograma");
    int idTipoProg = Integer.parseInt(request.getParameter("idTipoProg"));
    boolean habilitacion = Boolean.parseBoolean(request.getParameter("estaHabilitado"));

    Programa p = new Programa();
    p.setIdAlumno(alumno);
    p.setNombre(nombreProg);
    p.setIdTipo(idTipoProg);
    p.setHabilitado(habilitacion);

    ProgramasController con = new ProgramasController();
    boolean inserto = con.agregarPrograma(p);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carga de programas</title>
    </head>
    <body>
        <% if (inserto) { %>
        <p>El programa se insertó correctamente</p>
        <% } else { %>
        <p>Ocurrió un fallo en la inserción del programa</p>
        <% }%>

        <a href="formularioProgramaRegistro.jsp">Volver</a>
    </body>
</html>
