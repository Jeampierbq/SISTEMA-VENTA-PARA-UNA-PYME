/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlado.empleado;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import tienda.modelo.bean.Articulos;
import tienda.modelo.bean.Cliente;
import tienda.modelo.bean.Pedido;
import tienda.modelo.bean.Producto;
import tienda.modelo.dao.ArticuloDAO;
import tienda.modelo.dao.ClienteDAO;
import tienda.modelo.dao.EmpleadoDAO;
import tienda.modelo.dao.PaisDAO;
import tienda.modelo.dao.PedidoDAO;
import tienda.modelo.dao.PedidosDAO;

/**
 *
 * @author Dell
 */
@MultipartConfig
@WebServlet(name = "ServletEmpleado", urlPatterns = {"/ServletEmpleado","/listarFecha","/home","/GenerarBoleta","/editarArt1", "/insertarArt" ,"/Venta","/listarEmp","/listarArt","/nuevoArt", "/grabarArt", "/eliminarArt", "/editarPro","/editarArt","/listarPedido","/listarPedidos","/Consulta1","/Consulta3"
,"/Consulta4","/Consulta5","/Consulta6","/Consulta7","/Consulta8","/Consulta9","/Consulta10","/Consulta11","/Consulta12"})
public class ServletEmpleado extends HttpServlet {

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
            String path= request.getServletPath();
            ArrayList<Producto> producto = ArticuloDAO.listar();
            if (path.equals("/listarEmp")) {
                //traer la lista de empleados
                request.setAttribute("empleado",EmpleadoDAO.listar());                
                request.getRequestDispatcher("WEB-INF/empleados.jsp").forward(request, response);    
            }
            if(path.equals("/listarArt")){
                request.setAttribute("producto",ArticuloDAO.listar());
                request.getRequestDispatcher("WEB-INF/articulos.jsp").forward(request, response);    
            }
            if (path.equals("/nuevoArt")) {
                //enviar un objeto vacio al formulario
                request.setAttribute("producto", new Producto());
                //redireccionar
                request.getRequestDispatcher("/WEB-INF/formArticulo.jsp").forward(request, response);
            }
            if (path.equals("/Venta")) {
                request.getRequestDispatcher("/WEB-INF/Venta.jsp").forward(request, response);
            }
            
            if(path.equals("/home")){
                request.getRequestDispatcher("WEB-INF/principal.jsp").forward(request, response);    
            }
            
            if (path.equals("/GenerarBoleta")) {
                try {
                    // Obtener datos de la venta del formulario
                    String nombreProducto = request.getParameter("nombreProducto");
                    String descripcionProducto = request.getParameter("descripcion");
                    double precioProducto = Double.parseDouble(request.getParameter("precio"));
                    String fotoProducto = request.getParameter("foto");
                    String fechaVencimientoProducto = request.getParameter("fechaVencimiento");
                    int idCategoriaProducto = Integer.parseInt(request.getParameter("idCategoria"));
                    int cantidadProducto = Integer.parseInt(request.getParameter("cantidad"));
                    int idProducto = Integer.parseInt(request.getParameter("idProducto"));

                    // Obtener datos del cliente del formulario
                    String nombreCliente = request.getParameter("nombreCliente");
                    String apellidoPaternoCliente = request.getParameter("apellidoPaterno");
                    String apellidoMaternoCliente = request.getParameter("apellidoMaterno");
                    String dniCliente = request.getParameter("dniCliente");
                    String celularCliente = request.getParameter("celularCliente");
                    int idCliente = Integer.parseInt(request.getParameter("idCliente"));

                    // Encapsular datos en los objetos Producto y Cliente
                    Producto productoVenta = new Producto(idProducto, nombreProducto, descripcionProducto, precioProducto, fotoProducto, fechaVencimientoProducto, idCategoriaProducto);
                    Cliente clienteVenta = new Cliente(idCliente, nombreCliente, apellidoPaternoCliente, apellidoMaternoCliente, dniCliente, celularCliente);

                    // Guardar objetos en la solicitud para que estén disponibles en la página JSP
                    request.setAttribute("producto", productoVenta);
                    request.setAttribute("cliente", clienteVenta);

                    // Redirigir a la página de boleta o a donde lo necesites
                    request.getRequestDispatcher("/WEB-INF/boletaVenta.jsp").forward(request, response);
                } catch (NumberFormatException | ServletException | IOException e) {
                    e.printStackTrace(); // Manejo de errores, puedes personalizar esto según tu lógica
                }
            }
            
            if (path.equals("/insertarArt")) {
    try {
        // Capturar datos del formulario
        String nom = request.getParameter("nom");
        String des = request.getParameter("des");
        double pre = Double.parseDouble(request.getParameter("pre"));
        String fot = request.getParameter("fot");
        int idcat = Integer.parseInt(request.getParameter("idcat"));
        int id = Integer.parseInt(request.getParameter("cod"));
        String fechaVen = request.getParameter("ven");

        // Obtener la cantidad del formulario
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));

        // Encapsular datos en el objeto Producto
        Producto art = new Producto(id, nom, des, pre, fot, fechaVen, idcat);

        // Llamar al método insertar del DAO con la cantidad
        ArticuloDAO.insertar(art, cantidad);

        // Aquí podrías establecer un atributo en la solicitud para mostrar un mensaje de éxito
        request.setAttribute("mensaje", "Articulo añadido correctamente");

