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
        <script src="validarForms.js" type="text/javascript"></script>
    </head>
    <body>
        <% Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");%>
        <c:if test="${usuario == null}">
            <c:redirect url="index.jsp"></c:redirect>
        </c:if>
        <div class="container-fluid">
            <div class="row-fluid">
                <div style="margin-left: 40%; margin-right: auto">
                    <legend class="display-6">Cargar exámen</legend>

                    <form class="form-horizontal" method="POST" action="guardarExamen.jsp" onsubmit="return validarForm()" onchange="validarForm()">
                        <div class="form-group row">
                            <label class="col-md-2 col-form-label">Alumno:</label>        
                            <div class="col-md-3">
                                <select class="form-control" id="idAlumno" name="idAlumno">
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
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 col-form-label">Tipo de examen:</label>
                            <div class="col-md-3">
                                <select class="form-control" id="idTipoExamen" name="idTipoExamen">
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
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 col-form-label">Nota:</label>
                            <div class="col-md-3">
                                <input class="form-control" type="number" min="1" max="10" id="nota" name="nota" /> 
                            </div>
                        </div>
                        <div class="form-group row">
                            <button type="submit" class="btn btn-primary">Guardar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
