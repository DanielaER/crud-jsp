


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
            <div class="container col-md-5">
                <div class="card">
                    <div class="card-body">
                        <c:if test="${user != null}">
                            <form action="EmpleadoController" method="post">
                        </c:if>
                        <c:if test="${user == null}">
                            <form action="EmpleadoController" method="post">
                        </c:if>

                        <caption>
                            <h2>
                                <c:if test="${empleado != null}">
                                    Editar Empleado
                                </c:if>
                                <c:if test="${empleado == null}">
                                    Añadir empleado
                                </c:if>
                            </h2>
                        </caption>

                        <c:if test="${empleado != null}">
                            <input type="hidden" name="id" value="<c:out value='${empleado.id}' />" />
                        </c:if>

                        <fieldset class="form-group">
                            <label>Nombre</label> <input type="text" value="<c:out value='${empleado.nombre}' />" class="form-control" name="nombre" required="required">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Dirección</label> <input type="text" value="<c:out value='${empleado.direccion}' />" class="form-control" name="direccion">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Telefono</label> <input type="text" value="<c:out value='${empleado.telefono}' />" class="form-control" name="telefono">
                        </fieldset>

                        <button type="submit" class="btn btn-success">Guardar</button>
                        </form>
                    </div>
                </div>
            </div>
        </body>

        </html>
