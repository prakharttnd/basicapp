<%--
  Created by IntelliJ IDEA.
  User: prakhar
  Date: 12/4/16
  Time: 4:58 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css"/>
    <script src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
    <asset:stylesheet href="bootstrap.min.css"/>
    <asset:javascript src="bootstrap.min.js"/>
</head>

<body>

<div class="container">

    <g:if test="${flash.message}">
        <div class="alert alert-success">${flash.message}</div>
    </g:if>

    <g:if test="${flash.error}">
        <div class="alert alert-danger">${flash.error}</div>
    </g:if>

    <table id="example" width="100%" class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>Id</th>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Email</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${userList}">
            <tr>
                <td>${it.id}</td>
                <td>${it.firstName}</td>
                <td>${it.lastName}</td>
                <td>${it.email}</td>
                <td><g:link controller="user" action="update" id="${it.id}">Update</g:link></td>
                <td><g:link controller="user" action="delete" id="${it.id}">Delete</g:link></td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
<script>
    $(document).ready(function () {
        var table = $("#example").DataTable();
    });
</script>
</body>

</html>