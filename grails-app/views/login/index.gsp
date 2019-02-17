<%--
  Created by IntelliJ IDEA.
  User: Nitish
  Date: 4/25/2017
  Time: 8:25 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>User Login</title>
    <meta name="layout" content="main">
</head>

<body>
<div>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}

        </div>
    </g:if>
    <g:form action="postLogin">
        <table>
            <tr>
                <td>UserName:</td>
                <td><g:textField name="username"></g:textField></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><g:passwordField name="password"></g:passwordField></td>
            </tr>
            <tr>
                <td><g:submitButton name="submit" value="Login"></g:submitButton> </td>
            </tr>
        </table>
    </g:form>

</div>
</body>
</html>