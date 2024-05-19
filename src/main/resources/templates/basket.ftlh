<!DOCTYPE html>
<html>
<head>
    <title>Корзина</title>
    <link rel="stylesheet" href="/static/style.css">
</head>
<header>
    <img src="/static/logo.png" class="logo">
    <div class="menu">
        <a href="/">Главная</a>
        <a href="/#cakes">Десерты</a>
        <#if user.email??>
            <a href="/basket/${user.id}">Корзина</a>
        </#if>
        <#if user.email??>
            <#if user.isAdmin()>
                <a href="/admin">Панель администратора</a>
            </#if>
        </#if>
        <a href="/#contacts">Контакты</a>
    </div>
    <#if user.email??>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button class="btn1" type="submit" style="width: 100px">Выйти</button>
        </form>
    <#else>
        <form action="/login" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button class="btn1" type="submit" style="width: 100px">Войти</button>
        </form>
    </#if>
</header>
<body>
<div style="display: flex; flex-direction: row-reverse;">
    <#if user.email??>
        <p>Имя пользователя: ${user.name}</p>
    </#if>
</div>
<h1>Корзина</h1>
<#list basket as basket>
    <div class="cakeBasket">
        <p>${basket.cake.name} ${basket.cake.price} руб.</p>
        <form action="/basket/${user.id}/delete/${basket.id}" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button class="btn2" type="submit">Удалить из корзины</button>
        </form>
        <br>
    </div>
    <#else>
    <p>Корзина пуста</p>
</#list>
<br><br><br>
<form action="/basket/${user.id}/deleteAll" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button class="btn1" type="submit">Оформить заказ</button>
</form>
</body>
</html>