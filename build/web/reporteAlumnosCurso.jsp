<%-- 
    Document   : reporteCursoSeleccionado
    Created on : 14/11/2018, 19:10:22
    Author     : Gaston
--%>

<%@page import="modelos.Curso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controladores.CursoController"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <legend class="display-6">Reporte de alumnos por curso</legend>
    <div>
        <form name="cursoSeleccionado" method="post" action="listarCursos">
            <div>
                <select name="idCursoSelect">
                    <option>Seleccione</option>
                    <%
                        CursoController conCur = new CursoController();
                        ArrayList cursos = conCur.consultarCursos();
                        for (Object curso : cursos) {
                            Curso cur = (Curso) curso;
                    %>                    
                    <option value="<%= cur.getId()%>"><%= cur.getDescripcion()%></option>
                    <% }%>
                </select>
            </div>
            <input type="submit" value="Consultar"/>
        </form>
    </div>
    <div>
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <!--id, c.descripcion, a.legajo, a.nombre, a.apellido, a.dni, a.direccion, a.telefono, a.mail-->
                    <th>Id</th>
                    <th>Descripción</th>
                    <th>Legajo</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Dni</th>
                    <th>Dirección</th>
                    <th>Teléfono</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${lista}" var="al">
                    <tr>
                        <td>${al.id}</td>
                        <td>${al.descripcion}</td>
                        <td>${al.legajo}</td>
                        <td>${al.nombre}</td>
                        <td>${al.apellido}</td>
                        <td>${al.dni}</td>
                        <td>${al.direccion}</td>
                        <td>${al.telefono}</td>
                        <td>${al.mail}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>
