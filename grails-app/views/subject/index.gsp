<%--
  Created by IntelliJ IDEA.
  User: Nitish
  Date: 4/18/2017
  Time: 9:10 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Subject List</title>
    <meta name="layout" content="main">
</head>

<body>
<h1>Subject List
    <g:each in="${session.user_type}" var="type">
        <g:if test="${type == 'admin'}">
            <span style="float: right; margin-right: 5px;"><g:link controller="subject" action="create">Create</g:link></span>
        </g:if>
    </g:each>
</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}

        </div>
    </g:if>
<div style="float: right;margin:5px;">
    <g:form action="submit">
        <g:textField name="keyword" value="${params.keyword}" placeholder="Add Keywords to Search"></g:textField>
        <g:submitButton name="Submit" value="Submit"></g:submitButton>
    </g:form>
</div>
    <table>
        <thead>
            <tr>
                <th>S.N</th>
                <th>Name</th>
                <th>Marks</th>
                <g:each in="${session.user_type}" var="type">
                    <g:if test="${type == 'admin'}">
                        <th colspan="2">Action</th>
                    </g:if>
                </g:each>
            </tr>
        </thead>
        <tbody>
        <g:each in="${ulist}" var="${sub}" status="i">
            <tr>
                <td>${i+1}</td>
                <td>${sub.name}</td>
                <td>${sub.total_mark}</td>
                <g:each in="${session.user_type}" var="type">
                    <g:if test="${type == 'admin'}">
                        <td><g:link action="edit" id="${sub.id}">Edit</g:link></td>
                        <td><g:link action="delete" id="${sub.id}" onclick="return confirm('Are you sure?')">Delete</g:link></td>
                    </g:if>
                </g:each>
            </tr>
        </g:each>
        </tbody>
    </table>
<div class="pagination">
    <g:paginate total="${totalrecord}" params="${params}"></g:paginate>
</div>
</body>
</html>