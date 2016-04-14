<%--
  Created by IntelliJ IDEA.
  User: prakhar
  Date: 12/4/16
  Time: 3:48 PM
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


<g:form controller="user" action="save">
    <table>
        <tr>
            <th>Firstname:</th>
            <th><g:textField name="firstName"/></th>
        </tr>
        <tr>
            <th>Lastname:</th>
            <th><g:textField name="lastName"/></th>
        </tr>
        <tr>
            <th>Email:</th>
            <th><g:textField name="email"/></th>
        </tr>
        <tr>
            <th>Password:</th>
            <th><g:passwordField name="password"/></th>
        </tr>
        <tr>
            <th></th>
            <th><g:submitButton name="Submit"/></th>
        </tr>
    </table>
</g:form>
</body>
</html>