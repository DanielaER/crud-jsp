/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uv.org.dswebpractica02.EMPLEADO;

/**
 *
 * @author Danielaa
 */

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uv.org.dswebpractica02.DB.DBConnection;

@WebServlet("/EmpleadoController")
public class EmpleadoController extends HttpServlet {
    private EmpleadoService empleadoService;

    @Override
    public void init() throws ServletException {
        DBConnection connectionManager = new DBConnection();
        EmpleadoRepository empleadoRepo = null;
        empleadoRepo = new EmpleadoDAO(connectionManager);

        this.empleadoService = new EmpleadoService(empleadoRepo);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "list":
                    List<Empleado> listaEmpleados = empleadoService.listarEmpleados();
                    System.out.println(listaEmpleados.get(0).getNombre());
                    request.setAttribute("listaEmpleados", listaEmpleados);
//                    request.getRequestDispatcher("lista.jsp").forward(request, response);                  
                    RequestDispatcher dispatcher = request.getRequestDispatcher("lista.jsp");
                    dispatcher.forward(request, response);
    
                    break;
                case "edit":
                    int id = Integer.parseInt(request.getParameter("id"));
                    Empleado empleado = empleadoService.obtenerEmpleadoPorId(id);
                    request.setAttribute("empleado", empleado);
                    request.getRequestDispatcher("empleado-form.jsp").forward(request, response);
                    break;
                
                case "delete":
                    System.out.println("Eliminar:");
                    System.out.println(request.getParameter("id"));
                    int deleteId = Integer.parseInt(request.getParameter("id"));
                    System.out.println("ID a eliminar: " + deleteId); // Verifica si el ID está llegando correctamente
                    empleadoService.eliminarEmpleado(deleteId);
                    response.sendRedirect("EmpleadoController?action=list");
                    break;

                default:
                    response.sendRedirect("EmpleadoController?action=list");
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al procesar la solicitud.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");

        Empleado empleado = new Empleado();
        empleado.setNombre(nombre);
        empleado.setDireccion(direccion);
        empleado.setTelefono(telefono);

        try {
            if (id == null || id.isEmpty()) {
                empleadoService.agregarEmpleado(empleado);
            } else {
                empleado.setId(Integer.parseInt(id));
                empleadoService.actualizarEmpleado(empleado);
            }
            response.sendRedirect("EmpleadoController?action=list");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al procesar la solicitud.");
        }
    }
}

