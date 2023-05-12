<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title></title> 
        <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" >
        <link href="estilos.css" rel="stylesheet" type="text/css"/>
    </head>  
    <body>
        <form class="formulario" action="Controlador" method="post">
            <h1>Login</h1>
            <input type="hidden" name="accion" value="login">
            <div class="contenedor">
                <div class="input-contenedor">
                    <i class="fas fa-envelope icon"></i>
                    <input type="text" placeholder="Usuario" name="usuarioL">
                </div>

                <div class="input-contenedor">
                    <i class="fas fa-key icon"></i>
                    <input type="password" placeholder="Contraseña" name="contraseñaL">        
                </div>
        </form>
        <input type="submit" value="Login" class="button">
           <p>¿No tienes una cuenta? <a class="link" href="registrarVista.jsp">Registrate </a></p>
        </div>
    </body>
</html>