<%-- 
    Document   : Consulta4
    Created on : 17 nov. 2023, 00:07:03
    Author     : EDISON
--%>
<%@page import="tienda.modelo.bean.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tienda.modelo.bean.Articulos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="main.css">
<style>
        /* Agrega estas reglas al final del archivo CSS o después de las reglas existentes */
        .dashboard-container {
            position: relative;
        }

        .dashboard-content {
            margin-left: 20%; /* Ancho de la barra lateral */
            padding: 20px;
        }

        /* Estilo para la tabla */
        .table-container {
            margin-top: 80px; /* Altura de la barra lateral + espacio adicional */
        }
    </style>

    </head>
    <body >
        <section class="full-box cover dashboard-sideBar">
		<div class="full-box dashboard-sideBar-bg btn-menu-dashboard"></div>
		<div class="full-box dashboard-sideBar-ct">
			<!--SideBar Title -->
			<div class="full-box text-uppercase text-center text-titles dashboard-sideBar-title">
				Keyla y Diana <i class="zmdi zmdi-close btn-menu-dashboard visible-xs"></i>
			</div>
			<!-- SideBar User info -->
			<div class="full-box dashboard-sideBar-UserInfo">
				<figure class="full-box">
					<img src="./assets/avatars/AdminMaleAvatar.png" alt="UserIcon">
					<figcaption style="font-family: Verdana, sans-serif;" class="text-center text-titles">AbelGG</figcaption>
				</figure>
				<ul class="full-box list-unstyled text-center">
					<li>
						<a href="my-data.html" title="Mis datos">
							<i class="zmdi zmdi-account-circle"></i>
						</a>
					</li>
					<li>
						<a href="my-account.html" title="Mi cuenta">
							<i class="zmdi zmdi-settings"></i>
						</a>
					</li>
					<li>
						<a href="#!" title="Salir del sistema" class="btn-exit-system">
							<i class="zmdi zmdi-power"></i>
						</a>
					</li>
				</ul>
			</div>
			<ul class="list-unstyled full-box dashboard-sideBar-Menu">
				<li>
					<a href="Venta">
						<i style="font-family: Verdana, sans-serif;"  class="zmdi zmdi-view-dashboard zmdi-hc-fw"></i> Venta
					</a>
				</li>
				<li>
					<li><a href="listarArt">Inventario</a></li>
				</li>
				<li>
					<a href="Consulta1">
						<i style="font-family: Verdana, sans-serif;"  class="zmdi zmdi-book-image zmdi-hc-fw"></i> Producto
					</a>
				</li>
                                <li>
					<a href="Consulta10">
						<i style="font-family: Verdana, sans-serif;"  class="zmdi zmdi-book-image zmdi-hc-fw"></i> Clientes
					</a>
				</li>
			</ul>
		</div>
	</section>
        <section class="dashboard-content">
            <div class="table-container">
        <h1>Clientes</h1>
        <% ArrayList<Cliente> cli=(ArrayList<Cliente>)request.getAttribute("clientes");%>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">idCliente</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Apellido Paterno</th>
                    <th scope="col">Apellido Materno</th>
                    <th scope="col">Dni</th>
                    <th scope="col">Celular</th>
                </tr>
            </thead>
            <tbody>
                <%for(Cliente x:cli){%>
                <tr>
                    <td><%=x.getIdcliente()%></td>
                    <td><%=x.getNombre()%></td>
                    <td><%=x.getApaterno()%></td>
                    <td><%=x.getAmaterno()%></td>
                    <td><%=x.getDNI()%></td>
                    <td><%=x.getCelular()%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
            </div>
            </section>
    </body>
</html>