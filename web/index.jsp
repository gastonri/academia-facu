<%-- 
    Document   : index
    Created on : 18/11/2018, 09:09:46
    Author     : Gaston
--%>

<%@page import="modelos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <div id="hero-bg" style="background-image: url(&quot;//sc.acamica.com/img/1j7w9h/home-hero/bg4.jpg&quot;); padding: 40px 0 180px 0"> 
            <div></div> 
            <div>
                <div> 
                    <div> 
                        <a>
                            <img src="//sc.acamica.com/m238n7g2e/img/iso-white.svg" alt="Isotipo de Acámica">
                            </hrefa>
                        </a> 
                        <h1 style="color: white;">Pasión por aprender</h1> 
                        <p style="color: white;">Vení y aprende.</p>
                    </div>
                </div> 
            </div> 
        </div>
        <div class="row">
            <div class="col-md-5" style="display: block; margin: 15px auto;">
                <h3>Aprende haciendo</h3>
                <p>
                    Trabaja en proyectos de situaciones reales, aprendiendo de una manera práctica y relevante.
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-5" style="display: block; margin: 15px auto;">
                <h3>Con la mentoría de expertos</h3>
                <p>
                    Vive una experiencia personalizada en grupos reducidos, acompañado de profesionales de la comunidad tecnológica.
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-5" style="display: block; margin: 15px auto;">
                <h3>En espacios innovadores</h3>
                <p>
                    Elige una de nuestras sedes en oficinas de tecnología o cursa a distancia estés donde estés.
                </p>
            </div>
        </div>

        <p style="color: gray;">Textos e imagen de index.jsp tomados de acamica.com</p>
    </body>
</html>
