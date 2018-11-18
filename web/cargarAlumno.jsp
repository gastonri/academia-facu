<%-- 
    Document   : cargarAlumno
    Created on : 14/11/2018, 20:50:56
    Author     : Gaston
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta y modificación de curso</title>
        <script src="cargarAlumno.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container-fluid" style="margin-left: 30%;">
            <div class="row-fluid">
                <legend class="display-6">
                    Formulario de ingreso de alumno:
                </legend>
                <form class="form-horizontal" name="cargarAlumno" method="POST" action="cargarAlumno">
                    <div class="row pb-3 inline-block">
                        <div class="col-md-2">
                            <input class="form-control" type="text" id="nombreAlumno" name="nombreAlumno" placeholder="Nombre"/>
                        </div>
                        <div class="col-md-2">
                            <input class="form-control" type="text" id="apellidoAlumno" name="apellidoAlumno" placeholder="Apellido"/>
                        </div>
                    </div>
                    <div class="row pb-3 inline-block">
                        <div class="col-md-2">
                            <input class="form-control" type="number" id="legajoAlumno" name="legajoAlumno" min="1" placeholder="Legajo" />
                            <!--                        <div class="noti" id="notiLegajo" style="display: none;">
                                                        El número de legajo no puede ser menor que 1 ni mayor que 10 y debe ser un número entero.
                                                    </div>-->
                        </div>
                        <div class="col-md-2">
                            <input class="form-control" type="number" id="dniAlumno" name="dniAlumno" min="1000000" max="99999999" placeholder="Dni"/>
                        </div>
                    </div>
                    <div class="row pb-3">
                        <div class="col-md-4">
                            <input class="form-control" type="text" id="direccionAlumno" name="direccionAlumno" placeholder="Dirección"/>
                        </div>
                    </div>
                    <div class="row pb-3 inline-block">
                        <div class="col-md-2">
                            <input class="form-control" type="text" id="telefonoAlumno" name="telefonoAlumno" placeholder="Teléfono"/>
                        </div>
                        <div class="col-md-2">
                            <input class="form-control" type="email" id="emailAlumno" name="emailAlumno" placeholder="Email"/>
                        </div>
                    </div>
                    <div class="row pb-3 inline-block">
                        <div class="col-md-1">
                            <input type="submit" id="guardar" class="btn btn-primary" value="Guardar" />
                        </div>
                        <div class="col-md-1">
                            <input type="button" id="guardar" class="btn btn-danger" value="Limpiar" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
