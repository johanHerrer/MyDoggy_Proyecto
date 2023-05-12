<%-- 
    Document   : eventos
    Created on : 8/05/2023, 8:22:30 p. m.
    Author     : sebas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="modelo.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
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
    <table class="Tabla" align="center">
        <thead>                   
                   <th>Evento</th>
                   <th>Fecha</th>
                   <th>Dias Restantes</th> 
                   <th></th>
                </thead>
                <tbody>                    
                    <% 
                          Connection con = null;
                          Statement stmt = null;
                          ResultSet rs = null;
                       
                          
                          try {
                           String duenoR = (String)session.getAttribute("dueno");
                             String mascotaR = (String)session.getAttribute("mascota");
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydoggy", "root", "");
                            stmt = con.createStatement();
                            rs = stmt.executeQuery("SELECT * FROM calendario   WHERE DUENO='" + duenoR + "'AND MASCOTA='" + mascotaR + "'");
                        
                         
                            while (rs.next()) {
                        %>
                        <tr>                            
                            <td><%=rs.getString("EVENTO")%></td>
                            <td><%=rs.getString("FECHA")%></td>
                            <% 
                        String fecha = rs.getString("FECHA");
                        String evento=rs.getString("EVENTO");
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); 
                        LocalDate fechaL = LocalDate.parse(fecha, formatter);
                         
                        Evento eventoOf=new Evento(evento,fechaL);
                        long diasR=eventoOf.diasRestantes();
                         %>
                          <td><%= diasR %></td>
                            <td>
                                <form action="Controlador" method="post">
                                    <input type="hidden" name="accion" value="eliminarEvento">
                                    <input type="hidden" name="dato" value="<%=rs.getString("EVENTO")%>">
                                    <button type="submit" id="Eliminar" name="Eliminar" class="button">Eliminar</button>                
                                </form>
                            </td>
                        </tr>
                        <% 
                            
                            }
                            rs.close();
                            stmt.close();
                            con.close();
                          } catch (Exception e) {
                            out.println("Error: " + e.getMessage());
                          }
                        %>
                </tbody>
    </table>
                <br>
                <br>
                <section class="contenedor">
                    <a class="link" href="calendario.jsp">Agregar Evento</a> 
                    <br>
                    <br>
                    <a class="link" href="menu2.jsp">Ir a menú</a>
                </section>             
    </body>
</html>