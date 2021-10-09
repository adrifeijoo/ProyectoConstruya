<%-- 
    Document   : eliminar_materiales
    Created on : 8/10/2021, 08:15:03 PM
    Author     : Adriana Feijoo Almonacid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
       
        <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>
        
        <title>Eliminar materiales</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container-fluid" id="administra" ng-app="ProyectoConstruya" ng-controller="insumosController as cn">
            <img src="imagenes/1474491363_malecostume.png" class="figure-img img-fluid rounded" alt="" width="100px"/>
            <center><h1 style="color: green">Bienvenido Administrador</h1></center>
            <br>
            <br>
            <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #34ce57">
                <a class="navbar-brand" href="administrador.jsp">Ingresar material</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="modificar_mate.jsp">Modificar material <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="eliminar_materiales.jsp">Eliminar material</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Consultar Busquedas</a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
            </nav>
        </div>
        <br>
        <table class="table table-striped table-hover">
            <thead class="thead-light">
                <tr>
                    <th>Id material</th>
                    <th>Nombre material</th>
                    <th>Unidades</th>
                    <th>Rendimiento</th>
                    <th>Precio</th>
                </tr>
            </thead>
            <tr ng-repeat="insumos in cn.insumos">
                <td>{{insumos.id_insumo}}</td>
                <td>{{insumos.nombre_material}}</td>
                <td>{{insumos.unidad}}</td>
                <td>{{insumos.rendimiento}}</td>
                <td>{{insumos.precio}}</td>
            </tr>
        </table>
        <div class="container-fluid" ng-app="ProyectoConstruya" ng-controller="insumosController an cn">
            <div class="row">
                <div class="col-12">
                    <center><h3>Consultar</h3></center> 
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-8">
                    <label>Nombre del material</label>
                    <input class="form-control" type="text" ng-model="cn.nombre_material" required>
                </div>
                <div class="col-3">
                     <a href="" class="btn btn-success" >Consultar material</a>
                </div>
            </div>
            <br>
        <div class="row">
                <div class="col-12">
                    <center><h3>Eliminar</h3></center> 
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-8">
                    <label>Id material</label>
                    <input class="form-control" type="number" min="0" ng-model="cn.id_insumo" required>
                </div>
                <div class="col-3">
                     <a href="" class="btn btn-success" >Eliminar material</a>
                </div>
            </div>
        
    </div>
    </body>
</html>
