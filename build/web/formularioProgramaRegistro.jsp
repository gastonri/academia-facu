<%-- 
    Document   : cargarPrograma
    Created on : 10/11/2018, 15:08:32
    Author     : Gaston
--%>
<%@page import="modelos.Usuario"%>
<%@page import="modelos.Alumno"%>
<%@page import="controladores.AlumnoController"%>
<%@page import="modelos.TipoPrograma"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controladores.ProgramasController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Carga de programas</title>
        <!--idAlumno, String nombre, int idTipo, byte habilitado-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <script src="validarForms.js" type="text/javascript"></script>
    </head>
    <body> 
        <% Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");%>
        <c:if test="${usuario == null}">
            <c:redirect url="index.jsp"></c:redirect>
        </c:if>
        <div class="container-fluid" style="margin-left: 30%;">
            <div class="row-fluid">
                <legend class="display-6">
                    Carga de programas:
                </legend>

                <form class="form-horizontal" method="POST" action="guardarPrograma.jsp" onchange="validarForm()" onsubmit="return validarForm()">
                    <div class="form-group row">
                        <label class="col-md-2 col-form-label">Alumno:</label>
                        <div class="col-md-3">
                            <select class="form-control" id="idAlumno" name="idAlumno">
                                <option value="">Seleccione</option>
                                <%
                                    AlumnoController conAl = new AlumnoController();
                                    ArrayList alumnos = conAl.consultarAlumnos();
                                    for (Object alumn : alumnos) {
                                        Alumno al = (Alumno) alumn;
                                %>                    
                                <option value="<%= al.getId()%>"><%= al.getApellido()%>, <%= al.getNombre()%></option>
                                <% }%>
                            </select>
                            <div id="idAlumnoValid"class="valid-feedback">
                                Correcto!
                            </div>
                            <div id="idAlumnooInvalid"class="invalid-feedback">
                                Por favor seleccione un alumno.
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-2 col-form-label">Nombre del programa:</label>
                        <div class="col-md-3">
                            <input class="form-control" type="text" id="nombrePrograma" name="nombrePrograma"/>
                            <div id="nombreProgramaValid"class="valid-feedback">
                                Correcto!
                            </div>
                            <div id="nombreProgramaInvalid"class="invalid-feedback">
                                Por favor ingrese el nombre del programa.
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-2 col-form-label">Id tipo del programa:</label>
                        <div class="col-md-3">
                            <select class="form-control" id="idTipoProg" name="idTipoProg">
                                <option value="">Seleccione</option>
                                <%
                                    ProgramasController con = new ProgramasController();
                                    ArrayList tiposProg = con.consultarTipoPrograma();
                                    for (Object tipoProg : tiposProg) {
                                        TipoPrograma tp = (TipoPrograma) tipoProg;
                                %>                    
                                <option value="<%= tp.getId()%>"><%= tp.getNombre()%></option>
                                <% }%>
                            </select>
                            <div id="idTipoProgValid"class="valid-feedback">
                                Correcto!
                            </div>
                            <div id="idTipoProgInvalid"class="invalid-feedback">
                                Por favor seleccione el tipo de programa.
                            </div>

                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-2 col-form-label">Habilitado para la descarga:</label>
                        <div class="col-md-3">
                            <select class="form-control" id="estaHabilitado" name="estaHabilitado">
                                <option value="true">Si</option>
                                <option value="false">No</option>
                            </select>
                            <div id="estaHabilitadoValid"class="valid-feedback">
                                Correcto!
                            </div>
                            <div id="estaHabilitadoInvalid"class="invalid-feedback">
                                Por favor informe si el programa puede ser descargado.
                            </div>
                        </div>
                    </div>
                    <div>
                        <button class="btn btn-primary" type="submit">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
