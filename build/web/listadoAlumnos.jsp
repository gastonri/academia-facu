<%-- 
    Document   : listadoAlumnos
    Created on : 10/11/2018, 20:31:59
    Author     : Gaston
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de alumnos</title>
    </head>
    <body>    
    <legend class="display-6">Listado de alumnos</legend>
    <div>
        <a href="cargarAlumno.jsp">Carga de alumno</a>
    </div>
    <div>
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Id</th>
                    <th>Legajo</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>DNI</th>
                    <th>Dirección</th>
                    <th>Teléfono</th>
                    <th>Email</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${lista}" var="al">
                    <tr>
                        <td>${al.id}</td>
                        <td>${al.legajo}</td>
                        <td>${al.nombre}</td>
                        <td>${al.apellido}</td>
                        <td>${al.dni}</td>
                        <td>${al.direccion}</td>
                        <td>${al.telefono}</td>
                        <td>${al.mail}</td>
                        <td>
                            <a class="btn mini btn-primary btn-sm" href="editarAlumno?id=${al.id}">Modificar</a>
                            <a class="btn mini btn-danger btn-sm" href="eliminarAlumno?id=${al.id}">Eliminar</a>
                            <a class="btn mini btn-success btn-sm" href="inscribirAlumno?id=${al.id}">Inscribir</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
