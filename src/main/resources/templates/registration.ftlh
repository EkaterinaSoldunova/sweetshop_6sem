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
    <h1>Регистрация</h1>
    <form action="/registration " method="post">
        Имя пользователя: <input type="text" name="name"><br><br>
        Эл. почта: <input type="email" name="email"><br><br>
        Номер телефона: <input type="text" name="phoneNumber"><br><br>
        Пароль: <input type="password" name="password"><br><br>
    <#--    защита приложения, уникальный ключ-->
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button class="btn2" type="submit">Зарегистрироваться</button>
    </form>
    <#if errorMessage??>
        <h2 style="color: red">${errorMessage}</h2>
    </#if>
</body>
</html>


