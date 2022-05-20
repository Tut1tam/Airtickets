<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <title>AirTickets</title>
</head>
<body>
<nav class="navbar navbar-light bg-light" style="display: flex; flex-direction: row;">
    <a class="navbar-brand" href="/">
        <div class="logo" style="margin: 5px 20px; display: flex; flex-direction: row;">
            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
                <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>
            </svg>
            <div>Air<span style="color:#02a2f7;">Tickets</span></div>
        </div>
    </a>
    </div>
</nav>
<hr>
<div class="INNER" style="width: auto; height: 150px; background: linear-gradient(to top left, powderblue, #02a2f7); display: flex; justify-content: center; align-items: center;">
    <div style="color: white; font-size: 40px; font-family: 'Roboto Thin';">Путешествуй вместе с нами!</div>
</div>
<hr>
<div class="inner" style="display: flex; flex-direction: row; justify-content: center">
    <div class="wrapper">
        <h4>Подробная информация о полете</h4>
        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">Название авиакомпании: <span style="color:#02a2f7;">${ticket.title}</span></h5>
                <p class="card-text">
                    <b>Дата полета: </b>${ticket.date}<br>
                    <b>Цена билета: </b>${ticket.price}РУБ<br>
                    <b>Откуда: </b>${ticket.from_where}<br>
                    <b>Куда: </b>${ticket.to_where}<br>
                </p>
            </div>
        </div>
        <#if user.isAdmin()>
        <form action="/admin/ticket/delete/${ticket.id}" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Удалить рейс" class="btn btn-primary" style="margin: 5px 5px;">
        </form>
        </#if>
        </div>
    </div>
</body>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script></script>
</html>