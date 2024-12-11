/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlado.empleado;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tienda.modelo.bean.Cliente;
import tienda.modelo.dao.ArticuloDAO;
import tienda.modelo.dao.ClienteDAO;

/**
 *
 * @author Apo
 */
@WebServlet(name = "GenerarBoletaServlet", urlPatterns = {"/GenerarBoletaServlet"})
public class GenerarBoletaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String nombreProducto = request.getParameter("nombreProducto");
        String descripcion = request.getParameter("descripcion");
        double precio = Double.parseDouble(request.getParameter("precio"));
        String foto = request.getParameter("foto");
        String fechaVencimiento = request.getParameter("fechaVencimiento");
        String idCategoria = request.getParameter("idCategoria");
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        int idProducto = Integer.parseInt(request.getParameter("idProducto"));
        
         ArticuloDAO.eliminar(idProducto);

        // Información del Cliente
        String nombreCliente = request.getParameter("nombreCliente");
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        String apellidoPaterno = request.getParameter("apellidoPaterno");
        String apellidoMaterno = request.getParameter("apellidoMaterno");
        String dniCliente = request.getParameter("dniCliente");
        String celularCliente = request.getParameter("celularCliente");
        
        Cliente cliente = new Cliente(idCliente, nombreCliente, apellidoPaterno, apellidoMaterno, dniCliente, celularCliente);
        ClienteDAO.insertar(cliente);
        // Aquí puedes realizar las acciones necesarias, como generar la boleta, almacenar en la base de datos, etc.

        // Puedes almacenar los datos en el objeto request para mostrarlos en la página de boleta
        request.setAttribute("nombreProducto", nombreProducto);
        request.setAttribute("descripcion", descripcion);
        request.setAttribute("precio", precio);
        request.setAttribute("foto", foto);
        request.setAttribute("fechaVencimiento", fechaVencimiento);
        request.setAttribute("idCategoria", idCategoria);
        request.setAttribute("cantidad", cantidad);
        request.setAttribute("idProducto", idProducto);

        // Información del Cliente
        request.setAttribute("nombreCliente", nombreCliente);
        request.setAttribute("idCliente", idCliente);
        request.setAttribute("apellidoPaterno", apellidoPaterno);
        request.setAttribute("apellidoMaterno", apellidoMaterno);
        request.setAttribute("dniCliente", dniCliente);
        request.setAttribute("celularCliente", celularCliente);

        // Redirigir a la página de boleta
        request.getRequestDispatcher("/WEB-INF/boletaVenta.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
