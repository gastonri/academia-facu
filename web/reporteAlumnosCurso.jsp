<%-- 
    Document   : reporteCursoSeleccionado
    Created on : 14/11/2018, 19:10:22
    Author     : Gaston
--%>

<%@page import="modelos.Usuario"%>
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
        <% Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");%>
        <c:if test="${usuario == null}">
            <c:redirect url="index.jsp"></c:redirect>
        </c:if>
    <legend class="display-6">Reporte de alumnos por curso</legend>
    <div class="container-fluid" style="margin-left: 30%;">
        <div class="row-fluid">
            <form class="form-horizontal" name="cursoSeleccionado" method="post" action="listarCursos">
                <div class="row pb-3 inline-block">
                    <div class="col-md-1">
                        <label class="label">Curso:</label>
                    </div>
                    <div class="col-md-2">
                        <select class="form-control" name="idCursoSelect">
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
                    <div class="col-md-2">
                        <button class="btn btn-primary" type="submit">Guardar</button>
                    </div>
                </div>
            </form>
        </div>
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
