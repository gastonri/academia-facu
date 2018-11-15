<%-- 
    Document   : cargarAlumno
    Created on : 14/11/2018, 20:50:56
    Author     : Gaston
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta y modificación de curso</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="cargarAlumno.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container-fluid">
            <label>
                Formulario de ingreso de alumno:
            </label>
            <form  name="cargarAlumno" method="POST" action="cargarAlumno" onchange="validarForm()">
                <div class="row pb-3 inline-block">
                    <div class="d-inline">
                        <input type="text" id="nombreAlumno" name="nombreAlumno" placeholder="Nombre"/>
                    </div>
                    <div class="d-inline">
                        <input type="text" id="apellidoAlumno" name="apellidoAlumno" placeholder="Apellido"/>
                    </div>
                </div>
                <div class="row pb-3">
                    <div >
                        <input type="number" id="legajoAlumno" name="legajoAlumno" min="1" placeholder="Legajo" />
                        <div class="noti" id="notiLegajo" style="display: none;">
                            El número de legajo no puede ser menor que 1 ni mayor que 10 y debe ser un número entero.
                        </div>
                    </div>
                    <div>
                        <input type="number" id="dniAlumno" name="dniAlumno" min="1000000" max="99999999" placeholder="Dni"/>
                    </div>
                </div>
                <div class="row pb-3">
                    <input type="text" id="direccionAlumno" name="direccionAlumno" placeholder="Dirección"/>
                </div>
                <div class="row pb-3 inline-block">
                    <input type="text" id="telefonoAlumno" name="telefonoAlumno" placeholder="Teléfono"/>
                    <input type="email" id="emailAlumno" name="emailAlumno" placeholder="Email"/>
                </div>
                <div>
                    <input type="submit" id="guardar" class="btn btn-primary" value="Guardar" />
                </div>
            </form>
        </div>
    </body>
</html>
