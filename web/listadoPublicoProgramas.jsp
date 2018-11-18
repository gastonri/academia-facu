<%-- 
    Document   : listadoPublicoProgramas
    Created on : 18/11/2018, 12:07:31
    Author     : Gaston
--%>

<%@page import="modelos.Usuario"%>
<%@page import="modelos.Dto.DtoPrograma"%>
<%@page import="modelos.Programa"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controladores.ProgramasController"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Academia</title>
        <script src="js/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="js/popper.js/popper.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <% Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");%>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="index.jsp">Academia</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="listadoPublicoProgramas.jsp">Programas para descargar <span class="sr-only">(current)</span></a>
                    </li>
                    <c:if test="${usuario != null}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Gestión de alumnos
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="listarAlumnos">Listado de alumnos</a>
                                <a class="dropdown-item" href="cargarAlumno.jsp">Cargar alumno</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Gestión de cursos
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="listarCursos">Listado de cursos</a>
                                <a class="dropdown-item" href="cargarCurso.jsp">Cargar curso</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Gestión de Programas
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="listarProgramas">Listado de Programas</a>
                                <a class="dropdown-item" href="formularioProgramaRegistro.jsp">Cargar alumno</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Reportes
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="reporteAlumnosCurso.jsp">Alumnos por curso</a>
                                <a class="dropdown-item" href="listarDesaprobados">Alumnos desaprobados</a>
                                <a class="dropdown-item" href="reporteAlumnosDescuentos">Alumnos con descuento</a>
                            </div>
                        </li>                
                    </c:if>
                </ul>
                <c:if test="${usuario == null}">
                    <ul class="navbar-nav">
                        <form class="form-horizontal" method="POST" action="loginServlet">
                            <div class="row">
                                <div class="col">
                                    <input class="form-control" type="text" id="usuario" name="usuario" placeholder="Usuario" />
                                </div>
                                <div class="col">
                                    <input class="form-control" type="password" id="password" name="password" placeholder="Contraseña"/>
                                </div>
                                <div class="col">
                                    <button class="btn btn-primary" type="submit">Ingresar</button>
                                </div>
                            </div>
                        </form>
                    </ul>
                </c:if>
                <c:if test="${usuario != null}">
                    <ul class="navbar-nav">
                        <div class="row">
                            <li class="nav-item active">
                                <a class="btn btn-danger" href="logoutServlet">Logout</a>
                            </li>
                        </div>
                    </ul>
                </c:if>
            </div>
        </nav>

    <legend class="display-6">Listado de programas habilitados para descargar</legend>
    <div class="d-flex justify-content-center">
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Id</th>
                    <th>Alumno creador</th>
                    <th>Nombre de la aplicación</th>
                    <th>Tipo de aplicacion</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ProgramasController con = new ProgramasController();
                    ArrayList programas = con.consultarProgramasHabilitados();
                    for (Object prog : programas) {
                        DtoPrograma pr = (DtoPrograma) prog;
                %>                    
                <tr>
                    <td><%= pr.getId()%></td>
                    <td><%= pr.getApellidoAlumno()%>, <%= pr.getNombreAlumno()%></td>
                    <td><%= pr.getNombre()%></td>
                    <td><%= pr.getTipoPrograma()%></td>
                </tr>
                <% }%>
            </tbody>
        </table>
    </div>
</body>
</html>
