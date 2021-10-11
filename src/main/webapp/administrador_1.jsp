<%-- 
    Document   : administrador
    Created on : 6/10/2021, 08:31:14 PM
    Author     : Adriana Feijoo Almonacid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
       
        <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>
        <title>Modificar materiales</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <div class="container-fluid" id="administra">
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
                            <a class="nav-link" href="administrador_1.jsp">Modificar material <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="administrador_2.jsp">Eliminar material</a>
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
    <div class="container-fluid" ng-app="Construya" ng-controller="insumosController as cn">
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
            <tr ng-repeat="insumo in cn.insumos">
                <td>{{insumo.id_insumo}}</td>
                <td>{{insumo.nombre_material}}</td>
                <td>{{insumo.unidad}}</td>
                <td>{{insumo.rendimiento}}</td>
                <td>{{insumo.precio}}</td>
            </tr>
        </table>
        
        <div class="row">
                <div class="col-12">
                    <center><h3>Consultar</h3></center> 
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-12">
                     <!--<a href="" class="btn btn-success" >Consultar material</a>-->
                     <center><button class="btn btn-success" ng-click="cn.listarInsumos()">Consultar material</button></center>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-12">
                    <center><h3>Modificar</h3></center> 
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-8">
                    <label>Id material</label>
                    <input class="form-control" type="number" min="0" ng-model="cn.id_insumo" required>
                </div>
            </div>
        <br>
        <div class="row">
                <div class="col-8">
                    <label>Nombre del material</label>
                    <input class="form-control" type="text" ng-model="cn.nombre_material" required>
                </div>
            </div>
        <br>
        <div class="row">
                <div class="col-8">
                    <label>Unidad de medida</label>
                    <input class="form-control" type="text" ng-model="cn.unidad" required>
                </div>
                <div class="col-3">
                     <!--<a href="" class="btn btn-success" >Modificar material</a>-->
                     <button class="btn btn-success" ng-click="cn.actualizarInsumo()">Modificar material</button>
                </div>
            </div>
        <br>
        <div class="row">
                <div class="col-8">
                    <label>Rendimiento del material</label>
                    <input class="form-control" type="text" ng-model="cn.rendimiento" required>
                </div>
            </div>
        <br>
        <div class="row">
                <div class="col-8">
                    <label>Precio</label>
                    <input class="form-control" type="number" min="0" ng-model="cn.precio" required>
                </div>
            </div>
    </div>
    </body>
   <script>
        var app = angular.module('Construya', []);
        app.controller('insumosController', ['$http', controladorInsumos]);
        function controladorInsumos($http) {
            var cn = this;
            cn.listarInsumos = function () {
                var url = "peticiones_insumos.jsp";
                var params = {
                    proceso: "listarinsumo"
                };
                $http({
                    method: 'POST',
                    url: 'peticiones_insumos.jsp',
                    params: params
                }).then(function (res) {
                    cn.insumos = res.data.Insumos;
                });
            };
            cn.guardarInsumo = function () {
                var insumo = {
                    proceso: "guardarInsumo",
                    id_insumo: cn.id_insumo,
                    nombre_material: cn.nombre_material,
                    unidad: cn.unidad,
                    rendimiento: cn.rendimiento,
                    precio: cn.precio
                };
                console.log(insumo);
                $http({
                    method: 'POST',
                    url: 'peticiones_insumos.jsp',
                    params: insumo
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[insumo.proceso] === true) {
                            alert("Guardado con éxito");
                           cn.listarInsumos();
                        } else {
                            alert("No se guardo Por favor verifique sus datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });

            };
            cn.eliminarInsumo = function () {
                var insumo = {
                    proceso: "eliminarinsumo",
                    id_insumo: cn.id_insumo
                };
                $http({
                    method: 'POST',
                    url: 'peticiones_insumos.jsp',
                    params: insumo
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[insumo.proceso] === true) {
                            alert("Eliminado con éxito");
                            //                                cn.listarContactos();
                        } else {
                            alert("Por favor verifique sus datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });

            };
            cn.actualizarInsumo = function () {

                var insumo = {
                    proceso: "actualizarinsumo",
                    id_insumo: cn.id_insumo,
                    nombre_material: cn.nombre_material,
                    unidad: cn.unidad,
                    rendimiento: cn.rendimiento,
                    precio: cn.precio
                };
                $http({
                    method: 'POST',
                    url: 'peticiones_insumos.jsp',
                    params: insumo
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[insumo.proceso] === true) {
                            alert("actualizarinsumo con éxito");
                            //                                cn.listarContactos();
                        } else {
                            alert("Por favor verifique sus datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });

            };
           
        }
    </script>
</html>
