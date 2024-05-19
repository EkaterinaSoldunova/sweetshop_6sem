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
        <a href="#contacts">Контакты</a>
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
    <h1>Кондитерская</h1>
    <div style="display: flex; flex-direction: row">
        <img src="/static/cakeshop.jpg" style="height: 350px; border-radius: 5px">
        <div style="display: flex; justify-content: center; align-content: center;">
            <p style="width: 80%; font-size: 18px">Добро пожаловать в нашу кондитерскую! <br><br>
                У нас вы найдёте торты, пирожные, печенье, кексы и другие сладости на любой вкус.
                Мы используем только самые свежие ингредиенты от проверенных поставщиков.
                Наша команда кондитеров вкладывает душу в каждое изделие, поэтому все десерты получаются такими вкусными и красивыми.
                <br><br> Закажите у нас торт на день рождения, свадьбу или другой праздник, и мы сделаем всё возможное, чтобы он стал настоящим украшением вашего стола.
            </p>
        </div>
    </div>
    <h2 id="cakes">Список десертов</h2>
    <div class="listCakes">
        <#list cakes as cake>
            <div class="cake" style="background-color: wheat">
                <p style="background-color: wheat"> ${cake.id} ${cake.name}</p>
                <div style="background-color: wheat">
                    <p style="background-color: wheat">Цена: ${cake.price} руб.</p>
                    <p style="background-color: wheat">В наличие ${cake.being} шт.</p>
                </div>
                <div style="display: flex; flex-direction: row; justify-content: space-between; background-color: wheat">
                    <#if user.email??>
                        <form action="/basket/${user.id}/add/${cake.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button class="btn2" type="submit">Добавить в корзину</button>
                        </form>
                    </#if>
                    <#if user.isAdmin()>
                        <form action="/cake/delete/${cake.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button class="btn2" type="submit">Удалить товар</button>
                        </form>
                    </#if>
                </div>
            </div>
        </#list>
    </div>
    <div style="display: flex; flex-direction: column; ">
        <#if user.isAdmin()>
            <div>
                <h2>Добавить товар</h2>
                <form action="/cake/create" method="post">
                    Название: <input type="text" name="name"/><br><br>
                    Цена товара: <input type="text" name="price"/><br><br>
                    Наличие (шт.) <input type="text" name="being"/><br><br>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit" class="btn2">Добавить товар</button>
                </form>
            </div>
            <div>
                <h2>Обновить данные о товаре</h2>
                <form action="/cake/update" method="post">
                    ID: <input type="text" name="id"/><br><br>
                    Название: <input type="text" name="name"/><br><br>
                    Цена товара: <input type="text" name="price"/><br><br>
                    Наличие (шт.) <input type="text" name="being"/><br><br>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit" class="btn2">Обновить товар</button>
                </form>
            </div>
        </#if>
    </div>
</body>
<footer id="contacts">
    <h2>Контакты</h2>
    <p>Адрес: г. Москва, ул. Студенческая, 1</p>
    <p>Телефон: +7 777 777 77 77</p>
    <p>WhatsApp: +7 777 777 77 77</p>
    <p>Почта: cakeshop@mail.ru</p>
</footer>
</html>