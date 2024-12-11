<%-- 
    Document   : Pedidos
    Created on : 12 dic. 2023, 00:35:19
    Author     : Apo
--%>

<%@page import="java.util.List"%>
<%@page import="tienda.modelo.bean.Pedido"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Listado de Pedidos</title>
</head>
<body>
    <h2>Listado de Pedidos</h2>

    <table border="1">
        <thead>
            <tr>
                <th>ID Pedido</th>
                <th>Nombre Cliente</th>
                <th>Apellido Paterno</th>
                <th>Apellido Materno</th>
                <th>ID Producto</th>
                <th>Nombre Producto</th>
                <th>Precio</th>
                <th>Fecha Vencimiento</th>
                <th>Cantidad</th>
                <th>Subtotal</th>
            </tr>
        </thead>
        <tbody>
            <% for (Pedido pedido : (List<Pedido>)request.getAttribute("listaPedidos")) { %>
                <tr>
                    <td><%= pedido.getIdpedido_detalle() %></td>
                    <td><%= pedido.getNombre() %></td>
                    <td><%= pedido.getAp_paterno() %></td>
                    <td><%= pedido.getAp_materno() %></td>
                    <td><%= pedido.getIdproducto() %></td>
                    <td><%= pedido.getNombrep() %></td>
                    <td><%= pedido.getPrecio() %></td>
                    <td><%= pedido.getFecha_ven() %></td>
                    <td><%= pedido.getCantidad() %></td>
                    <td><%= pedido.getSubtotal() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
