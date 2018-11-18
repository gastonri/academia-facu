<%-- 
    Document   : formularioInscripcionExamen
    Created on : 14/11/2018, 11:16:59
    Author     : Gaston
--%>

<%@page import="modelos.Usuario"%>
<%@page import="modelos.Curso"%>
<%@page import="controladores.CursoController"%>
<%@page import="modelos.Alumno"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controladores.AlumnoController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
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
        <div class="container-fluid">
            <div class="row-fluid">
                <div style="margin-left: 40%; margin-right: auto">
                    <legend class="display-6">Inscribir alumno a curso</legend>
                    <form class="form-horizontal" method="post" action="inscribirAlumno" onchange="validarForm()" onsubmit="return validarForm()">
                        <div>
                            <%
                                String idAlumno = (String) request.getAttribute("idAlumno");
                            %>
                            <input type="hidden" value="<%= idAlumno%>" name="idAlumno" />
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 col-form-label">Curso:</label>
                            <div class="col-md-3">
                                <select class="form-control" id="idCurso" name="idCurso">
                                    <option value="">Seleccione</option>
                                    <%
                                        CursoController conCur = new CursoController();
                                        ArrayList cursos = conCur.consultarCursos();
                                        for (Object curso : cursos) {
                                            Curso cur = (Curso) curso;
                                    %>                    
                                    <option value="<%= cur.getId()%>"><%= cur.getDescripcion()%></option>
                                    <% }%>
                                </select>
                                <div id="idCursoValid"class="valid-feedback">
                                    Correcto!
                                </div>
                                <div id="idCursoInvalid"class="invalid-feedback">
                                    Por favor seleccione el curso al cual inscribirá al alumno.
                                </div>
                            </div>
                        </div>
                        <div>
                            <%
                                Float promedio = (Float) request.getAttribute("promedio");
                            %>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 col-form-label">Descuento de <%= promedio * 100%>%</label>
                            <input type="hidden" value="<%= promedio%>" name="descuento" />
                        </div>
                        <div>
                            <button class="btn btn-primary" type="submit">Guardar inscripción</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
