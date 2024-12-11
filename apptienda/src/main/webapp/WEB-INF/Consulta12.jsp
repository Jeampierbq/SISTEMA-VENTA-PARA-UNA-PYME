<%-- 
    Document   : Consulta 12
    Created on : 18 nov. 2023, 00:10:02
    Author     : EDISON
--%>

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
        <div class="container" style="margin-top: 5%;">
            <% ArrayList<Articulos> arts = (ArrayList<Articulos>) request.getAttribute("articulos");
                int NUM = arts.size();%>
            <h1>Número de artículos no pedidos: <%=NUM%></h1>
        </div>


    </body>
</html>
