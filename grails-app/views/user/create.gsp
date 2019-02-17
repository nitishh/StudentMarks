<%--
  Created by IntelliJ IDEA.
  User: Nitish
  Date: 4/18/2017
  Time: 7:48 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Create User</title>
    <meta name="layout" content="main">
    <meta name="keywords" content="">
</head>

<body>
<h2>Create User</h2>
<g:form action="save">
    <div>
        <g:render template="user_form"></g:render>

        <fieldset class="buttons">
            <g:submitButton  name="Submit" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </fieldset>
    </div>

</g:form>
</body>
</html>