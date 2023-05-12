<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>REGISTRO</title>

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

        <title>Mascotas</title>
        <link rel="stylesheet" href="estilos.css">
    </head>  
    <body>

        <form class="formulario" action="Controlador" method="post">
            <input type="hidden" name="accion" value="registrar">
            <h1>Registrate</h1>
            <div class="contenedor">

                <div class="input-contenedor">
                    <i class="fas fa-user icon"></i>
                    <input type="text" placeholder="Usuario" name="usuario">

                </div>

                <div class="input-contenedor">
                    <i class="fas fa-key icon"></i>
                    <input type="password" placeholder="Contraseña" name="contraseña">
                </div>
                <h6><i>Nota : <h7>La contraseña es de 5 caracteres</i></h7>
                <input type="submit" value="Registrate" class="button">
                <p>¿Ya tienes una cuenta?<a class="link" href="index.jsp">Iniciar Sesion</a></p>
            </div>
        </form>
    </body>
</html>