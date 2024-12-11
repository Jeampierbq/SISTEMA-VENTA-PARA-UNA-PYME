<%@page import="tienda.modelo.dao.ArticuloDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Artículo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body>        
        <div class="container">
            <h1>Editar Artículo</h1>
            <form action="grabar2Art" method="post" enctype="multipart/form-data">
                <div>
                    <td>
                        <input type="hidden" readonly name="cod" value=${producto.idArticulo}> 
                    </td> 
                </div>
                <div class="mb-3">
                    <label for="nom" class="form-label">Nuevo Nombre</label>
                    <input type="text" class="form-control" id="nom" name="nom" value="${producto.nombre}">
                </div>
                <div class="mb-3">
                    <label for="des" class="form-label">Nueva Descripción</label>
                    <textarea class="form-control" id="des" name="des" rows="5">${producto.descripcion}</textarea>
                </div>
                <div class="mb-3">
                    <label for="prec" class="form-label">Nuevo Precio</label>
                    <input type="number" class="form-control" id="prec" name="prec" value=${producto.precio}>
                </div>
                <div class="mb-3">
                    <label for="productImage">Imagen del Producto:</label><br>
                    <img src="img/${producto.foto}" alt="Imagen actual" height="300" width="355">
                    <br>
                    <label for="fot" class="form-label">Nueva Foto</label>
                    <input type="file" class="form-control" id="fot" name="foto">
                    <br>
                    <br>
                    <input type="text" name="fotoActual" value="${producto.foto}">
                </div>
                <div class="mb-3">
                    <label for="cat" class="form-label">Categoría Actual</label>
                    <input type="text" class="form-control" id="catActual" name="catActual" value="${producto.categoria}" readonly>
                </div>
                <div class="mb-3">
                    <label for="cat" class="form-label">Nueva Categoría</label>
                    <select class="form-select" id="cat" name="cat">
                        <%
                            List<String> categorias = ArticuloDAO.getCategorias();
                            for (String categoria : categorias) {
                        %>
                        <option value="<%= categoria%>"><%= categoria%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
