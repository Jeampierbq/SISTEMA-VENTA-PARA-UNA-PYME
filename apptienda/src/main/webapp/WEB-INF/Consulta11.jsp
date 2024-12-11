<%-- 
    Document   : Consulta11
    Created on : 18 nov. 2023, 20:49:21
    Author     : EDISON
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="tienda.modelo.bean.Articulos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    </head>
    <body style="background:linear-gradient(135deg, #f292ed,#f36364);">
        <h1>Articulos pedidos</h1>
        <% ArrayList<Articulos> arts=(ArrayList<Articulos>)request.getAttribute("articulos");%>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>idArticulo</th>
                    <th>nombre</th>
                    <th>Precio</th>
                </tr>
            </thead>
            <tbody>
                <%for(Articulos x:arts){%>
                <tr>
                    <td><%=x.getIdarticulo()%></td>
                    <td><%=x.getNombre()%></td>
                    <td><%=x.getPrecion()%></td>                   
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
