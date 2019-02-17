<%--
  Created by IntelliJ IDEA.
  User: Nitish
  Date: 4/18/2017
  Time: 8:08 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add Students</title>
    <meta name="layout" content="main">
    <meta name="keywords" content="">
</head>

<body>
<g:form action="update" enctype="multipart/form-data">
    <g:hiddenField name="id" value="${studlist.id}"></g:hiddenField>
    <g:hiddenField type="file" name="hiddenImage" value="${studlist.image}"></g:hiddenField>
    <g:render template="student_form"></g:render>
    <div>
        <fieldset class="buttons">
            <g:submitButton  name="Update" class="save" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        </fieldset>
    </div>
</g:form>

</body>
</html>