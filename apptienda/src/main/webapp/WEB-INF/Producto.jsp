<%-- 
    Document   : Producto
    Created on : 6 dic. 2023, 01:52:40
    Author     : Apo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="tienda.modelo.dao.CategoriaDAO"%>
<%@page import="tienda.modelo.bean.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Producto</title>
    </head>
    <body>
        <% ArrayList<Producto> arts = (ArrayList<Producto>) request.getAttribute("producto");%>
        <div class="container">
        <h3>Listar Articulo por Categoria</h3> 
            <form action="Consulta1" method="post">
            <label>Escoja categoría:</label>
            <select name="categorias" class="form-select form-select-sm" aria-label="Small select example" style="width: 20%">
                <option></option>
                <option value="Implementos de Futbol">Implementos de Futbol</option>
                <option value="Implementos de Voley">Implementos de Voley</option>
                <option value="Implementos de Pesca">Implementos de Pesca</option>
            </select>
            <br>
            <div>
               <button type="submit"  class="btn btn-primary">Listar</button> 
               <a href="nuevoArt" class="frontpage_heading">Agregar</a>
            </div>
            
        </form>
        </div>
        <br>
        <%if (request.getMethod().equals("POST") && arts != null) {%>
        <table class="table table-striped"> 
            <thead>
                <tr> <th>idProducto</th>
                    <th>nombre</th>
                    <th>Descripcion</th>
                    <th>Precio</th>
                    <th>Foto</th>
                </tr> 
            </thead>
            <tbody>
                <%for (Producto x : arts) {%>
                    <tr>
                        <td><%=x.getIdproducto()%></td>
                        <td><%=x.getNombre()%></td>
                        <td><%=x.getDescripcion()%></td>
                        <td><%=x.getPrecio()%></td>
                        <td><%=x.getFecha_ven()%></td>
                        <td><%=CategoriaDAO.buscarCategoriaID(x.getIdcategoria()).getCategoria()%></td>
                    </tr>
                <%}%>
            </tbody>
        </table>
        <%}%>
        <li><a href="editarArt">Agregar</a></li>
        <li><a href="editarArt">Eliminar</a></li>
    </body>
</html>
