<%-- 
    Document   : reportePromedioAlumnos
    Created on : 14/11/2018, 19:54:57
    Author     : Gaston
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Reporte curso seleccionado!</h1>
        <div>
            <table>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Legajo</th>
                        <th>Nombre del alumno</th>
                        <th>Apellido del alumno</th>
                        <th>Nota</th>
                        <th>Aprobado</th>
                        <th>Descripción</th>
                        <th>Nombre</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${lista}" var="al">
                    <tr>
                        <td>${al.id}</td>
                        <td>${al.legajo}</td>
                        <td>${al.nombre}</td>
                        <td>${al.apellido}</td>
                        <td>${al.nota}</td>
                        <td>${al.aprobado}</td>
                        <td>${al.descripcion}</td>
                        <td>${al.nombre}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
