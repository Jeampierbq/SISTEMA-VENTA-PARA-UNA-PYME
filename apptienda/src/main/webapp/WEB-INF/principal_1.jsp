<%-- 
    Document   : principal
    Created on : 8 may. 2023, 21:23:13
    Author     : BLANCO
--%>

<%@page import="tienda.modelo.dao.CategoriaDAO"%>
<%@page import="tienda.modelo.bean.Categoria"%>
<%@page import="tienda.modelo.bean.Categoria"%>
<%@page import="tienda.modelo.bean.Articulos"%>
<%@page import="tienda.modelo.bean.Producto"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/material-design-icons@3.0.1/iconfont/material-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    
    <style>
        @font-face {
    font-family: 'Verdana, sans-serif';
    src: url('../fonts/robotocondensed-light.eot');
    src: url('../fonts/robotocondensed-light.eot?#iefix') format('embedded-opentype'),
         url('../fonts/robotocondensed-light.woff2') format('woff2'),
         url('../fonts/robotocondensed-light.woff') format('woff'),
         url('../fonts/robotocondensed-light.ttf') format('truetype'),
         url('../fonts/robotocondensed-light.svg#roboto_condensedlight') format('svg');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'RobotoCondensed';
    src: url('../fonts/robotocondensed-regular.eot');
    src: url('../fonts/robotocondensed-regular.eot?#iefix') format('embedded-opentype'),
         url('../fonts/robotocondensed-regular.woff2') format('woff2'),
         url('../fonts/robotocondensed-regular.woff') format('woff'),
         url('../fonts/robotocondensed-regular.ttf') format('truetype'),
         url('../fonts/robotocondensed-regular.svg#roboto_condensedregular') format('svg');
    font-weight: normal;
    font-style: normal;
}
/*============ Estilos generales*/
body, html{
	background-color: #fff;
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
	position: relative;
	font-size: 16px;
	font-family: Verdana, sans-serif;
	overflow: hidden;
}
.full-box{
	margin: 0;
	padding: 0;
	width: 100%;
	box-sizing: border-box;
}
.cover{
	background: 50% 50% no-repeat;
	background-size: cover;
}
.text-titles{
	font-family: Verdana, sans-serif;
}
.breadcrumb-tabs{
	margin-bottom: 15px; 
	background-color: transparent; 
	border-bottom: 2px solid #F7F7F7;
	padding: 0;
}
/*============ LogIn*/
.login-container{
	height: 100%;
	background-image: url(../assets/img/login.jpg);
}
li{
    font-family: "font-family: Verdana, sans-serif;"
}
.logInForm{
	position: absolute;
	color: #fff;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 90%;
	max-width: 300px;
	padding: 15px;
	border: 1px solid rgba(255,255,255,.3);
	border-radius: 4px;
}
.logInForm p,
.logInForm label{
	color: #FFF;
}
/*============ Partes del dashboard*/
.dashboard-sideBar,
.dashboard-contentPage{
	position: absolute;
	top: 0;
	height: 100%;
	transition: all .3s ease-in-out;
}
/*sideBar*/
.dashboard-sideBar,
.dashboard-sideBar-ct{
	width: 270px;
}
.dashboard-sideBar{
	left: 0;
	z-index: 2;
	background-image: url('img/sideBar.jpg');
	border-right: 1px solid rgba(255, 255, 255, .7);
	overflow: hidden;
}
.dashboard-sideBar-ct{
	position: relative;
	height: 100%;
	background-color: rgba(42, 45, 52, 0.7);
	padding: 0 10px;
	padding-bottom: 30px;
}
.dashboard-sideBar-title,
.dashboard-sideBar-title > i{
	height: 50px;
	line-height: 50px;
	color: #fff;
	font-size: 20px;
}
.dashboard-sideBar-title{
	position: relative;
}
.dashboard-sideBar-title > i{
	position: absolute;
	top: 0;
	left: 0;
	cursor: pointer;
	width: 40px;
}
.dashboard-sideBar-UserInfo{
	border-top: 1px solid rgba(255, 255, 255, .3);
	border-bottom: 1px solid rgba(255, 255, 255, .3);
	color: #fff;
	font-size: 14px;
	padding: 20px 0;
}
.dashboard-sideBar-UserInfo figure img{
	width: 100px;
	height: 100px;
	border-radius: 100%;
	display: block;
	margin: 0 auto;
}
.dashboard-sideBar-UserInfo ul{
	margin-top: 15px;
}
.dashboard-sideBar-UserInfo ul > li,
.dashboard-sideBar-UserInfo ul > li > a{
	display: inline-block;
	color: #fff;
}
.dashboard-sideBar-UserInfo ul > li > a{
	outline: none;
	font-size: 20px;
	padding: 7px;
	transition: all .3s ease-in-out;
}
.dashboard-sideBar-UserInfo ul > li > a:hover{
	color: #F7F052;
}
.dashboard-sideBar-Menu{
	padding-top: 15px;
}
.dashboard-sideBar-Menu > li,
.dashboard-sideBar-Menu > li > a,
.dashboard-sideBar-Menu > li > ul > li,
.dashboard-sideBar-Menu > li > ul > li > a{
	line-height: 50px;
	font-family: "RobotoCondensedLight";
	display: block;
	color: #fff;
	text-decoration: none;
	border-radius: 4px;
	transition: all .3s ease-in-out;
	position: relative;
}
.dashboard-sideBar-Menu > li > a > i.zmdi-caret-down{
	line-height: 50px;
	transition: all .3s ease-in-out; 
}
.dashboard-sideBar-Menu > li > a{
	padding: 0 15px;
	box-sizing: border-box;
	height: 50px;
	outline: none;
}
.dashboard-sideBar-Menu > li > a:hover{
	background-color: rgba(255, 255, 255, .2);
}
.dashboard-sideBar-Menu > li > ul{
	position: relative;
	padding-top: 7px;
	height: 0;
	overflow: hidden;
}
.show-sideBar-SubMenu{
	height: auto !important;
	overflow: auto !important;
}
.dashboard-sideBar-Menu > li > ul > li,
.dashboard-sideBar-Menu > li > ul > li > a{
	height: 40px;
	line-height: 40px;
	border-radius: 0;
}
.dashboard-sideBar-Menu > li > ul > li{
	padding-left: 27px;
}
.dashboard-sideBar-Menu > li > ul > li > a{
	border-left: 3px solid transparent;
	outline: none;
}
.dashboard-sideBar-Menu > li > ul > li > a:hover{
	border-left: 3px solid #F7F052;
	color: #F7F052;
}
/*contentPage*/
.dashboard-contentPage{
	right: 0;
	z-index: 1;
	padding-left: 270px;
}
.dashboard-Navbar,
.dashboard-Navbar > ul,
.dashboard-Navbar > ul >li,
.dashboard-Navbar > ul > li > a{
	height: 50px;
	line-height: 50px;
}
.dashboard-Navbar > ul > li > a{
	outline: none;
}
.dashboard-Navbar{
	background-color: #2A2D34;
	overflow: hidden;
}
.dashboard-Navbar > ul >li,
.dashboard-Navbar > ul > li > a{
	display: inline-block;
	width: 50px;
	text-align: center;
	color: #fff;
	margin: 0;
	padding: 0;
	font-size: 20px;
	transition: all .3s ease-in-out;
	position: relative;
}
.dashboard-Navbar > ul > li > a:hover{
	background-color: rgba(255, 255, 255, .1);
}
.dashboard-Navbar > ul > li > a > span.badge{
	position: absolute;
	top: 7px;
	right: 6px;
	background-color: #FF5722;
	transition: all .3s ease-in-out;
}
/*============ Area de notificaciones*/
.Notifications-area{
	height: 100%;
	position: fixed;
	z-index: 99;
	transition: all .3s ease-in-out;
	overflow: hidden;
	opacity: 0;
	pointer-events: none;
}
h1 {
    font-family: Verdana, sans-serif;
    /* Otros estilos de fuente, tamaño, etc. */
}
.Notifications-bg,
.Notifications-body{
	height: 100%;
	position: absolute;
	top: 0;
	right: 0;
}
.Notifications-bg{
	z-index: 1;
	background-color: rgba(0, 0, 0, .7);
}
.Notifications-body{
	z-index: 2;
	background-color: #FFF;
	width: 100%;
	max-width: 300px;
	transform: translateX(300px);
	transition: all .3s ease-in-out;
}
.Notifications-body-title,
.Notifications-body-title > i{
	height: 50px;
	line-height: 50px;
	font-size: 20px;
}
.Notifications-body-title{
	background-color: #FF5722;
	color: #fff;
	position: relative;
}
.Notifications-body-title > i{
	position: absolute;
	top: 0;
	left: 0;
	cursor: pointer;
	width: 50px;
}
.show-Notification-area{
	opacity: 1 !important;
	pointer-events: auto !important;
}
.show-Notification-area > .Notifications-body{
	transform: translateX(0) !important;
}
/*============ Estilos home*/
.tile{
	max-width: 300px;
	height: 180px;
	background-color: #fff;
	color: rgba(43, 174, 168, 1);
	position: relative;
	display: inline-block;
	box-shadow: 0 1px 7px rgba(0, 0, 0, .2);
	overflow: hidden;
	cursor: pointer;
	margin: 10px;
}
.tile:hover > .tile-icon > i,
.tile:hover > .tile-number{
	color: rgba(43, 174, 168, 1);
}
.tile-title,
.tile-icon,
.tile-number{
	position: absolute;
}
.tile-title{
	height: 40px;
	line-height: 40px;
	font-size: 20px;
	background-color: rgb(43, 174, 168);
	color: #fff;
	top: 0;
	left: 0;
}
.tile-icon,
.tile-number{
	bottom: 0;
	height: 140px;
	width: 150px;
}
.tile-icon{
	left: 0;
}
.tile-icon > i{
	line-height: 140px;
	font-size: 117px;
}
.tile-icon > i,
.tile-number{
	color: rgba(43, 174, 168, .4);
	transition: all .3s ease-in-out;
}
.tile-number{
	right: 0;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}
