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
<div class="admin page" style="display: flex; justify-content: center;">
<div class="admin panel">
<h4>Панель администратора</h4>
<table class="table table-bordered border-primary">
    <tr>
        <th>Email</th>
        <th>Номер телефона</th>
        <th>Активность</th>
        <th>Роли</th>
        <th>Бан</th>
        <th>Редактирование</th>
    </tr>
    <#list users as user>
        <tr>
            <th>${user.email}</th>
            <th>${user.phoneNumber}</th>
            <th><#if user.active>true<#else>false</#if></th>
            <th><#list user.roles as role>${role }</#list></th>
            <th>
                <form action="/admin/user/ban/${user.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Бан" class="btn btn-primary">
                </form>
            </th>
            <th><a href="/admin/user/edit/${user.id}" class="btn btn-primary">Редактировние роли</a></th>
        </tr>
    <#else>
        <h3>Пользователей нет</h3>
    </#list>
</table>
</div>
</div>
<hr>
<div class="add_ticket" style="margin: 15px; display: flex; justify-content: center;">
    <div class="admin_wrapper">
    <h3>Добавить новый полет</h3>
    <form action="/admin/ticket/create" method="post">
        <div class="form-group">
            <label for="exampleInputEmail1">Название рейса:</label>
            <input type="text" name="title" class="form-control" id="exampleInputEmail1">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Дата рейса:</label>
            <input type="text" name="date" class="form-control" id="exampleInputEmail1">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Цена билета:</label>
            <input type="number" name="price" class="form-control" id="exampleInputEmail1">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Откуда:</label>
            <input type="text" name="from_where" class="form-control" id="exampleInputEmail1">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Куда:</label>
            <input type="text" name="to_where" class="form-control" id="exampleInputEmail1">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Добавить полет" class="btn btn-primary">
    </form>
    </div>
</div>
</body>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script></script>
</html>