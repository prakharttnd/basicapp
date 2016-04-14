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

    <table id="example" width="100%" class="table table-bordered table-striped table-hover">
        <thead>
        <tr>
            <th>Id</th>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Email</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        </thead>
    </table>
</div>
<script>
    $(document).ready(function () {
        var table = $("#example").DataTable({
            "processing": true,
            "serverSide": true,
            "ajax": {
                "url": "/user/fetchUsers",
                "type": "post"
            },
            "columns": [
                {"data": "id"},
                {"data": "firstName"},
                {"data": "lastName"},
                {"data": "email"},
                {"data": "id"},
                {"data": "id"}
            ]
        });
    });
</script>
</body>

</html>