
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="http://kit.fontawesome.com/c9f5871d83.js" crossorigin="anonymous"></script>
    <style>
        @import url('http://fonts.googleapis.com/css2?family=Poppins&display=swap');
        *
        {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        .background
        {
            width: 100%;
            height: 100vh;
            background-image: url('https://tunegociobonito.com/wp-content/uploads/2020/10/decorar-tienda-abarrotes-2.jpg.webp');
            background-position: center;
            background-size: cover;
        }
        .home{
            position: absolute;
            top: 50%;
            left: 50%;
            width: 75%;
            height: 75%;
            transform: translate(-50% , -50%);
            background-image: url('https://tunegociobonito.com/wp-content/uploads/2020/10/decorar-tienda-abarrotes-2.jpg.webp');
            background-position: center;
            background-size: cover;
            display: flex;
            margin-top: 10px;
            border: 1px solid black;
            border-radius: 10px;
            border: none;
        }
        .content{
            justify-content: center;
            align-content: center;
            display: flex;
            flex-direction: column;
            width: 700px;
            padding: 100px 0;
        }
        .content a{
            position: relative;
            margin-left: 70px;
            text-decoration: none;
            color: #fff;
            font-size: 4em;
            font-weight: 700;
            top: -40px;
            left: 80px;
        }
        .content h1{
            font-size: 5em;
            text-align: center;
            color: #fff;
        }
        .content h2{
            font-size: 4em;
            text-align: center;
            color: #fff;
        }
        .login, .modal-content {
            width: 450px;
            margin: 150px auto; /* Centrar verticalmente ajustando el margen superior */
            height: 70%;
            position: relative;
            padding: 50px 30px; /* Ajusta el espacio vertical */
            backdrop-filter: blur(10px);
            display: flex;
            flex-direction: column;
            align-items: center; /* Añadido para centrar el contenido */
            color: #fff; /* Cambia el color del texto a blanco */
        }
        .login .container, .modal-content .container {
            width: 100%;
            margin-bottom: 20px; /* Ajusta el espacio vertical */
            text-align: center; /* Centra el texto */
        }
        .login .input1, .modal-content .input1 {
            font-size: 16px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: transparent;
            border: none;
            outline: none;
            border-bottom: 2px solid #fff;
            color: #fff;
            width: 100%;
            height: 100%;
        }
        .login .button, .modal-content .button {
            width: 100%;
            height: 40px;
            margin-bottom: 15px;
        }
        button, .btn {
            width: 100%;
            height: 40px;
            background-color: rgba(43, 174, 168, 1);
            border: none;
            outline: none;
            font-size: 20px;
            font-weight: 700;
            border-radius: 7px;
            color: #fff;
        }
        button:active, .btn:active {
            font-size: 25px;
        }
    </style>
</head>
<body>
    <div class="background"></div>
    <section class="home">
        <div class="content">
            <h2>Bienvenido a la tienda</h2>
            <h1>"Diana y Keyla"</h1>
        </div>
        <%
        String msg=(String)request.getAttribute("msg");
        %>
        <form class="login modal-content animate" action="login" method="post">
            <div class="container">
                <label for="uname"><b>USUARIO</b></label>
                <input type="text" name="us" class="input1" placeholder="Usuario" required>
            </div>
            <div class="container">
                <label for="psw"><b>CONTRASEÑA</b></label>
                <input type="password" name="ps" class="input1" placeholder="Contraseña" required>
            </div>
            <div class="container">
                <button type="submit" class="btn">Login</button>
                <label id="msg"><%=msg!=null?msg:"" %> </label>
            </div>
        </form>
    </section>
</body>
</html>




            
