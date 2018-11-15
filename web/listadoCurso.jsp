<%-- 
    Document   : listadoCurso
    Created on : 08/11/2018, 17:23:03
    Author     : Gaston
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de cursos</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Listado de cursos</h1>
        <div>
            <a href="cargarCurso.html">Carga de curso</a>
        </div>
        <div>
            <table>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Descripción</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${lista}" var="lc">
                        <tr>
                            <td>${lc.id}</td>
                            <td>${lc.descripcion}</td>
                            <td>
                                <a href="editarCurso?id=${lc.id}">Modificar</a>
                                <a href="eliminarCurso?id=${lc.id}">Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