        // Redirigir a la página listarArt
        response.sendRedirect("listarArt");
    } catch (NumberFormatException | IOException e) {
        e.printStackTrace(); // Manejo de errores, puedes personalizar esto según tu lógica
    }
}
            if (path.equals("/eliminarArt")) {
                //capturar valor de id qu viene por la URL
                int id = Integer.parseInt(request.getParameter("id"));
                //Eliminar de la base de datos
                ArticuloDAO.eliminar(id);
                //redireccionar a empleados.jsp
                response.sendRedirect("listarArt");
            }
            if (path.equals("/editarArt")) {
                
                int id=Integer.parseInt(request.getParameter("idproducto"));
                request.setAttribute("producto", ArticuloDAO.buscarArticuloID(id));
                //redireccionar formulario
                request.getRequestDispatcher("/WEB-INF/formEditarArt.jsp").forward(request, response);
            }
            
            if (path.equals("/editarArt1")) {
                
                int id=Integer.parseInt(request.getParameter("idproducto"));
                request.setAttribute("producto", ArticuloDAO.buscarArticuloID(id));
                //redireccionar formulario
                request.getRequestDispatcher("/WEB-INF/Venta2.jsp").forward(request, response);
            }
            
            if (path.equals("/listarPedido")) {
            listarPedidos(request, response);
        }
            if(path.equals("/Consulta8")){
                listarCatg(request, response);
            }
            if(path.equals("/Consulta3")){
                listarPedF(request, response);
            }
            if(path.equals("/Consulta4")){
                listarArtE(request, response);
            }
            if(path.equals("/Consulta5")){
                ArtMayor(request, response);
            }
            if(path.equals("/Consulta6")){
                ArtNom(request, response);
            }
            if(path.equals("/Consulta7")){
                PaisCliente(request, response);
            }
            if (path.equals("/Consulta1")) {
    ArrayList<Map<String, Object>> pedidos = PedidosDAO.obtenerTodosLosPedidosConCliente();
    request.setAttribute("pedidos", pedidos);
    request.getRequestDispatcher("WEB-INF/Consulta1.jsp").forward(request, response);
}
            if(path.equals("/Consulta9")){
                ArtNoPedidos(request, response);
            }
            if(path.equals("/Consulta10")){
                ClienteSinPedido(request, response);
            }
            if(path.equals("/Consulta11")){
                ArtPedidos(request, response);
            }
            if(path.equals("/Consulta12")){
                NUMArtNoPedidos(request, response);
            }
            if (path.equals("/listarFecha")) {
     ArrayList<Producto> productos = ArticuloDAO.listarfecha();

    // Tomar solo los primeros tres elementos
    ArrayList<Producto> primerosTresProductos = new ArrayList<>(productos.subList(0, Math.min(3, productos.size())));

    // Configurar la lista en el atributo de solicitud
    request.setAttribute("producto", primerosTresProductos);

    // Redireccionar al JSP
    request.getRequestDispatcher("/WEB-INF/principal_1.jsp").forward(request, response);
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
    
    
    private void listarCatg(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String nEmp = request.getParameter("categorias");
        ArrayList<Producto> producto = ArticuloDAO.obtenerArticulos(nEmp);
        request.setAttribute("producto",producto);
        request.getRequestDispatcher("WEB-INF/Consulta8.jsp").forward(request, response);        
    }
    
    
    private void listarPedidos(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        // Llama al método del DAO para obtener la lista de pedidos
        List<Pedido> pedidos = PedidoDAO.listarPedidos();

        // Agrega la lista como un atributo al request
        request.setAttribute("listaPedidos", pedidos);

        // Redirige a la página donde mostrarás la lista de pedidos
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Pedidos.jsp");
        dispatcher.forward(request, response);
    } catch (Exception e) {
        e.printStackTrace(); // Manejo de errores, puedes personalizar esto según tu lógica
        response.sendRedirect("error.jsp"); // Redirige a una página de error
    }
}
    private void listarPedF(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String fechai = request.getParameter("fechai");
        String fechaf = request.getParameter("fechaf");
        request.setAttribute("pedidos",PedidosDAO.obtenerPedidosF(fechai, fechaf));
        request.getRequestDispatcher("WEB-INF/Consulta3.jsp").forward(request, response);        
    }
    
    private void listarArtE(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String nEmp = request.getParameter("Nomempleado");
        request.setAttribute("articulos",ArticuloDAO.obtenerArticulosE(nEmp));
        request.getRequestDispatcher("WEB-INF/Consulta4.jsp").forward(request, response);        
    }
    
    private void ArtMayor(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("articulos",ArticuloDAO.ArticuloMayor());
        request.getRequestDispatcher("WEB-INF/Consulta5.jsp").forward(request, response);        
    }
    
    private void ArtNom(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String Nom = request.getParameter("NomArt");
        request.setAttribute("articulos",ArticuloDAO.obtenerArticulosN(Nom));
        request.getRequestDispatcher("WEB-INF/Consulta6.jsp").forward(request, response);        
    }
    
    private void ArtNoPedidos(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("articulos",ArticuloDAO.listarArticulosNoPed());
        request.getRequestDispatcher("WEB-INF/Consulta9.jsp").forward(request, response);        
    }
    private void NUMArtNoPedidos(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("articulos",ArticuloDAO.listarArticulosNoPed());
        request.getRequestDispatcher("WEB-INF/Consulta12.jsp").forward(request, response);        
    }
    
    private void PaisCliente(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("pais",PaisDAO.listarNoCliente());
        request.getRequestDispatcher("WEB-INF/Consulta7.jsp").forward(request, response);        
    }
    
    private void ArtPedidos(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("articulos",ArticuloDAO.listarArticulosPed());
        request.getRequestDispatcher("WEB-INF/Consulta11.jsp").forward(request, response);        
    }
    
    private void ClienteSinPedido(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("clientes",ClienteDAO.listarClienteSinP());
        request.getRequestDispatcher("WEB-INF/Consulta10.jsp").forward(request, response);        
    }
    
}
