<%-- 
    Document   : formularioAlumnoModificacion
    Created on : 10/11/2018, 20:39:09
    Author     : Gaston
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar alumno</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Modificar alumno</h1>
        <div style="width: 900px; margin-left: auto; margin-right: auto">
            <c:forEach items="${alumnoEditar}" var="a">
                <form action="editarAlumno" method="post">
                    <div>
                        <label>Id del alumno: ${a.id}</label>
                        <input type="hidden" name="id" value="${a.id}" />
                    </div>
                    <div>
                        <label>Legajo:</label>
                        <input type="text" value="${a.legajo}" name="legajo" />
                    </div>
                    <div>
                        <label>Nombre:</label>
                        <input type="text" value="${a.nombre}" name="nombre" />
                    </div>
                    <div>
                        <label>Apellido:</label>
                        <input type="text" value="${a.apellido}" name="apellido" />
                    </div>
                    <div>
                        <label>DNI:</label>
                        <input type="text" value="${a.dni}" name="dni" />
                    </div>
                    <div>
                        <label>Dirección:</label>
                        <input type="text" value="${a.direccion}" name="direccion" />
                    </div>
                    <div>
                        <label>Teléfono:</label>
                        <input type="text" value="${a.telefono}" name="telefono" />
                    </div>
                    <div>
                        <label>Email:</label>
                        <input type="text" value="${a.mail}" name="mail" />
                    </div>
                    <div>
                        <input type="submit" value="Guardar" />
                    </div>
                </form>
            </c:forEach>
            <%--<c:choose>--%>
                <%--<c:when test=request.getAttribute("comprobacion")>--%>
            <!--<p>El alumno se modificó correctamente</p>-->
            <!--<p>Ocurrió un fallo en la modificación del alumno</p>-->
            <%--</c:choose>--%>
        </div>
    </body>
</html>
