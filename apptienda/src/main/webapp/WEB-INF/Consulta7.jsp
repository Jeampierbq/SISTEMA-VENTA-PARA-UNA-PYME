<%-- 
    Document   : Consulta7
    Created on : 18 nov. 2023, 20:37:14
    Author     : EDISON
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="tienda.modelo.bean.Pais"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    </head>
    <body style="background:linear-gradient(135deg, #ffc82f,#fd4900);">
        
        <% ArrayList<Pais> ps=(ArrayList<Pais>)request.getAttribute("pais");%>
        <h1>Paises sin cliente asignado</h1>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>idPais</th>
                    <th>Pais</th>
                </tr>
            </thead>
            <tbody>
                <%for(Pais x:ps){%>
                <tr>
                    <td><%=x.getIdpais()%></td>
                    <td><%=x.getPais()%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
