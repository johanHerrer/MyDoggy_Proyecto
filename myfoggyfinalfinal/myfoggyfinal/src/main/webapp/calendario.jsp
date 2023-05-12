<%-- 
    Document   : calendario
    Created on : 8/05/2023, 8:21:39 a. m.
    Author     : sebas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendario de eventos</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" >
<link href="estilos.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <h1>Calendario de eventos</h1>
    <form action="Controlador" method="post" class="formulario">
        <div  class="contenedor">            
                <input type="hidden" name="accion" value="agregarEvento" >                                
                <input type="text" id="aEvento" name="aEvento" placeholder="Ingrese el nombre del Evento">
                <br><br>
                <label for="fecha">Fecha del evento:</label>
                <input type="date" id="fecha" name="fecha">
                <br>
                <br>
            <input type="submit" value="Agregar evento" class="button">            
        </div>
    </form>
</body>
</html>