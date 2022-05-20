<!DOCTYPE html>
<html>
<head>
    <title>AirTickets</title>
</head>
<body>
<h1>AirTickets</h1><hr>
<h4>Панель администратора</h4>
<table border="1">
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
                    <input type="submit" value="Бан">
                </form>
            </th>
            <th><a href="/admin/user/edit/${user.id}">Редактировние роли</a></th>
        </tr>
    <#else>
        <h3>Пользователей нет</h3>
    </#list>
</table>
<hr>
<h3>Добавить новый полет</h3>
<form action="/admin/ticket/create" method="post">
    Название рейса: <input type="text" name="title"/><br><br>
    Дата рейса: <input type="text" name="date"/><br><br>
    Цена билета: <input type="number" name="price"/><br><br>
    Откуда: <input type="text" name="from_where"/><br><br>
    Куда: <input type="text" name="to_where"/><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Добавить полет">
</form>
</body>
</html>