<!DOCTYPE html>
<html>
<head>
    <title>Кондитерская</title>
    <style>
        *{
            background-color: black;
            color: white;
        }
        button {
            background-color: darksalmon;
            border-radius: 20px;
            color: black;
            font-size: 13px;
            height: 30px;
            font-weight: bold;
        }
        .cake {
            display: flex;
            flex-direction: row;

        }
        .formButton{
            display: flex;
            justify-content: center;
            align-content: center;
        }
        .basket{
            color: darksalmon;
            font-size: 20px;
        }
    </style>
</head>
<header>
    <a class="basket" href="/basket">Корзина</a>
</header>
<body>
<h1>Кондитерская</h1>
<h2>Список десертов</h2>
<#list cakes as cake>
    <div class="cake">
        <p> ${cake.name} ${cake.price} руб. </p>
        <form class="formButton" action="/basket/add?cakeName=${cake.name}&cakePrice=${cake.price}" method="post">
            <button class="btnAdd" type="submit">Добавить в корзину</button>
        </form>
    </div>
</#list>
</body>
</html>