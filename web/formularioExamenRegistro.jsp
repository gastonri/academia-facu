<%-- 
    Document   : formularioExamenRegistro
    Created on : 10/11/2018, 15:42:55
    Author     : Gaston
--%>
<%@page import="modelos.Usuario"%>
<%@page import="modelos.Alumno"%>
<%@page import="modelos.TipoExamen"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controladores.AlumnoController"%>
<%@page import="controladores.ExamenController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de exámen</title>
    </head>
    <body>
        <% Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");%>
        <c:if test="${usuario == null}">
            <c:redirect url="index.jsp"></c:redirect>
        </c:if>
        <form method="POST" action="guardarExamen.jsp">
            <div>
                <label>Alumno:</label>
                <select id="idAlumno" name="idAlumno">
                    <option>Seleccione</option>
                    <%
                        AlumnoController con = new AlumnoController();
                        ArrayList alumnos = con.consultarAlumnos();
                        for (Object alumn : alumnos) {
                            Alumno al = (Alumno) alumn;
                    %>                    
                    <option value="<%= al.getId()%>"><%= al.getApellido()%>, <%= al.getNombre()%></option>
                    <% }%>
                </select>
            </div>
            <div>
                <label>Tipo de examen:</label>
                <select id="idTipoExamen" name="idTipoExamen">
                    <option>Seleccione</option>
                    <%
                        ExamenController conEx = new ExamenController();
                        ArrayList tipoExamen = conEx.consultarTipoExamen();
                        for (Object texam : tipoExamen) {
                            TipoExamen te = (TipoExamen) texam;
                    %>                    
                    <option value="<%= te.getId()%>"><%= te.getNombre()%></option>
                    <% }%>
                </select>
            </div>
            <div>
                <label>Nota:</label>
                <input type="number" id="nota" name="nota" min="1" max="10" /> 
            </div>
            <div>
                <input type="submit" value="Guardar" />
            </div>
        </form>
    </body>
</html>
