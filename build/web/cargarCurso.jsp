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
        <div class="container-fluid" style="margin-left: 30%;">
            <div class="row-fluid">
                <legend class="display-6">Carga de curso:</legend>
                <form class="form-horizontal" method="POST" action="cargarCurso">
                    <div class="row pb-3 inline-block">
                        <div class="col-md-2">
                            <input type="number" id="idCurso" name="idCurso" placeholder="id"/>
                        </div>
                        <div>
                            <input type="text" id="descripcionCurso" name="descripcionCurso" placeholder="Descripción"/>
                        </div>
                        <div>
                            <input type="submit" value="Guardar" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
