<%-- 
    Document   : formularioAlumnoModificacion
    Created on : 10/11/2018, 20:39:09
    Author     : Gaston
--%>

<%@page import="modelos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar alumno</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
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
                    <legend class="display-6">Modificar alumno</legend>
                    <c:forEach items="${alumnoEditar}" var="a">
                        <form class="form-horizontal" action="editarAlumno" method="post" id="editarAlumno" onchange="validarForm()" onsubmit="return validarForm()" >
                            <div class="form-group row">
                                <label class="col-md-2 col-form-label" for="nombreAlumno">Nombre del alumno</label>
                                <div class="col-md-3">
                                    <input class="form-control" type="text" id="nombreAlumno" name="nombre" placeholder="Nombre" value="${a.nombre}" />
                                    <div id="apellidoAlumnoValid"class="valid-feedback">
                                        Correcto!
                                    </div>
                                    <div id="apellidoAlumnoInvalid"class="invalid-feedback">
                                        Por favor complete el nombre del alumno.
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 col-form-label" for="apellidoAlumno">Apellido del alumno</label>
                                <div class="col-md-3">
                                    <input class="form-control" type="text" id="apellidoAlumno" name="apellido" placeholder="Apellido" value="${a.apellido}" />
                                    <div id="apellidoAlumnoValid"class="valid-feedback">
                                        Correcto!
                                    </div>
                                    <div id="apellidoAlumnoInvalid"class="invalid-feedback">
                                        Por favor complete el apellido del alumno.
                                    </div>
                                </div>
                            </div>
                            <div>
                                <input type="hidden" name="id" value="${a.id}" />
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 col-form-label" for="legajo">Legajo</label>
                                <div class="col-md-3">
                                    <input class="form-control" type="number" value="${a.legajo}" name="legajo" id="legajo" min="1" max="9999999999"/>
                                    <div id="apellidoAlumnoValid"class="valid-feedback">
                                        Correcto!
                                    </div>
                                    <div id="apellidoAlumnoInvalid"class="invalid-feedback">
                                        Por favor ingrese el legajo del alumno.
                                    </div>

                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 col-form-label" for="dni">Dni</label>
                                <div class="col-md-3">
                                    <input class="form-control" type="number" value="${a.dni}" min="1000000" max="99999999" name="dni" id="dni"/>
                                    <div id="apellidoAlumnoValid"class="valid-feedback">
                                        Correcto!
                                    </div>
                                    <div id="apellidoAlumnoInvalid"class="invalid-feedback">
                                        Por favor complete el DNI del alumno considerando que sea un número valido.
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 col-form-label" for="direccion">Dirección</label>
                                <div class="col-md-3">
                                    <input class="form-control" type="text" value="${a.direccion}" name="direccion" id="direccion"/>
                                    <div id="apellidoAlumnoValid"class="valid-feedback">
                                        Correcto!
                                    </div>
                                    <div id="apellidoAlumnoInvalid"class="invalid-feedback">
                                        Por favor complete la dirección del alumno.
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 col-form-label" for="telefono">Teléfono</label>
                                <div class="col-md-3">
                                    <input  class="form-control" type="number" value="${a.telefono}" name="telefono" id="telefono" min="1000000" max="9999999999"/>
                                    <div id="apellidoAlumnoValid"class="valid-feedback">
                                        Correcto!
                                    </div>
                                    <div id="apellidoAlumnoInvalid"class="invalid-feedback">
                                        Por favor complete el telefono del alumno.
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-2 col-form-label" for="direccion">Email</label>
                                <div class="col-md-3">
                                    <input class="form-control" type="email" value="${a.mail}" name="mail" id="mail" />
                                    <div id="apellidoAlumnoValid"class="valid-feedback">
                                        Correcto!
                                    </div>
                                    <div id="apellidoAlumnoInvalid"class="invalid-feedback">
                                        Por favor complete el email del alumno.
                                    </div>
                                </div>
                            </div>
                            <div>
                                <button class="btn btn-primary" type="submit">Guardar</button>
                            </div>
                        </form>
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
</html>
