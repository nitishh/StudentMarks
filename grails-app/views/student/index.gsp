<%--
  Created by IntelliJ IDEA.
  User: Nitish
  Date: 4/18/2017
  Time: 8:23 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Students List</title>
    <meta name="layout" content="main">
    <meta name="keywords" content="">
</head>

<body>
    <h1>Student List
        <g:each in="${session.user_type}" var="type">
            <g:if test="${type == 'admin'}">
                <span style="float: right; margin-right: 5px;"><g:link controller="student" action="create">Create</g:link> </span>
            </g:if>
        </g:each>
    </h1>
<g:if  test="${flash.message}">
    <div class="message" role="status">${flash.message}

    </div>
</g:if>
<div style="float: right; margin: 5px;">
    <g:form action="search">
        <g:textField name="keyword" placeholder="Add keyword for Search" value="${params.keyword}"></g:textField>
        <g:submitButton name="btn" value="Submit"></g:submitButton>
    </g:form>
</div>

    <table>
        <thead>
            <tr>
                <th>SN</th>
                <th>Name</th>
                <th>Address</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Roll No</th>
                <th>Batch</th>
                <th>Image</th>
                <g:each in="${session.user_type}" var="type">
                    <g:if test="${type == 'admin'}">
                        <th colspan="2">Action</th>
                    </g:if>
                </g:each>
            </tr>
        </thead>
        <tbody>
            <g:each in="${ulist}" var="${stud}" status="i">
                <tr>
                    <td>${i+1}</td>
                    <td>${stud.name}</td>
                    <td>${stud.address}</td>
                    <td>${stud.email}</td>
                    <td>${stud.phone}</td>
                    <td>${stud.roll}</td>
                    <td>${stud.batch}</td>
                    <td><g:if test="${stud.image}">
                        <g:img dir="images/student/${stud.batch}" file="${stud.image}" width="100"></g:img>
                    </g:if>

                       </td>
                    <g:each in="${session.user_type}" var="type">
                        <g:if test="${type == 'admin'}">
                            <td><g:link action="edit" id="${stud.id}">Edit</g:link></td>
                            <td><g:link action="delete" id="${stud.id}" onclick="return confirm('Are you sure?')">Delete</g:link></td>
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