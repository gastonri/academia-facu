<%-- 
    Document   : header
    Created on : 11/11/2018, 09:17:11
    Author     : Gaston
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Academia</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body style="margin: 0;">
        <div class="navbar">
            <a href="index.html">Home</a>
            <a href="#news">News</a>
            <div class="dropdown">
                <button class="dropbtn">Gestión de cursos
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="listarCursos">Listar cursos</a>
                    <a href="cargarCurso.jsp">Alta de curso</a>
                </div>
            </div> 
            <div class="dropdown">
                <button class="dropbtn">Gestión de alumnos
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="listarAlumnos">Listar alumnos</a>
                    <a href="cargarAlumno.jsp">Alta de alumno</a>
                </div>
            </div> 
            <div class="dropdown">
                <button class="dropbtn">Gestión de programas
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="listarProgramasHabilitados">Listar programas</a>
                    <a href="formularioProgramaRegistro.jsp">Alta de programa</a>
                </div>
            </div> 
            <a href="formularioExamenRegistro.jsp">Cargar exámen</a>
        </div>
    </body>
</html>
