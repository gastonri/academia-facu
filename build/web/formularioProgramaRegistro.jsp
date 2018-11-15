<%-- 
    Document   : cargarPrograma
    Created on : 10/11/2018, 15:08:32
    Author     : Gaston
--%>
<%@page import="modelos.TipoPrograma"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controladores.ProgramasController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Carga de programas</title>
        <!--idAlumno, String nombre, int idTipo, byte habilitado-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form method="POST" action="guardarPrograma.jsp">
            <div>
                <label>Id del Alumno:</label>
                <input type="number" id="idAlumno" name="idAlumno"/>
            </div>
            <div>
                <label>Nombre del programa:</label>
                <input type="text" id="nombrePrograma" name="nombrePrograma"/>
            </div>
            <div>
                <label>Id tipo del programa:</label>
                <select id="idTipoProg" name="idTipoProg">
                    <option>Seleccione</option>
                    <%
                        ProgramasController con = new ProgramasController();
                        ArrayList tiposProg = con.consultarTipoPrograma();
                        for (Object tipoProg : tiposProg) {
                            TipoPrograma tp = (TipoPrograma) tipoProg;
                    %>                    
                    <option value="<%= tp.getId()%>"><%= tp.getNombre()%></option>
                    <% }%>
                </select>
            </div>
            <div>
                <label>Habilitado para la descarga:</label>
                <select id="estaHabilitado" name="estaHabilitado">
                    <option value="true">Si</option>
                    <option value="false">No</option>
                </select>
            </div>
            <div>
                <input type="submit" value="Guardar" />
            </div>
        </form>
    </body>
</html>
