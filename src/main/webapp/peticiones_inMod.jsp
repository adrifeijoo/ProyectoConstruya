<%-- 
    Document   : peticiones_inMod
    Created on : 10/10/2021, 01:33:32 PM
    Author     : Adriana Feijoo Almonacid
--%>

<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="logica.Insumo"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>

<%    // Iniciando respuesta JSON.
    String respuesta = "{";

    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "actualizarinsumo",
        "eliminarinsumo",
        "listarinsumo",
        "guardarInsumo"
    });
    
    String proceso = "" + request.getParameter("proceso");

    // Validación de parámetros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        if (proceso.equals("guardarInsumo")) {
            //int id_insumo = Integer.parseInt(request.getParameter("id_insumo"));
            String nombre_material = request.getParameter("nombre_material");
            String unidad = request.getParameter("unidad");
            String rendimiento = request.getParameter("rendimiento");
            double precio = Double.parseDouble(request.getParameter("precio"));
            
            //boolean favorito = Boolean.parseBoolean(request.getParameter("favorito"));
            //su codigo acá
            Insumo c= new Insumo();
            //c.setId_insumo(id_insumo);
            c.setNombre_material(nombre_material); 
            c.setUnidad(unidad);
            c.setRendimiento(rendimiento);
            c.setPrecio(precio);
            
            if (c.guardarInsumo()){
                    respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminarinsumo")) {
            int id_insumo = Integer.parseInt(request.getParameter("id_insumo"));
            //su codigo acá
            Insumo c= new Insumo();
            if (c.borrarInsumo(id_insumo)) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listarinsumo")) {
            //su codigo acá
            Insumo c= new Insumo();
            try {
                List<Insumo> lista = c.listarInsumos();
                respuesta += "\"" + proceso + "\": true,\"Insumos\":" + new Gson().toJson(lista);
            } catch (SQLException ex) {
                respuesta += "\"" + proceso + "\": true,\"Insumos\":[]";
                Logger.getLogger(Insumo.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("actualizarinsumo")) {
            int id_insumo = Integer.parseInt(request.getParameter("id_insumo"));
            String nombre_material = request.getParameter("nombre_material");
            String unidad = request.getParameter("unidad");
            String rendimiento = request.getParameter("rendimiento");
            double precio = Double.parseDouble(request.getParameter("precio"));
            
          
            //su codigo acá
            Insumo c= new Insumo(); 
            c.setId_insumo(id_insumo);
            c.setNombre_material(nombre_material);
            c.setUnidad(unidad);
            c.setRendimiento(rendimiento);
            c.setPrecio(precio);
            
            if (c.actualizarInsumo()) {
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

