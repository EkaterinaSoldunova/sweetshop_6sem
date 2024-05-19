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
        <a href="/#contacts">Контакты</a>
    </div>
</header>
<body>
    <h1>Авторизация</h1>
    <form action="/login " method="post">
        Эл. почта: <input type="email" name="username"><br><br>
        Пароль: <input type="password" name="password"><br><br>
        <#--    защита приложения, уникальный ключ-->
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button class="btn2" type="submit" style="width: 100px">Войти</button>
    </form>
    <br><br>
    <p>У вас нет аккаунта?</p>
    <a href="/registration" style="text-decoration: underline; font-size: 15px">Зарегистрируйтесь</a>
</body>
</html>


