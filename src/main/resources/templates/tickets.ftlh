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
</nav>
<hr>
<div class="tool_wrapper" style="display: flex;flex-direction: row;justify-content: space-between; align-items: center;">
    <#if user.email??>
        <h3 style="margin: 5px 5px;">Имя пользователя: <span style="color:#02a2f7;"><i>${user.name}</i></span></h3>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Выйти" class="btn btn-primary" role="button">
            <a href="/user/${user.id}" class="btn btn-primary">Профиль пользователя</a>
        </form>
    <#else>
        <a href="/login" class="btn btn-primary" role="button" style="margin: 5px 5px;">Войти</a>
    </#if>
    <#if user.isAdmin()>
            <a href="/admin" class="btn btn-primary" role="button">Панель администратора</a>
    </#if>
    <div class="search" style="display: flex; flex-direction: row;">
        <div class="navbar navbar-light bg-light">
            <form action="/" method="get" class="form-inline">
                <input type="text" name="title" class="form-control mr-sm-2" placeholder="Поиск билетов" aria-label="Search" style="margin: 5px 5px;">
            </form>
        </div>
    </div>
</div>
<hr>
<div class="INNER" style="width: auto; height: 150px; background: linear-gradient(to top left, powderblue, #02a2f7); display: flex; justify-content: center; align-items: center;">
    <div style="color: white; font-size: 40px; font-family: 'Roboto Thin';">Путешествуй вместе с нами!</div>
</div>
<hr>
<div class="ticket_wrapper" style="display:flex; flex-direction: row; justify-content: center;">
<#list tickets as ticket>
    <div class="card" style="width: 18rem;margin:15px 5px;">
        <div class="card-body">
            <h5 class="card-title"><b>${ticket.title}</b></h5>
            <p class="card-text">${ticket.from_where}  <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-arrow-left-right" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M1 11.5a.5.5 0 0 0 .5.5h11.793l-3.147 3.146a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 11H1.5a.5.5 0 0 0-.5.5zm14-7a.5.5 0 0 1-.5.5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H14.5a.5.5 0 0 1 .5.5z"/>
                </svg>   ${ticket.to_where}
            </p>
            <hr>
            <a href="/ticket/${ticket.id}" class="btn btn-primary stretched-link">Подробнее...</a>
        </div>
    </div>
    <#else>
        <h3>Билетов нет</h3>
</#list>
</div>
<hr>
</body>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script></script>
</html>