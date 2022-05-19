<!DOCTYPE html>
<html>
<head>
    <title>AirTickets</title>
</head>
<body>
<h1>AirTickets</h1><hr>
<h4>Подробная информация о полете</h4>
<b>Название авиакомпании: </b>${ticket.title}<br>
<b>Дата полета: </b>${ticket.date}<br>
<b>Цена билета: </b>${ticket.price}РУБ<br>
<b>Откуда: </b>${ticket.from_where}<br>
<b>Куда: </b>${ticket.to_where}<br>
<hr>
<h3>Добавить новый полет</h3>
<form action="/ticket/delete/${ticket.id}" method="post">
    <input type="submit" value="Удалить рейс">
</form>
</body>
</html>