<%-- 
    Document   : index
    Created on : 5/10/2021, 07:06:59 PM
    Author     : Adriana Feijoo Almonacid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingreso de usuarios</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <div class="container well" id="containerLogeo">
            
            <center> 
                <h1 style="color: blue">Bienvenido</h1>
                <br>
                <img src="imagenes/1474491363_malecostume.png" class="figure-img img-fluid rounded" alt=""/>
            </center>
            <br>
            <h3>Datos de usuario</h3>
            <br>
            <form>
                <div class="form-group">
                    <label for="exampleInputEmail1">Correo</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                -->
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Contraseña</label>
                    <input type="password" class="form-control" id="exampleInputPassword1">
                </div>
                <!--<div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                </div>-->
                <br>
                <button type="submit" class="btn btn-info">Iniciar Seción</button>
                <!--<button onclick="window.location.href='/registro.jsp'" type="submit" class="btn btn-secondary">Registrarse</button>-->
                <a href="registro.jsp" class="btn btn-info" >Prueba</a>
            </form>
        </div> 
    </body>
</html>
