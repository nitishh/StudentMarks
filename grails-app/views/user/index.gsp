<%--
  Created by IntelliJ IDEA.
  User: Nitish
  Date: 4/18/2017
  Time: 7:59 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">
</head>

<body>
<h1>User List
    <g:each in="${session.user_type}" var="type">
        <g:if test="${type == 'admin'}">
            <span style="float: right; margin-right: 5px;"><g:link controller="user" action="create">Create</g:link></span>
        </g:if>
    </g:each>
</h1>
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}

    </div>
</g:if>
<div style="float: right;margin:5px;">
    <g:form action="search">
        <g:textField name="keyword" value="${params.keyword}" placeholder="Add Keyword to Search"></g:textField>
        <g:submitButton name="btn" value="Search"></g:submitButton>
    </g:form>
</div>

<table>
    <thead>
        <tr>
            <th>SN</th>
            <th>User Name</th>
            <th>Type</th>
            <g:each in="${session.user_type}" var="type">
                <g:if test="${type == 'admin'}">
                    <th colspan="2">Action</th>
                </g:if>
            </g:each>

        </tr>
    </thead>
    <tbody>
        <g:each in="${ulist}" var="${list}" status="i">
            <tr>
                <td>${i+1}</td>
                <td>${list.username}</td>
                <td>${list.user_type}</td>
                %{--id is created self by grails. So we don't need to add in domain user--}%
                <g:each in="${session.user_type}" var="type">
                    <g:if test="${type == 'admin'}">
                        <td><g:link action="edit" id="${list.id}">Edit</g:link> </td>
                        <td><g:link action="delete" onclick="return confirm('Are you sure?')" id="${list.id}">Delete</g:link> </td>
                    </g:if>
                </g:each>
            </tr>
        </g:each>
    </tbody>
</table>
<div class="pagination">
       <g:paginate total="${totalrecord}"  params="${params}"></g:paginate>
</div>
</body>
</html>