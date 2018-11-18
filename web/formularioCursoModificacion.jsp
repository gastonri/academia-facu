<%-- 
    Document   : formularioCursoModificacion
    Created on : 10/11/2018, 17:05:52
    Author     : Gaston
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar curso</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <script src="validarForms.js" type="text/javascript"></script>
    </head>
    <body>
        <div style="margin-left: 40%; margin-right: auto">
            <c:forEach items="${cursoEditar}" var="p">
                <form class="form-horizontal" action="editarCurso" method="post" onchange="validarForm()" onsubmit="return validarForm()">
                    <legend class="display-6">Modificar curso</legend>

                    <div class="form-group row">
                        <label class="col-md-2 col-form-label">Id del curso: ${p.id}</label>
                        <div class="col-md-3">
                            <input class="form-control" type="hidden" name="id" value="${p.id}" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-2 col-form-label">Descripción:</label>
                        <div class="col-md-3">
                            <input class="form-control" type="text" value="${p.descripcion}" name="descripcion" />
                            <div id="apellidoAlumnoValid"class="valid-feedback">
                                Correcto!
                            </div>
                            <div id="apellidoAlumnoInvalid"class="invalid-feedback">
                                Por favor complete el nombre del alumno.
                            </div>
                        </div>
                    </div>
                    <div>
                        <button class="btn btn-primary" type="submit">Guardar</button>
                    </div>
                </form>
            </c:forEach>
        </div>
    </body>
</html>
