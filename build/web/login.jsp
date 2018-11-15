<%-- 
    Document   : login
    Created on : 14/11/2018, 16:55:46
    Author     : Gaston
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <form method="post" name="login">
            <div>
                <label>Usuario:</label>
                <input type="text" name="usuario" />
            </div>
            <div>
                <label>Contraseña:</label>
                <input type="text" name="contrasenia" />
            </div>
            <div>
                <input type="submit" value="Ingresar" />
            </div>
        </form>
    </body>
</html>
