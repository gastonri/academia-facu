<%-- 
    Document   : listadoProgramasHabilitados
    Created on : 11/11/2018, 08:42:27
    Author     : Gaston
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de programas</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
    <legend class="display-6">Listado de programas habilitados para descargan</legend>
        <!--        <div>
                    <a href="cargarCurso.html">Carga de curso</a>
                </div>-->
        <div>
            <div class="d-flex justify-content-center">
                <table class="table table-striped table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th>Id</th>
                            <th>Alumno creador</th>
                            <th>Nombre de la aplicación</th>
                            <th>Tipo de aplicacion</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${lista}" var="pr">
                            <tr>
                                <td>${pr.id}</td>
                                <td>${pr.idAlumno} - ${pr.apellidoAlumno}, ${pr.nombreAlumno}</td>
                                <td>${pr.nombre}</td>
                                <td>${pr.tipoPrograma}</td>
                                <!--                            <td>
                                                                <a href="editarCurso?id=${lc.id}">Modificar</a>
                                                                <a href="eliminarCurso?id=${lc.id}">Eliminar</a>
                                                            </td>-->
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
    </body>
</html>
