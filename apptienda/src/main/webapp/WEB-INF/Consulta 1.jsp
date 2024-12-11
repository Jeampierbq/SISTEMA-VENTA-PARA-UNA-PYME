

<%@page import="tienda.modelo.dao.CategoriaDAO"%>
<%@page import="tienda.modelo.bean.Producto"%>
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
    <body>
       <!-- SideBar -->
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
			<!-- SideBar Menu -->
			<ul class="list-unstyled full-box dashboard-sideBar-Menu">
                            <li>
					<li><a href="home">Inicio</a></li>
				</li>
                            <li>
					<li><a href="Venta">Venta</a></li>
				</li>
				<li>
					<li><a href="nuevoArt">Agregar</a></li>
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
        <div class="container">
        <h3>Listar Articulo por Categoria</h3> 
        
        <% ArrayList<Producto> arts = (ArrayList<Producto>) request.getAttribute("producto");%>
            <form action="Consulta1" method="post">
            <label>Escoja categoría:</label>
            <select name="categorias" class="form-select form-select-sm" aria-label="Small select example" style="width: 20%">
                <option></option>
                <option value="Lacteos">Lácteos</option>
                <option value="Abarrotes">Abarrotes</option>
                <option value="Gaseosas">Gaseosas</option>
                <option value="Licores">Licores</option>
                <option value="Comida para mascotas">Comida para mascotas</option>
                <option value="Confiteria">Confitería</option>
                <option value="Limpieza">Limpieza</option>
                <option value="Enlatados">Enlatados</option>
                <option value="Congelados">Congelados</option>
                <option value="Pan">Pan</option>
                <option value="Harinas">Harinas</option>
                <option value="Embutidos">Embutidos</option>
            </select>
            <br>
            <div>
               <button type="submit"  class="btn btn-primary">Listar</button> 
            </div>
            
        </form>
        </div>
        <section class="dashboard-content">
            <div class="table-container">
        <br>
        <%if (request.getMethod().equals("POST") && arts != null) {%>
        <table class="table table-striped"> 
            <thead>
                <tr> 
                    <th scope="col">idProducto</th>
                    <th scope="col">nombre</th>
                    <th scope="col">Descripcion</th>
                    <th scope="col">Precio</th>
                    <th scope="col">Fecha de Vencimiento</th>
                    <th scope="col">Categoria</th>
                    <th scope="col">Eliminar</th>
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
                        <td><a href="eliminarArt?id=<%= x.getIdproducto()%>" onclick="return confirmar()"><img  style="width:40px; height:40px;" class="small-image" src="https://th.bing.com/th/id/OIP.ZaDq6JHaPZQLmcPhgpKvsQHaIh?rs=1&pid=ImgDetMain" alt="Eliminar"></a></td>
                    </tr>
                <%}%>
            </tbody>
        </table>
        <%}%>
        </div>
    </section>
        <script>
            function confirmar() {
                return confirm("¿Está seguro de que desea eliminar este producto?");
            }
        </script>
    </body>
</html>
