<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
    <title>Confirmar Eliminación</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
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

    <div class="container col-md-5">
        <div class="card border-danger">
            <div class="card-body">
                <h2 class="text-danger text-center">¿Estás seguro de que deseas eliminar este empleado?</h2>
                <hr>

                <div class="container text-center">
                    <p><strong>Nombre:</strong> <c:out value="${empleado.nombre}" /></p>
                    <p><strong>Dirección:</strong> <c:out value="${empleado.direccion}" /></p>
                    <p><strong>Teléfono:</strong> <c:out value="${empleado.telefono}" /></p>
                </div>

                  <form action="EmpleadoController" method="post">
                    <!-- Enviar el id del empleado para eliminar -->
                    <input type="hidden" name="action" value="delete" />
                    <input type="hidden" name="id" value="${empleado.id}" />

                    <div class="text-center">
                        <!-- Cambiado de <a> a <button> para el eliminar -->
                        <button type="submit" class="btn btn-danger">Eliminar</button>
                        <a href="<%=request.getContextPath()%>/EmpleadoController?action=list" class="btn btn-secondary">Cancelar</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>

</html>
