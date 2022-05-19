<!DOCTYPE html>
<html>
<head>
    <title>AirTickets</title>
</head>
<body>
<h1>AirTickets</h1><hr>
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
<h3>Добавить новый полет</h3>
<form action="/ticket/create" method="post">
    Название рейса: <input type="text" name="title"/><br><br>
    Дата рейса: <input type="text" name="date"/><br><br>
    Цена билета: <input type="number" name="price"/><br><br>
    Откуда: <input type="text" name="from_where"/><br><br>
    Куда: <input type="text" name="to_where"/><br><br>
    <input type="submit" value="Добавить полет">
</form>
</body>
</html>