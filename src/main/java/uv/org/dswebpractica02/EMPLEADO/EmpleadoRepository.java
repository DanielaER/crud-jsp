/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package uv.org.dswebpractica02.EMPLEADO;

/**
 *
 * @author Danielaa
 */

import java.util.List;

public interface EmpleadoRepository {
    List<Empleado> getAllEmpleados();
    void addEmpleado(Empleado empleado);
    void updateEmpleado(Empleado empleado);
    void deleteEmpleado(int id);
    Empleado getEmpleadoById(int id);
}

