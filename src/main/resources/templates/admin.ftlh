<!DOCTYPE html>
<html>
<head>
    <title>Кондитерская</title>
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
    <h1>Панель администратора</h1>
    <h2>Список оформленных заказов</h2>
    <table style="width: 100%">
        <tr>
            <th scope="col">Имя пользователя</th>
            <th scope="col">Email пользователя</th>
            <th scope="col">Название товара</th>
            <th scope="col">Цена</th>
            <th scope="col">Дата оформления заказа</th>
            <th scope="col">Активность заказа</th>
            <th scope="col">Изменение активности</th>
        </tr>
        <#list orders as order>
            <tr>
                <th>${order.user.name}</th>
                <th>${order.user.email}</th>
                <th>${order.cake.name}</th>
                <th>${order.cake.price}</th>
                <th>${order.dateOfCreated.dayOfMonth} ${order.dateOfCreated.month} ${order.dateOfCreated.year} ${order.dateOfCreated.hour}:${order.dateOfCreated.minute}</th>
                <th><#if order.active>В процессе<#else>Выполнен</#if></th>
                <th>
                    <form action="/admin/order/active/${order.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <button type="submit" class="btn2">Изменить активность</button>
                    </form>
                </th>
            </tr>
        </#list>
    </table>
    <h2>Список зарегистрированных пользователей</h2>
    <table style="width: 100%">
        <tr>
            <th scope="col">Имя</th>
            <th scope="col">Email</th>
            <th scope="col">Номер телефона</th>
            <th scope="col">Активность</th>
            <th scope="col">Роль</th>
            <th scope="col">Бан</th>
        </tr>
        <#list users as user>
            <tr>
                <th>${user.name}</th>
                <th>${user.email}</th>
                <th>${user.phoneNumber}</th>
                <th><#if user.active>true<#else>false</#if></th>
                <th><#list user.roles as role>${role}</#list></th>
                <th>
                    <form action="/admin/user/ban/${user.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <button type="submit" class="btn2">Бан</button>
                    </form>
                </th>
            </tr>
        <#else>
            <h3>Пользователей нет</h3>
        </#list>
    </table>
</body>
</html>