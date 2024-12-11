<%-- 
    Document   : Consulta6
    Created on : 17 nov. 2023, 23:26:27
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
    <body style="background:linear-gradient(135deg, #f292ed,#f36364);">
    <%ArrayList<Articulos> arts = (ArrayList<Articulos>) request.getAttribute("articulos");%>
    <div class="container" style="margin-top: 5%;">
        <form action="Consulta6" method="post">
            <label>Escriba nombre del articulo:</label>
            <input type="text" name="NomArt">
            <br>
            <br>
            <button type="submit" class="btn btn-primary">Buscar</button>
        </form>
    </div>
    
        <br>
        <%if (request.getMethod().equals("POST") && arts != null) {%>
        <table id="segundaTabla" class="table table-striped">
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
        <%}%>
    </body>
</html>
