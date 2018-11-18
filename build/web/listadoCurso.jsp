<%-- 
    Document   : listadoCurso
    Created on : 08/11/2018, 17:23:03
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
        <title>Listado de cursos</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <script src="validarForms.js" type="text/javascript"></script>
    </head>
    <body>
        <% Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");%>
        <c:if test="${usuario == null}">
            <c:redirect url="index.jsp"></c:redirect>
        </c:if>
    <legend class="display-6">Carga de curso:</legend>
    <div class="container-fluid" style="margin-left: 30%;">
        <div class="row-fluid">
            <form class="form-horizontal" method="POST" action="cargarCurso" onchange="validarForm()" onsubmit="return validarForm()">
                <div class="row pb-3 inline-block">
<!--                    <div class="col-md-2">
                        <input class="form-control" type="number" id="idCurso" min="1" max="999999" name="idCurso" placeholder="Id" />
                        <div id="idCursoValid"class="valid-feedback">
                            Correcto!
                        </div>
                        <div id="idCursoInvalid"class="invalid-feedback">
                            Por favor complete el campo con un id válido.
                        </div>
                    </div>-->
                    <div>
                        <input class="form-control" type="text" id="descripcionCurso" name="descripcionCurso" placeholder="Descripción"/>
                        <div id="descripcionCursoValid"class="valid-feedback">
                            Correcto!
                        </div>
                        <div id="descripcionCursoInvalid"class="invalid-feedback">
                            Por favor complete el nombre del curso.
                        </div>
                    </div>
                    <div style="padding-left: 15px;">
                        <button class="btn btn-primary" type="submit">Guardar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <legend class="display-6">Listado de cursos</legend>
    <div class="d-flex justify-content-center">
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th style="width: 5%">Id</th>
                    <th>Descripción</th>
                    <th style="width: 15%">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${lista}" var="lc">
                    <tr>
                        <td>${lc.id}</td>
                        <td>${lc.descripcion}</td>
                        <td>
                            <a class="btn mini btn-primary btn-sm" href="editarCurso?id=${lc.id}">Modificar</a>
                            <a class="btn mini btn-danger btn-sm" href="eliminarCurso?id=${lc.id}">Eliminar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
