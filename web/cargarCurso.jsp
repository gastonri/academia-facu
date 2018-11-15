<%-- 
    Document   : cargarCurso
    Created on : 14/11/2018, 21:01:13
    Author     : Gaston
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta y modificación de curso</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form method="POST" action="cargarCurso">
            <div>
                <label>Id:</label>
                <input type="number" id="idCurso" name="idCurso"/>
            </div>
            <div>
                <label>Descripción:</label>
                <input type="text" id="descripcionCurso" name="descripcionCurso"/>
            </div>
            <div>
                <input type="submit" value="Guardar" />
            </div>
        </form>
    </body>
</html>
