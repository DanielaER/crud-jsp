

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <html>

        <head>
            <title>Empleados</title>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        </head>

        <body>

            <header>
                <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
                   

                   <ul class="navbar-nav">
                        <li><a href="<%=request.getContextPath()%>/EmpleadoController?action=list" class="nav-link">Empleados</a></li>
                    </ul>
                </nav>
            </header>
            <br>

            <div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center">Lista de empleados</h3>
                    <hr>
                    <div class="container text-left">

                        <a href="empleado-form.jsp" class="btn btn-success">Agregar Empleado</a>
                    </div>
                    <br>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Dirección</th>
                                <th>Teléfono</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--   for (Todo todo: todos) {  -->
                            <c:forEach var="empleado" items="${listaEmpleados}">

                                <tr>
                                    <td>${empleado.id}</td>
                                <td>${empleado.nombre}</td>
                                <td>${empleado.direccion}</td>
                                <td>${empleado.telefono}</td>
                                <td>
                                    <a href="EmpleadoController?action=edit&id=${empleado.id}">Editar</a>
                                    <a href="EmpleadoController?action=delete&id=${empleado.id}">Eliminar</a>
                                </td>
                                </tr>
                            </c:forEach>
                            <!-- } -->
                        </tbody>

                    </table>
                </div>
            </div>
        </body>

        </html>

