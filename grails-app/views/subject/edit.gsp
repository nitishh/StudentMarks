<%--
  Created by IntelliJ IDEA.
  User: Nitish
  Date: 4/18/2017
  Time: 9:04 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add Subject</title>
    <meta name="layout" content="main">
    <meta name="keywords" content="">
</head>

<body>
<g:form action="update">
    <g:hiddenField name="id" value="${subinfo.id}"></g:hiddenField>
    <g:render template="subject_form"></g:render>
    <fieldset class="buttons">
        <g:submitButton name="Update" class="save" value="${message(code: 'default.button.update.label', default: 'Update')}" />
    </fieldset>
</g:form>
</body>
</html>