<%--
  Created by IntelliJ IDEA.
  User: prakhar
  Date: 12/4/16
  Time: 3:59 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

<g:if test="{flash.message}">
    <p>${flash.message}</p>
</g:if>

<g:if test="{flash.error}">
    <p>${flash.error}</p>
</g:if>


<table border="1">
    <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
        <th>Update</th>
        <th>Delete</th>
    </tr>
    <g:each in="${userList}">
        <tr>
            <td>${it.firstName}</td>
            <td>${it.lastName}</td>
            <td>${it.email}</td>
            <td><g:link controller="user" action="update" id="${it.id}">Update</g:link></td>
            <td><g:link controller="user" action="delete" id="${it.id}">Delete</g:link></td>
        </tr>
    </g:each>
</table>
</body>
</html>