<!DOCTYPE html>
<html>
<head>
    <title>AirTickets</title>
</head>
<body>
<h1>AirTickets<h1><hr>
<#if user.email??>
    <h3>Имя пользователя: <i>${user.name}</i></h3>
    <form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Выйти">
</form>
    <#if user.isAdmin()>
        <a href="/admin">Панель администратора</a>
    </#if>
<#else>
    <a href="/login">Войти</a><hr>
</#if>
<h4>Дешевые авиабилеты</h4>
<form action="/" method="get">
    Поиск билета по названию авиакомпании: <input type="text" name="title"><br>
    <input type="submit" value="Поиск"/>
</form>
<#list tickets as ticket>
    <div>
        <p><b>${ticket.title}</b> | ${ticket.from_where} -> ${ticket.to_where} | <a href="/ticket/${ticket.id}">Подробнее...</a></p>
    </div>
    <#else>
        <h3>Билетов нет</h3>
</#list>
<hr>
    <#if user.isAdmin()>
        <h3>Добавить новый полет</h3>
        <form action="/ticket/create" method="post" enctype="multipart/form-data">
            Название рейса: <input type="text" name="title"/><br><br>
            Дата рейса: <input type="text" name="date"/><br><br>
            Цена билета: <input type="number" name="price"/><br><br>
            Откуда: <input type="text" name="from_where"/><br><br>
            Куда: <input type="text" name="to_where"/><br><br>
            Добавить первую фотографию: <input type="file", name="file1"><br><br>
            Добавить вторую фотографию: <input type="file", name="file2"><br><br>
            <input type="submit" value="Добавить полет">
        </form>
    </#if>
</body>
</html>