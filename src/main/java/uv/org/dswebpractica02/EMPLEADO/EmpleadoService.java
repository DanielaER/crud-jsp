/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uv.org.dswebpractica02.EMPLEADO;

/**
 *
 * @author Danielaa
 */

import java.util.List;

public class EmpleadoService {

    private final EmpleadoRepository empleadoRepository;

    public EmpleadoService(EmpleadoRepository empleadoRepository) {
        this.empleadoRepository = empleadoRepository;
    }

    public List<Empleado> listarEmpleados() {
        return empleadoRepository.getAllEmpleados();
    }

    public void agregarEmpleado(Empleado empleado) {
        empleadoRepository.addEmpleado(empleado);
    }

    public void actualizarEmpleado(Empleado empleado) {
        empleadoRepository.updateEmpleado(empleado);
    }

    public void eliminarEmpleado(int id) {
        empleadoRepository.deleteEmpleado(id);
    }

    public Empleado obtenerEmpleadoPorId(int id) {
        return empleadoRepository.getEmpleadoById(id);
    }
}

