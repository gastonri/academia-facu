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
    </head>
    <body>
        <h1>Modificar curso</h1>
        <div style="width: 900px; margin-left: auto; margin-right: auto">
            <c:forEach items="${cursoEditar}" var="p">
                <form action="editarCurso" method="post">
                    <div>
                        <label>Id del curso: ${p.id}</label>
                        <input type="hidden" name="id" value="${p.id}" />
                    </div>
                    <div>
                        <label>Descripción:</label>
                        <input type="text" value="${p.descripcion}" name="descripcion" />
                    </div>
                    <div>
                        <input type="submit" value="Guardar" />
                    </div>
                </form>
            </c:forEach>
        </div>
    </body>
</html>
