/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlado.empleado;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tienda.modelo.bean.Producto;
import tienda.modelo.bean.ProductoProximoExpirar;
import tienda.modelo.dao.ArticuloDAO;

/**
 *
 * @author Apo
 */
@WebServlet(name = "ProductosProximosExpirarServlet", urlPatterns = {"/ProductosProximosExpirarServlet"})
public class ProductosProximosExpirarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Producto> productosProximosExpirar = ArticuloDAO.obtenerProductosProximosExpirarConDetalle();
        request.setAttribute("productosProximosExpirar", productosProximosExpirar);


        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/principal.jsp");
        dispatcher.forward(request, response);
    }
}



