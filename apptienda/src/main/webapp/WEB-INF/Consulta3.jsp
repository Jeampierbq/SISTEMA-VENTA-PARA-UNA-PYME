<%-- 
    Document   : Consulta3
    Created on : 16 nov. 2023, 22:53:26
    Author     : EDISON
--%>

<%@page import="tienda.modelo.bean.Pedidos"%>
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
        <%ArrayList<Pedidos> pd = (ArrayList<Pedidos>) request.getAttribute("pedidos");%>
        <div class="container">
            <div style="margin-top: 5%;">
                <h2>Buscar pedidos en dos intervalos</h2>
                <form action="Consulta3" method="post">
                    <label>Fecha inicial:</label>            
                    <input type="date" name="fechai">
                    <br><br>
                    <label>Fecha final:</label>
                    <input type="date" name="fechaf">
                    <br><br>
                    <button type="submit" class="btn btn-primary">Listar pedidos</button>
                    <br>
                </form>
            </div>
        </div>
        <br><br>

        <%if (request.getMethod().equals("POST") && pd != null) {%>
        <table id="segundaTabla" class="table table-striped">
            <thead>
                <tr>
                    <th>Idpedido</th>
                    <th>Fecha</th>
                    <th>Total</th>
                    <th>Idempleado</th>
                    <th>Idcliente</th>
                </tr>
            </thead>
            <tbody>
                <%for (Pedidos p : pd) {%>
                <tr>
                    <td><%=p.getId()%></td>
                    <td><%=p.getFecha()%></td>
                    <td><%=p.getTotal()%></td>
                    <td><%=p.getIdemp()%></td>
                    <td><%=p.getIdcliente()%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
        <%}%>
    </body>
</html>
