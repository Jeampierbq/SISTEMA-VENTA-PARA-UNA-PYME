<%-- 
    Document   : formArticulo
    Created on : 25 nov. 2023, 22:49:41
    Author     : gilmar
--%>

<%@page import="java.util.Objects"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sidebar</title>
        <link rel="stylesheet" href="css/style.css">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Outfit:wght@500&display=swap');

            :root {
                --color-barra-lateral: #ffffff;
                --shadow-color: 229deg 5% 38%;

                --shadow-elevation-sidebar-low:
                    1px 0px 1.1px hsl(var(--shadow-color) / 0.23),
                    1.5px 0px 1.7px -1.2px hsl(var(--shadow-color) / 0.23),
                    3.3px 0px 3.7px -2.5px hsl(var(--shadow-color) / 0.23);

                --shadow-elevation-sidebar-medium:
                    1px 0px 1.4px hsl(var(--shadow-color) / 0.08),
                    5.8px -0.1px 8.2px -0.3px hsl(var(--shadow-color) / 0.26),
                    17.5px -0.2px 24.8px -0.5px hsl(var(--shadow-color) / 0.45);

                --color-texto: #000000;
                --color-texto-menu: #868890;

                --color-menu-hover: #eeeeee;
                --color-menu-hover-texto: #000000;

                --color-boton: #000000;
                --color-boton-texto: #ffffff;

                --color-linea: #b4b4b4;

                --color-switch-base: #C9CACE;
                --color-switch-circulo: #f1f1f1;

                --color-scroll: #c0c0c0;
                --color-scroll-hover: #868686;
                --color-body: #c0c0c003;
            }

            .dark-mode {
                --color-barra-lateral: #2c2d31;

                --color-texto: #ffffff;
                --color-texto-menu: #6e6e75;

                --color-menu-hover: #000000;
                --color-menu-hover-texto: #eeeeee;

                --color-boton: #ffffff;
                --color-boton-texto: #000000;

                --color-linea: #5a5a5a;

                --color-switch-base: #27cd40;
                --color-switch-circulo: #ffffff;

                --color-scroll: #44454a;
                --color-scroll-hover: #555555;
            }


            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Outfit', sans-serif;
            }

            body {
                height: 100vh;
                width: 100%;
                background-color: var(--color-body);
            }

            /* Menu */
            .menu {
                position: fixed;
                width: 50px;
                height: 50px;
                font-size: 30px;
                display: none;
                justify-content: center;
                align-items: center;
                border-radius: 50%;
                cursor: pointer;
                background-color: var(--color-boton);
                color: var(--color-boton-texto);
                right: 15px;
                top: 15px;
                z-index: 100;
            }


            /* Barra Lateral */
            .barra-lateral {
                position: fixed;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                width: 250px;
                height: 100%;
                overflow: hidden;
                padding: 20px 15px;
                background-color: var(--color-barra-lateral);
                transition: width 0.5s ease, background-color 0.3s ease, left 0.5s ease;
                z-index: 50;
                box-shadow: var(--shadow-elevation-sidebar-medium);
            }

            .mini-barra-lateral {
                width: 80px;
            }

            .barra-lateral span {
                width: 100px;
                white-space: nowrap;
                font-size: 18px;
                text-align: left;
                opacity: 1;
                transition: opacity 0.5s ease, width 0.5s ease;
            }

            .barra-lateral span.oculto {
                opacity: 0;
                width: 0;
            }

            /* Nombre de la página */
            .barra-lateral .nombre-pagina {
                width: 100%;
                height: 45px;
                color: var(--color-texto);
                margin-bottom: 40px;
                display: flex;
                align-items: center;
            }

            .barra-lateral .nombre-pagina ion-icon {
                min-width: 50px;
                font-size: 40px;
                cursor: pointer;
            }

            .barra-lateral .nombre-pagina span {
                margin-left: 5px;
                font-size: 20px;
            }

            /* Botón */
            .barra-lateral .boton {
                width: 100%;
                height: 45px;
                margin-bottom: 20px;
                display: flex;
                align-items: center;
                justify-content: center;
                border: none;
                border-radius: 10px;
                background-color: var(--color-boton);
                color: var(--color-boton-texto);
            }

            .barra-lateral .boton ion-icon {
                min-width: 50px;
                font-size: 25px;
            }

            /* Menu Navegación */
            .barra-lateral .navegacion {
                height: 100%;
                overflow-y: auto;
                overflow-x: hidden;
            }

            .barra-lateral .navegacion::-webkit-scrollbar {
                width: 5px;
            }

            .barra-lateral .navegacion::-webkit-scrollbar-thumb {
                background-color: var(--color-scroll);
                border-radius: 5px;
            }

            .barra-lateral .navegacion::-webkit-scrollbar-thumb:hover {
                background-color: var(--color-scroll-hover);
            }

            .barra-lateral .navegacion li {
                list-style: none;
                display: flex;
                margin-bottom: 5px;
            }

            .barra-lateral .navegacion a {
                width: 100%;
                height: 45px;
                display: flex;
                align-items: center;
                text-decoration: none;
                border-radius: 10px;
                color: var(--color-texto-menu);
            }

            .barra-lateral .navegacion a:hover {
                background-color: var(--color-menu-hover);
                color: var(--color-menu-hover-texto);
            }

            .barra-lateral .navegacion ion-icon {
                min-width: 50px;
                font-size: 20px;
            }

            /* Linea */
            .barra-lateral .linea {
                width: 100%;
                height: 1px;
                margin-top: 15px;
                background-color: var(--color-linea);
            }

            /* Modo Oscuro */
            .barra-lateral .modo-oscuro {
                width: 100%;
                margin-bottom: 80px;
                border-radius: 10px;
                display: flex;
                justify-content: space-between;
            }

            .barra-lateral .modo-oscuro .info {
                width: 150px;
                height: 45px;
                overflow: hidden;
                display: flex;
                align-items: center;
                color: var(--color-texto-menu);
            }

            .barra-lateral .modo-oscuro ion-icon {

                width: 50px;
                font-size: 20px;
            }
            .barra-lateral .modo-oscuro span {

                width: 50px;
                font-size: 17px;
            }

            /* switch */
            .barra-lateral .modo-oscuro .switch {
                display: flex;
                align-items: center;
                justify-content: center;
                min-width: 50px;
                height: 45px;
                cursor: pointer;
            }

            .barra-lateral .modo-oscuro .base {
                position: relative;
                display: flex;
                align-items: center;
                width: 35px;
                height: 20px;
                background-color: var(--color-switch-base);
                border-radius: 50px;
            }

            .barra-lateral .modo-oscuro .circulo {
                position: absolute;
                width: 18px;
                height: 90%;
                background-color: var(--color-switch-circulo);
                border-radius: 50%;
                left: 2px;
                transition: left 0.5s ease;
            }

            .barra-lateral .modo-oscuro .circulo.prendido {
                left: 15px;
            }

            /*---------------> Usuario*/
            .barra-lateral .usuario {
                width: 100%;
                display: flex;
            }

            .barra-lateral .usuario img {
                width: 50px;
                min-width: 50px;
                border-radius: 10px;
            }

            .barra-lateral .usuario .info-usuario {
                width: 100%;
                display: flex;
                align-items: center;
                justify-content: space-between;
                color: var(--color-texto);
                overflow: hidden;
            }

            .barra-lateral .usuario .nombre-email {
                width: 100%;
                display: flex;
                flex-direction: column;
                margin-left: 5px;
            }

            .barra-lateral .usuario .nombre {
                font-size: 15px;
                font-weight: 600;
            }

            .barra-lateral .usuario .email {
                font-size: 13px;
            }

            .barra-lateral .usuario ion-icon {
                font-size: 20px;
            }

            /* main */
            #inbox {
                background-color: var(--color-menu-hover);
                color: var(--color-menu-hover-texto);
            }

            main {
                margin-left: 280px;
                padding: 20px;
                transition: margin-left 0.5s ease;
            }

            main.min-main {
                margin-left: 110px;
            }

            /* Responsive mode */
            @media (max-height: 660px) {
                .barra-lateral .nombre-pagina {
                    margin-bottom: 5px;
                }

                .barra-lateral .modo-oscuro {
                    margin-bottom: 3px;
                }
            }

            @media (max-width: 600px) {
                .barra-lateral {
                    position: fixed;
                    left: -250px;
                }

                .max-barra-lateral {
                    left: 0;
                }

                .menu {
                    display: flex;
                }

                .menu ion-icon:nth-child(2) {
                    display: none;
                }

                main {
                    margin-left: 0;
                }

                main.min-main {
                    margin-left: 0;
                }
            }
     body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 30px;
            width: 50%;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            padding: 20px;
            background-color: #fff;
        }

        h3 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }

        .form-section {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #495057;
        }

        input,
        select {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 15px;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        </style>
    </head>

    <body>
        <div class="menu">
            <ion-icon name="menu-outline"></ion-icon>
            <ion-icon name="close-outline"></ion-icon>
        </div>

        <div class="barra-lateral">
            <div>
                <div class="nombre-pagina">
                    <ion-icon name="fast-food-outline"></ion-icon>                
                    <span>KEYLA & DIANA</span>
                </div>

            </div>

            <nav class="navegacion">
                <ul>
                    <li>
                        <a id="inbox" href="home">
                            <ion-icon name="home-outline"></ion-icon>
                            <span>Inicio</span>
                        </a>
                    </li>
                    <li>
                        <a href="Venta">
                            <ion-icon name="cash-outline"></ion-icon>
                            <span>Venta</span>
                        </a>
                    </li>
                    <li>
                        <a href="listarArt">
                            <ion-icon name="bar-chart-outline"></ion-icon>
                            <span>Inventario</span>
                        </a>
                    </li>
                    <li>
                        <a href="Consulta8">
                            <ion-icon name="cart-outline"></ion-icon>
                            <span>Producto</span>
                        </a>
                    </li>
                    <li>
                        <a href="Consulta10">
                            <ion-icon name="body-outline"></ion-icon>
                            <span>Clientes</span>
                        </a>
                    </li>
                    <li>
                        <a href="listarEmp">
                            <ion-icon name="person-circle-outline"></ion-icon>
                            <span>Empleados</span>
                        </a>
                    </li>
                </ul>
            </nav>

            <div>
                <div class="linea"></div>

                <div class="modo-oscuro">
                    <div class="info">
                        <ion-icon name="moon-outline"></ion-icon>
                        <span>Modo oscuro</span>
                    </div>
                    <div class="switch">
                        <div class="base">
                            <div class="circulo"></div>
                        </div>
                    </div>
                </div>


            </div>

        </div>


        <main>
  
    <div class="container">
        <div>
            <h3>Nuevo/Editar Articulo</h3>
            <form action="insertarArt" method="post">
                <!-- Sección 1: Información básica -->
                <div class="form-section">
                    <label for="nom">Nombre:</label>
                    <input type="text" id="nom" name="nom" value="${producto.nombre}">
                </div>

                <!-- Sección 2: Descripción y Precio -->
                <div class="form-section">
                    <label for="des">Descripción:</label>
                    <input type="text" id="des" name="des" value="${producto.descripcion}">

                    <label for="pre">Precio:</label>
                    <input type="double" id="pre" name="pre" value="${producto.precio}">
                </div>

                <!-- Sección 3: Foto y Fecha de vencimiento -->
                <div class="form-section">
                    <label for="fot">Foto:</label>
                    <input type="text" id="fot" name="fot" value="${producto.foto}">

                    <label for="ven">Fecha de vencimiento:</label>
                    <input type="date" id="ven" name="ven" value="${producto.fecha_ven}">
                </div>

                <!-- Sección 4: Categoría -->
                <div class="form-section">
                    <label for="idcat">IdCategoria:</label>
                    <select id="idcat" name="idcat" class="form-select form-select-sm">
                        <option></option>
                        <option value="1" ${producto.idcategoria == 1 ? 'selected' : ''}>Lacteos</option>
                        <option value="2" ${producto.idcategoria == 2 ? 'selected' : ''}>Abarrotes</option>
                        <option value="3" ${producto.idcategoria == 3 ? 'selected' : ''}>Gaseosas</option>
                        <option value="4" ${producto.idcategoria == 4 ? 'selected' : ''}>Licores</option>
                        <option value="5" ${producto.idcategoria == 5 ? 'selected' : ''}>Confiteria</option>
                        <option value="6" ${producto.idcategoria == 6 ? 'selected' : ''}>Comida para mascotas</option>
                        <option value="7" ${producto.idcategoria == 7 ? 'selected' : ''}>Limpieza</option>
                        <option value="8" ${producto.idcategoria == 8 ? 'selected' : ''}>Enlatados</option>
                        <option value="9" ${producto.idcategoria == 9 ? 'selected' : ''}>Congelados</option>
                        <option value="10" ${producto.idcategoria == 10 ? 'selected' : ''}>Pan</option>
                        <option value="11" ${producto.idcategoria == 11 ? 'selected' : ''}>Harinas</option>
                        <option value="12" ${producto.idcategoria == 12 ? 'selected' : ''}>Embutidos</option>
                    </select>
                </div>
                    <!-- Sección 5: Cantidad -->
<div class="form-section">
    <label for="cantidad">Cantidad:</label>
    <input type="number" id="cantidad" name="cantidad" value="1" min="1">
</div>

                    

                <!-- Botón de envío -->
                <div class="form-section">
                    <input type="hidden" name="cod" value="${producto.idproducto}">
                    <input type="submit" value="Grabar" class="btn btn-primary">
                </div>
            </form> 
        </div>
    </div>
        </main>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <script src="js/main.js"></script>
        <script> const logo = document.getElementById("logo");
            const barraLateral = document.querySelector(".barra-lateral");
            const spans = document.querySelectorAll("span");
            const palanca = document.querySelector(".switch");
            const circulo = document.querySelector(".circulo");
            const menu = document.querySelector(".menu");
            const main = document.querySelector("main");

            menu.addEventListener("click", () => {
                barraLateral.classList.toggle("max-barra-lateral");
                const isMaxBarraLateral = barraLateral.classList.contains("max-barra-lateral");
                menu.children[0].style.display = isMaxBarraLateral ? "none" : "block";
                menu.children[1].style.display = isMaxBarraLateral ? "block" : "none";

                if (window.innerWidth <= 320) {
                    barraLateral.classList.add("mini-barra-lateral");
                    main.classList.add("min-main");
                    spans.forEach((span) => span.classList.add("oculto"));
                }
            });

            palanca.addEventListener("click", () => {
                document.body.classList.toggle("dark-mode");
                circulo.classList.toggle("prendido");
            });

            logo.addEventListener("click", () => {
                barraLateral.classList.toggle("mini-barra-lateral");
                main.classList.toggle("min-main");
                spans.forEach((span) => span.classList.toggle("oculto"));
            });</script>
    </body>

</html>