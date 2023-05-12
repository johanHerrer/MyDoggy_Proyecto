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
        <section class="formulario">
            <h1>MENU DE OPCIONES</h1>
            <div class="contenedor">
                    <select id="opcion" onchange="opciones()" class="select">
                        <option disabled selected>Selecciona una opción</option>
                        <option value="pet">Agregar Mascota</option>
                        <option value="delete" >Eliminar Mascota</option>
                        <option value="visit" >Agregar Evento</option>
                        <option value="close">Otros</option>
                   </select>
            
        <section id="pets" class="centrada" style="display:none;">
            <h1 class="tit">Agregar Mascota</h1>
            <form action="Controlador" method="POST" >
                <input type="hidden" name="accion" value="agregarMascota">
                <div class="input-contenedor">
                    <i class="fas fa-paw icon" ></i>
                    <input type="text" placeholder="Escribe el nombre" name="nombre">
                </div>
                <div class="input-contenedor">
                    <i class="fas fa-smile-beam icon"> </i>
                    <input type="text" placeholder="Escribe la raza" name="raza">
                </div>
                <div class="input-contenedor">
                    <i class="fas fa-star icon"></i>
                    <input class="number" type="number" placeholder="Escribe la edad" name="edad">
                </div><br>
                <select name="select"  class="select">
                    <option disabled selected>¿Con o sin vacunas?</option>
                    <option value="0">Vacunadito</option>
                    <option value="1" selected>Sin vacunas</option>
                </select> <br><br>
                <button class="button" type="submit">
                    <a>Añadir Mascota</a>
                </button><br><br>
            </form>
        </section>
        <section id="deletes" class="centrada" style="display:none;">
            <h1 class="tit">Eliminar Mascota</h1>
            <form action="Controlador" method="POST" >
                <input type="hidden" name="accion" value="eliminarMascota">
                <div class="input-contenedor">
                    <i class="fas fa-trash icon"></i>
                    <input name="delete" type="text" placeholder="Mascota para ser eliminada">
                </div><br>
                <button class="button" type="submit">
                    <a>Eliminar</a>
                </button><br><br>        
            </form>
        </section>       
        <section id="visits" class="centrada" style="display:none;">
            <h1 class="tit">Agregar Evento</h1>
            <form action="Controlador" method="POST" >
                <input type="hidden" name="accion" value="visitarMascota">
                <div class="input-contenedor">
                    <i class="fas fa-search icon"></i>
                    <input type="text" name="perfil" placeholder="Nombre de tu mascota"> 
                </div>
                <button class="button" type="submit">
                    <a>Ir a agregar Evento</a>
                </button>
                    <br> 
                <br>        
            </form>
        </section>       
        <section id="closes" class="centrada" style="display:none;">
            <h1 class="tit">Otros</h1>
                <div class="ce">
                    <select id="opc" onchange="op()" class="select">
                        <option disabled selected>Selecciona una opción</option>
                        <option value="cuenta" >Eliminar Cuenta</option>
                        <option value="sesion" >Cerrar Sesión</option>
                    </select>
                </div>
                <section id="cuentas" class="centrada" style="display:none;">
                    <h2>Eliminar Cuenta</h2>
                    <form action="Controlador" method="POST">
                        <input type="hidden" name="accion" value="eliminarCuenta">
                        <div class="input-contenedor">
                            <i class="fas fa-user icon"></i>
                            <input type="text" placeholder="Usuario de la cuenta" name="usuario"> 
                        </div>
                        <div class="input-contenedor">
                            <i class="fas fa-key icon"></i>
                            <input type="text" placeholder="Ingresar Contraseña" name="password">
                        </div>
                        <button class="button" type="submit">
                            <a>Confirmar y eliminar</a>
                        </button><br><br>
                    </form>
                </section>
                <section id="sesions" class="centrada" style="display:none;">
                    <h2>Cerrar Sesión</h2>
                        <form action="" method="POST">
                            <h4 class="h">Recuerda no olvidarte de tus citas. <b>Mantente en contacto.</b></h4> 
                            <button class="button" type="submit">
                                <a href="index.jsp" class="link2">Cerrar</a>                
                            </button><br></br>
                        </form>
                </section>         
        </section>                 
        <script>
		function opciones() {
			var opcion = document.getElementById("opcion").value;
			if (opcion == "pet") {
				document.getElementById("pets").style.display = "block";
                                document.getElementById("deletes").style.display = "none";
                                document.getElementById("visits").style.display = "none";
				document.getElementById("closes").style.display = "none";
			}else if(opcion == "delete"){
                                document.getElementById("pets").style.display = "none";
                                document.getElementById("deletes").style.display = "block";
                                document.getElementById("visits").style.display = "none";
				document.getElementById("closes").style.display = "none";
                        }else if(opcion == "visit"){
                                document.getElementById("pets").style.display = "none";
                                document.getElementById("deletes").style.display = "none";
                                document.getElementById("visits").style.display = "block";
				document.getElementById("closes").style.display = "none";
                        }else if (opcion == "close") {
				document.getElementById("pets").style.display = "none";
                                document.getElementById("deletes").style.display = "none";
                                document.getElementById("visits").style.display = "none";
				document.getElementById("closes").style.display = "block";
			}else{
                                document.getElementById("pets").style.display = "none";
                                document.getElementById("deletes").style.display = "none";
                                document.getElementById("visits").style.display = "none";
				document.getElementById("closes").style.display = "none";
                        }
		}
                function op() {
			var opc = document.getElementById("opc").value;
			if (opc == "cuenta") {
                            document.getElementById("cuentas").style.display = "block"; 
                            document.getElementById("sesions").style.display = "none";
                        }else if(opc == "sesion"){
                            document.getElementById("cuentas").style.display = "none"; 
                            document.getElementById("sesions").style.display = "block";
                        }else{
                            document.getElementById("cuentas").style.display = "none"; 
                            document.getElementById("sesions").style.display = "none";
                        }
                }
	    </script>
            </div>
        </section>       
    </body> 
</html>