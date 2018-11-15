<%-- 
    Document   : guardarExamen
    Created on : 10/11/2018, 16:09:36
    Author     : Gaston
--%>
<%@page import="controladores.ExamenController"%>
<%@page import="modelos.Examen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%
    int alumno = Integer.parseInt(request.getParameter("idAlumno"));
    int idTipoExamen = Integer.parseInt(request.getParameter("idTipoExamen"));
    int nota = Integer.parseInt(request.getParameter("nota"));
    Examen ex = new Examen();
    ex.setIdAlumno(alumno);
    ex.setIdTipoExamen(idTipoExamen);
    ex.setNota(nota);
    ex.setAprobado(ex.estaAprobado(nota));
    ExamenController con = new ExamenController();
    boolean inserto = con.agregarExamen(ex);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de exámen</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <% if (inserto) { %>
        <p>El exámen se insertó correctamente</p>
        <% } else { %>
        <p>Ocurrió un fallo en la inserción del exámen</p>
        <% }%>
        <a href="formularioExamenRegistro.jsp">Volver</a>
    </body>
</html>
