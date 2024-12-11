/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlado.usuario;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tienda.modelo.bean.Empleado;
import tienda.modelo.bean.Usuario;
import tienda.modelo.dao.EmpleadoDAO;
import static tienda.modelo.dao.EmpleadoDAO.buscarEmpleadoID;
import tienda.modelo.dao.UsuarioDAO;

/**
 *
 * @author BLANCO
 */
@WebServlet(name = "ServletUsuario", urlPatterns = {"/ServletUsuario", "/login", "/cerrarsesion"})
public class ServletUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            String path = request.getServletPath();

            if (path.equals("/login")) {
                //capturar datos del usuario
                String us = request.getParameter("us");
                String ps = request.getParameter("ps");
                //validar usuario 
                Usuario usuario = UsuarioDAO.valirarUsuario(us, ps);
                //si el usuario existe en la base de datos
                //Empleado emp = buscarEmpleadoID(usuario.getIdemp());
                
                if(usuario!=null){
                    
                    //request.setAttribute("emp", emp);
                    request.setAttribute("usuario", usuario);
                    request.getSession().setAttribute("empleado", EmpleadoDAO.buscarEmpleadoID(usuario.getIdemp()));
                    request.getRequestDispatcher("WEB-INF/principal.jsp").forward(request, response);
                }else {
                request.setAttribute("msg", "Usuario y/o password incorrecto...");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }            
            }
            if (path.equals("/cerrarsesion")) {
                //cerrar variable de sesion
                request.getSession().invalidate();
                request.getRequestDispatcher("login.jsp").forward(request, response);
                
            }
        }
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