.tile-number > p{
	font-size: 70px;
}
.tile-number > small{
	font-size: 17px;
}
/*TimeLine*/
.cd-container {
  width: 90%;
  max-width: 1170px;
  margin: 0 auto;
}
.cd-container::after {
  content: '';
  display: table;
  clear: both;
}
#cd-timeline {
  position: relative;
  padding: 2em 0;
  margin-top: 2em;
  margin-bottom: 2em;
}
#cd-timeline::before {
  content: '';
  position: absolute;
  top: 0;
  left: 18px;
  height: 100%;
  width: 4px;
  background: #d7e4ed;
}
.cd-timeline-block {
  position: relative;
  margin: 2em 0;
}
.cd-timeline-block::after {
  content: "";
  display: table;
  clear: both;
}
.cd-timeline-block:first-child {
  margin-top: 0;
}
.cd-timeline-block:last-child {
  margin-bottom: 0;
}
.cd-timeline-img {
  position: absolute;
  top: 0;
  left: 0;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  box-shadow: 0 0 0 4px rgba(0,0,0,.09);
}
.cd-timeline-img img {
  display: block;
  width: 40px;
  height: 40px;
  position: relative;
  border-radius: 50%;
}
.cd-timeline-content {
  position: relative;
  margin-left: 60px;
  border-radius: 0.25em;
  padding: 1em;
  background-color: #01579B;
  color: #fff;
}
.cd-timeline-content::after {
  content: "";
  display: table;
  clear: both;
}
.cd-timeline-content .cd-date {
  display: inline-block;
}
.cd-timeline-content p {
  margin: 1em 0;
  line-height: 1.6;
}
.cd-timeline-content .cd-date {
  float: left;
  padding: .8em 0;
}
.cd-timeline-content::before {
  content: '';
  position: absolute;
  top: 16px;
  right: 100%;
  height: 0;
  width: 0;
  border: 7px solid transparent;
  border-right: 7px solid #01579B;
}
@media (min-width: 1200px) {
    #cd-timeline {
        margin-top: 3em;
        margin-bottom: 3em;
    }
    #cd-timeline::before {
        left: 50%;
        margin-left: -2px;
    }
    .cd-timeline-block {
        margin: 4em 0;
    }
    .cd-timeline-block:first-child {
        margin-top: 0;
    }
    .cd-timeline-block:last-child {
        margin-bottom: 0;
    }
    .cd-timeline-img {
        width: 60px;
        height: 60px;
        left: 50%;
        margin-left: -30px;
        -webkit-transform: translateZ(0);
        -webkit-backface-visibility: hidden;
    }
    .cd-timeline-img img{
        width: 60px;
        height: 60px;
    }
    .cd-timeline-content .cd-date {
        color: #01579B;
    }
    .cd-timeline-content {
        margin-left: 0;
        width: 45%;
    }
  .cd-timeline-content::before {
    top: 24px;
    left: 100%;
    border-color: transparent;
    border-left-color: #01579B;
  }
  .cd-timeline-content .cd-date {
    position: absolute;
    width: 100%;
    left: 122%;
    top: 6px;
    font-size: 16px;
    font-size: 1rem;
  }
  .cd-timeline-block:nth-child(even) .cd-timeline-content {
    float: right;
  }
  .cd-timeline-block:nth-child(even) .cd-timeline-content::before {
    top: 24px;
    left: auto;
    right: 100%;
    border-color: transparent;
    border-right-color: #01579B;
  }
  .cd-timeline-block:nth-child(even) .cd-timeline-content .cd-date {
    left: auto;
    right: 122%;
    text-align: right;
  }
}

