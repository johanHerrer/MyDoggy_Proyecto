import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.Usuario;
import modelo.UsuarioDAO;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import modelo.Evento;

@WebServlet(urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equalsIgnoreCase("registrar")) {
            String usuario = request.getParameter("usuario");
            String contraseña = request.getParameter("contraseña");
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn;
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydoggy", "root", "");
                String sql = "INSERT INTO usuarios(USUARIO, CONTRASENA) VALUES (?,?)";
                try (
                    PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, usuario);
                    ps.setString(2, contraseña);
                    ps.executeUpdate();
                    response.sendRedirect("bien.jsp");
                }
                conn.close();
            } catch (Exception e) {
               response.sendRedirect("fallo.jsp");
            }
        } else if (accion.equalsIgnoreCase("login")|accion.equalsIgnoreCase("agregarMascota")|accion.equalsIgnoreCase("eliminarCuenta")) {
            UsuarioDAO dao = new UsuarioDAO();
            String usuario = request.getParameter("usuarioL");
            String contraseña = request.getParameter("contraseñaL");
            Usuario usu = new Usuario(usuario, contraseña);
            if(accion.equalsIgnoreCase("login")){
                int r;
                r = dao.validar(usu);
                if (r == 1) {
                    HttpSession session = request.getSession();
                    session.setAttribute("usuario", usu.getUsuario());
                    response.sendRedirect("menu2.jsp");
                } else {
                    response.sendRedirect("mal.jsp");
                }
            }else if(accion.equalsIgnoreCase("agregarMascota")){
                HttpSession session = request.getSession();
                String dueno= (String) session.getAttribute("usuario"); 
                String nombreM = request.getParameter("nombre");
                String raza = request.getParameter("raza");
                int edad = 0;
                String edadStr = request.getParameter("edad");
                if (edadStr != null && !edadStr.isEmpty()) {
                    edad = Integer.parseInt(edadStr);
                }
                if (request.getParameter("edad") != null && !request.getParameter("edad").equals("")) {
                   edad = Integer.parseInt(request.getParameter("edad"));
                }
                int select = Integer.parseInt(request.getParameter("select"));
                String vacuna; 
                if (select==0) {
                   vacuna = "Vacunado";
                }else{
                    vacuna="Sin vacunar";
                }
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn;
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydoggy", "root", "");
                    String sql = "INSERT INTO perros (DUENO, NOMBREM, RAZA, EDAD, VACUNA) VALUES (?,?,?,?,?)";
                    try (
                        PreparedStatement ps = conn.prepareStatement(sql)) {
                        ps.setString(1, dueno);
                        ps.setString(2, nombreM);
                        ps.setString(3, raza);
                        ps.setInt(4, edad);
                        ps.setString(5, vacuna);
                        ps.executeUpdate();
                        response.sendRedirect("agregadoexitoso.jsp");
                    }
                    conn.close();

                } catch (Exception e) {
                    response.sendRedirect("fallo.jsp");
                }
            }else if(accion.equalsIgnoreCase("eliminarCuenta")){
                String usuario2=request.getParameter("usuario"); 
                String contraseña2=request.getParameter("password");
                int r= dao.eliminar(usuario2, contraseña2); 
                if (r == 2|r==1) {
                   response.sendRedirect("bien.jsp");
                } else {
                    response.sendRedirect("fallo.jsp");
                }
            }
        }else if(accion.equalsIgnoreCase("eliminarMascota")){
            UsuarioDAO dao=new UsuarioDAO(); 
            String nom=request.getParameter("delete");
            int r=dao.macotadelete(nom);
            if(r==1){
                response.sendRedirect("menu2.jsp");
            }else{
                response.sendRedirect("fallo.jsp");
            }
        }else if (accion.equalsIgnoreCase("visitarMascota")) {

            String perfil = request.getParameter("perfil"); 
            
            request.getSession().setAttribute("perfilito", perfil);
            try {

                Class.forName("com.mysql.jdbc.Driver");
                Connection conn;
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydoggy", "root", "");

                String sql = "SELECT * FROM perros WHERE NOMBREM = ?";

                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, perfil);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    response.sendRedirect("calendario.jsp");

                } else {
                    response.sendRedirect("fallo.jsp");
                }

                conn.close();

            } catch (Exception e) {
                e.printStackTrace();
            }                      
            
        } else if (accion.equalsIgnoreCase("agregarEvento")) {            
            HttpSession session = request.getSession();            
            String dueno = (String) session.getAttribute("usuario");
            String mascota = (String) session.getAttribute("perfilito");
        
            String aEvento = request.getParameter("aEvento");                        
            String fecha = request.getParameter("fecha");
            
          
      
            if (dueno == null || dueno.isEmpty()) {
                throw new IllegalArgumentException("El parámetro de solicitud 'dueno' es nulo o está vacío.");
            }            
            if (mascota == null || mascota.isEmpty()) {
                throw new IllegalArgumentException("El parámetro de solicitud 'mascota' es nulo o está vacío.");
            }
            if (aEvento == null || aEvento.isEmpty()) {
                throw new IllegalArgumentException("El parámetro de solicitud 'evento' es nulo o está vacío.");
            }if (fecha == null || fecha.isEmpty()) {
                throw new IllegalArgumentException("El parámetro de solicitud 'evento' es nulo o está vacío.");
            }
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn;
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydoggy", "root", "");
                String sql = "INSERT INTO calendario (DUENO, MASCOTA, EVENTO, FECHA) VALUES (?,?,?,?)";
                try (
                        PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, dueno);
                    ps.setString(2, mascota);
                    ps.setString(3, aEvento);
                    ps.setString(4, fecha);
                    ps.executeUpdate();
                    
                    request.getSession().setAttribute("dueno", dueno);
                    request.getSession().setAttribute("mascota", mascota);                 
                    request.getSession().setAttribute("fecha", fecha);          
                    response.sendRedirect("eventos.jsp");
                
                }
                conn.close();
          
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("fallo.jsp");
            }                        
          
    
            
        }else if(accion.equalsIgnoreCase("eliminarEvento")){
            
            String dato = request.getParameter("dato");            
            try{                
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydoggy", "root", "");
                PreparedStatement ps = conexion.prepareStatement("DELETE FROM calendario WHERE EVENTO=?");
                ps.setString(1,dato);            
                ps.execute();  
                ps.close();
                conexion.close();       
                response.sendRedirect("eventos.jsp");
            }catch(SQLException e){
                System.out.println(e.toString());               
            } 
        }
            
    }    
}
