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
</body>
</html>