/*======= MEDIA QUERIES*/
@media (max-width: 767px){
	.dashboard-sideBar{
		width: 100%;
		z-index: 99;
		background-image: none;
		background-color: transparent;
		border-right: none;
		opacity: 0;
		pointer-events: none;
		overflow: hidden;
	}
	.dashboard-sideBar-ct,
	.dashboard-sideBar-bg{
		position: absolute;
		top: 0;
		left: 0;
	}
	.dashboard-sideBar-ct{
		background-color: #2A2D34;
		border-right: 1px solid rgba(255, 255, 255, .3);
		z-index: 3;
		max-width: 270px;
		width: 100%;
		transition: all .3s ease-in-out;
		transform: translateX(-270px);
	}
	.dashboard-sideBar-bg{
		height: 100%;
		background-color: rgba(0, 0, 0, .6);
		z-index: 2;
	}
	.dashboard-contentPage{
		padding-left: 0;
	}
	.show-sidebar{
		pointer-events: auto !important;
		opacity: 1 !important;
	}
	.show-sidebar > .dashboard-sideBar-ct{
		transform: translateX(0) !important;
	}
}
@media (min-width: 768px) and (max-width: 991px){
	.hide-sidebar{
		pointer-events: none;
		opacity: 0;
		border-right: none;
		transform: translateX(-270px);
	}
	.no-paddin-left{
		padding-left: 0;
	}
}
@media (min-width: 992px) and (max-width: 1199px){
	.hide-sidebar{
		pointer-events: none;
		opacity: 0;
		border-right: none;
		transform: translateX(-270px);
	}
	.no-paddin-left{
		padding-left: 0;
	}
}
@media (min-width: 1200px){
	.hide-sidebar{
		pointer-events: none;
		opacity: 0;
		border-right: none;
		transform: translateX(-270px);
	}
	.no-paddin-left{
		padding-left: 0;
	}
}
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" href="main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
        crossorigin="anonymous">
</head>
<body>
    <h2>Listado de Productos por Fecha</h2>
    <div  class="scrollable-container">
            <h1>Articulos</h1>
            <% ArrayList<Producto> arts = (ArrayList<Producto>) request.getAttribute("producto");%>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">idProducto</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Descripcion</th>
                        <th scope="col">Precio</th>
                        <th scope="col">fecha_ven</th>
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
        </div>
</body>

</html>


