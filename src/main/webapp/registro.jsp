<%-- 
    Document   : registro
    Created on : 6/10/2021, 05:41:07 PM
    Author     : Adriana Feijoo Almonacid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
       
        <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>
        <title>Registrarse</title>
    </head>
    <body>
        <div class="container-fluid" ng-app="ProyectoConstruya" ng-controller="usuarioController as cn">
            <div class="row">
                <div class="col-12">
                    <center><h1>Registrate en Construya</h1></center>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-8">
                    <label>Nombre completo</label>
                    <input class="form-control" type="text" ng-model="cn.nombre" required>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-8">
                    <label>Cedula</label>
                    <input class="form-control" type="number" min="0" ng-model="cn.cedula" required>
                </div>
            </div>
            <br>
             <div class="row">
                <div class="col-8">
                    <label>Telefono</label>
                    <input class="form-control" type="number" min="0" ng-model="cn.telefono" required>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-8">
                    <label>Correo</label>
                    <input class="form-control" type="text" ng-model="cn.correo" required>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-8">
                    <label>Contrase??a</label>
                    <input class="form-control" type="text" ng-model="cn.contrasena" required>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-8">
                    <label>Cargo</label>
                    <select class="form-control" ng-model="cn.genero" required>
                        <option>Administrador</option>
                        <option>Empleado</option>
                    </select>
                </div>
            </div>
            <br>
            <br>
            <div class="row">
                <div class="col-3">
                    <button class="btn btn-info" ng-click="cn.guardarusuario()">Registrarse</button>
                </div>
                <div class="col-3">
                     <a href="index.jsp" class="btn btn-info" >Volver</a>
                </div>
            </div>
            <br>
            <br>
        </div>
    </body>
    <script>
        var app=angular.module('ProyrctoConstruya',[]);
        app.controller('usuarioController',['$http',controladorUsuario]);
        function controladorUsuario($http){
            var cn = this;
            cn.listarusuario = function () {
                var url = "peticion_usuario.jsp";
                var params = {
                    proceso: "listarusuario"
                };
                $http({
                    method: 'POST',
                    url: 'peticion_usuario.jsp',
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
                    url: 'peticion_usuario.jsp',
                    params: usuario
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[usuario.proceso] === true) {
                            alert("Guardado con ??xito");
                           cn.listarContactos();
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
                    url: 'peticiones_usuario.jsp',
                    params: usuario
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[usuario.proceso] === true) {
                            alert("Eliminado con ??xito");
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
                    url: 'peticion_usuario.jsp',
                    params: usuario
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[usuario.proceso] === true) {
                            alert("actualizarusuario con ??xito");
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
