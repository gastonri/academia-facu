<%-- 
    Document   : reportePromedio
    Created on : 18/11/2018, 15:17:12
    Author     : Gaston
--%>
<%@page import="modelos.Alumno"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controladores.AlumnoController"%>
<%@page import="modelos.Usuario"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="validarForms.js" type="text/javascript"></script>
    </head>
    <body>
        <% Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");%>
        <c:if test="${usuario == null}">
            <c:redirect url="index.jsp"></c:redirect>
        </c:if>
    <legend class="display-6">Reporte de alumnos por curso</legend>
    <div class="container-fluid" style="margin-left: 30%;">
        <div class="row-fluid">
            <form class="form-horizontal" name="alumno" method="post" action="reportePromedioServlet" onsubmit="return validarForm()">
                <div class="row pb-3 inline-block">
                    <div class="col-md-1">
                        <label class="label">Alumno</label>
                    </div>
                    <div class="col-md-2">
                        <select class="form-control" name="idAlumno">
                            <option value="">Seleccione</option>
                            <%
                                AlumnoController alCon = new AlumnoController();
                                ArrayList alumnos = alCon.consultarAlumnos();
                                for (Object alumno : alumnos) {
                                    Alumno al = (Alumno) alumno;
                            %>                    
                            <option value="<%= al.getId()%>"><%= al.getApellido()%>, <%= al.getNombre()%></option>
                            <% }%>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <button class="btn btn-primary" type="submit">Guardar</button>
                    </div>
                </div>
            </form>
        </div>
        <% Float promedio = (Float) request.getSession().getAttribute("promedio");%>
        <c:if test="${promedio != null}">
            El promedio es de: ${promedio}
        </c:if>

        <div>

        </div>
    </div>
</body>
</html>
