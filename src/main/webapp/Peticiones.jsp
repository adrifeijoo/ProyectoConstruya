<%-- 
    Document   : Peticiones
    Created on : 5/10/2021, 08:20:50 PM
    Author     : Adriana Feijoo Almonacid
--%>

<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="logica.usuario"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>

<%    // Iniciando respuesta JSON.
    String respuesta = "{";

    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "actualizarusuario",
        "borrarusuario",
        "listarusuario",
        "guardarusuario"
    });
    
    String proceso = "" + request.getParameter("proceso");

    // Validación de parámetros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        if (proceso.equals("guardarusuario")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            double cedula = Doble.parseDouble(request.getParameter("cedula"));
            double telefono = Doble.parseDouble(request.getParameter("telefono"));
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contrasena");
            String cargo = request.getParameter("cargo");
            
            
            //boolean favorito = Boolean.parseBoolean(request.getParameter("favorito"));
            //su codigo acá
            usuario c= new usuario();
            c.setId(id);
            c.setNombre(nombre)
            c.setCedula(cedula);
            c.setTelefono(telefono);
            c.setCorreo(correo);
            c.setContrasena(contrasena);
            c.setCargo(cargo);
            
            if (c.guardarusuario()){
                    respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("borrarusuario")) {
            int id = Integer.parseInt(request.getParameter("id"));
            //su codigo acá
            usuario c= new usuario();
            if (c.borrarusuario(id)) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listarusuario")) {
            //su codigo acá
            usuario c= new usuario();
            try {
                List<usuario> lista = c.listarusuario();
                respuesta += "\"" + proceso + "\": true,\"usuario\":" + new Gson().toJson(lista);
            } catch (SQLException ex) {
                respuesta += "\"" + proceso + "\": true,\"usuario\":[]";
                Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("actualizarusuario")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            double cedula = Doble.parseDouble(request.getParameter("cedula"));
            double telefono = Doble.parseDouble(request.getParameter("telefono"));
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contrasena");
            String cargo = request.getParameter("cargo");
            
          
            //su codigo acá
            usuario c= new usuario(); 
            c.setId(id);
            c.setNombre(nombre)
            c.setCedula(cedula);
            c.setTelefono(telefono);
            c.setCorreo(correo);
            c.setContrasena(contrasena);
            c.setCargo(cargo);
            
            if (c.actualizarusuario()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        }

        // ------------------------------------------------------------------------------------- //
        // -----------------------------------FIN PROCESOS-------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // Proceso desconocido.
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }
    // Usuario sin sesión.
    // Responder como objeto JSON codificación ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>
