<%-- 
    Document   : Consulta5
    Created on : 17 nov. 2023, 23:19:35
    Author     : EDISON
--%>

<%@page import="tienda.modelo.dao.CategoriaDAO"%>
<%@page import="tienda.modelo.bean.Articulos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    </head>
    <body style="background:linear-gradient(135deg, #ffe263,#fe9700);">
        
        <% ArrayList<Articulos> arts=(ArrayList<Articulos>)request.getAttribute("articulos");%>
        <h1>Articulo mayor</h1>
        
        <form action="grabarArt" method="post">
                <table>
                    <tr>
                         <td>Empleado</td>
                            <td>
                                <select name="idcat" class="form-select form-select-sm" aria-label="Small select example" style="width: 100%">
                                    <option></option>
                                    <option value="1" ${empleado.nombre == 1 ? 'selected' : ''}>Abel Lizandro Guillen Gallegos</option>
                                </select>
                            </td>

                    </tr>
                    <td>Detalles del Cliente</td>
                    <tr>
                        <td>Nombre Cliente</td>
                        <td>
                            <input type="text" name="nombre" value="${cliente.nombre}">
                            <input type="hidden" name="cod" value="${cliente.idcliente}">
                        </td>
                    </tr>
                    <tr>
                        <td>Apellido Paterno</td>
                        <td><input type="text" name="apaterno" value="${cliente.apaterno}"></td>
                    </tr>
                    <tr>
                        <td>Apellido Materno</td>
                        <td><input type="text" name="amaterno" value="${cliente.amaterno}"></td>
                    </tr>
                    <tr>
                        <td>DNI</td>
                        <td><input type="text" name="dni" value="${cliente.DNI}"></td>
                    </tr>
                    <tr>
                        <td>Celular</td>
                        <td><input type="text" name="celular" value="${cliente.celular}"></td>
                    </tr>
                    
                    <td>Detalles Producto</td>
                    
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Grabar" class="btn btn-primary"></td>
                    </tr>
                </table>
            </form> 
        <table class="table table-striped-columns">
            <thead>
                <tr>
                    <th>idArticulo</th>
                    <th>nombre</th>
                    <th>Descripcion</th>
                    <th>Precio</th>
                    <th>Foto</th>
                    <th>Categoria</th>
                </tr>
            </thead>
            <tbody>
                <%for(Articulos x:arts){%>
                <tr>
                    <td><%=x.getIdarticulo()%></td>
                    <td><%=x.getNombre()%></td>
                    <td><%=x.getDescripcion()%></td>
                    <td><%=x.getPrecion()%></td>
                    <td><img src="img/<%=x.getFoto()%>" width="60px" height="60px" alt="alt"/></td>
                    <td><%=CategoriaDAO.buscarCategoriaID(x.getIdcategoria()).getCategoria()%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
