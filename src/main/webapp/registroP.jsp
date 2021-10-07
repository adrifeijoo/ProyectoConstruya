<%-- 
    Document   : registro
    Created on : 5/10/2021, 07:07:42 PM
    Author     : Adriana Feijoo Almonacid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
       
        <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script> 
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid" ng-app = "ProyectoConstruya" ng-controller = "usuariosController as cn">
            <div class="row">
                <div class="col-12">
                    <center><h1>Construya</h1></center> 
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <h3>Registro Usuarios</h3>
                    <div class="row">
                        <div class="col-6">
                            <label>Nombre</label>
                            <input class="form-control" type="text" ng-model="cn.nombre" required>
                        </div>
                        <div class="col-6">
                            <label>Cedula</label>
                            <input class="form-control" type="number" ng-model="cn.cedula" required>
                        </div>
                    </div>
                        <div class="row">
                        <div class="col-6">
                            <label>Telefono</label>
                            <input class="form-control" type="number" ng-model="cn.telefono" required>
                        </div>
                            <div class="col-6">
                            <label>Correo</label>
                            <input class="form-control" type="text" ng-model="cn.correo" required>
                        </div>
                    </div>
                        <div class="row">
                        <div class="col-6">
                            <label>Contraseña</label>
                            <input class="form-control" type="password" ng-model="cn.contrasena" required>
                        </div>
                        <div class="col-6">
                            <label>Cargo</label>
                            <select class="form-control" ng-model="cn.cargo" required>
                                <option>Administrador</option>
                                <option>Empleado</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <button  class="btn btn-success" ng-click="cn.guardarusuario()">Guardar</button>
                        </div>
                        <div class="col-3">
                            <button  class="btn btn-primary" ng-click="cn.listarusuario()">Listar usuarios</button>
                        </div>
                        <div class="col-3">
                            <button  class="btn btn-danger" ng-click="cn.borrarusuario()">Eliminar usuario</button>
                        </div>
                        <div class="col-3">
                            <button  class="btn btn-warning" ng-click="cn.actualizarusuario()">Actualizar usuario</button>
                        </div>
                    </div>
                    </div>
                </div>
            <div class="row" >
                <div class="col-12 table-responsive-xl">
                    <h3>Tabla de usuarios</h3>
                    <table class="table table-striped table-hover">  
                        <thead class="thead-dark">
                            <tr>  
                                <th>Id</th>  
                                <th>Nombre</th>  
                                <th>Cedula</th>  
                                <th>Telefono</th>  
                                <th>Correo</th>  
                                <th>Contraseña</th>  
                                <th>Cargo</th>  
                            </tr>  
                        </thead>

                        <tr ng-repeat = "usuario in cn.usuario">  
                            <td>{{ usuario.id}}</td>  
                            <td>{{ usuario.nombre}}</td>  
                            <td>{{ usuario.cedula}}</td>  
                            <td>{{ usuario.telefono}}</td>  
                            <td>{{ usuario.correo}}</td>  
                            <td>{{ usuario.contrasena}}</td>  
                            <td>{{ usuario.cargo}}</td>  
                        </tr>  
                    </table> 
                </div>
            </div>
            </div>          
    </body>
     <script>
        var app = angular.module('ProyectoConstruya', []);
        app.controller('usuariosController', ['$http', controladorusuario]);
        function controladorusuario($http) {
            var cn = this;
            cn.listarusuario = function () {
                var url = "Peticiones.jsp";
                var params = {
                    proceso: "listarusuario"
                };
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: params
                }).then(function (res) {
                    cn.usuario = res.data.usuario;
                });
            };
            cn.guardarusuario = function () {
                var usuario = {
                    proceso: "guardarusuario",
                    id: cn.id,
                    nombre: cn.nombre,
                    cedula: cn.cedula,
                    telefono: cn.telefono,
                    correo: cn.correo,
                    contrasena: cn.contrasena,
                    cargo: cn.cargo
                };
                console.log(usuario);
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: usuario
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[usuario.proceso] === true) {
                            alert("Guardado con éxito");
                           cn.listarusuario();
                        } else {
                            alert("No se guardo Por favor vefifique sus datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });

            };
            cn.borrarusuario = function () {
                var usuario = {
                    proceso: "borrarusuario",
                    id: cn.id
                };
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: usuario
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[usuario.proceso] === true) {
                            alert("Eliminado con éxito");
                            //                                cn.listarContactos();
                        } else {
                            alert("Por favor vefifique sus datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });

            };
            cn.actualizarusuario = function () {

                var usuario = {
                    proceso: "actualizarusuario",
                    id: cn.id,
                    nombre: cn.nombre,
                    cedula: cn.cedula,
                    telefono: cn.telefono,
                    correo: cn.correo,
                    contrasena: cn.contrasena,
                    cargo: cn.cargo
                };
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: usuario
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[usuario.proceso] === true) {
                            alert("actualizarusuario con éxito");
                            //                                cn.listarContactos();
                        } else {
                            alert("Por favor vefifique sus datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });

            };
           
        }
    </script>
</html>
