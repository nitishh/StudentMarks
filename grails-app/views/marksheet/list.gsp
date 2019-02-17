
<%@ page import="studentmarks.Marksheet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'marksheet.label', default: 'Marksheet')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-marksheet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		%{--<div class="nav" role="navigation">--}%
			%{--<ul>--}%
				%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			%{--</ul>--}%
		%{--</div>--}%
    <h1><g:message code="default.list.label" args="[entityName]" />
        <span style="float: right; margin-right: 5px;"><g:link action="create">Create</g:link></span>
    </h1>
    <div style="float: left; width: 500px;">
        <g:form action="marksheet_gen">
            <div class="fieldcontain required">
                <label for="marksheet">
                    <g:message code="marksheet.batch.label" default="Batch" />
                    <span class="required-indicator">*</span>
                </label>
                <g:textField name="marksheet" required=""/>
                <g:submitButton name="Submit"></g:submitButton>
            </div>
        </g:form>
    </div>
    
		<div id="list-marksheet" class="content scaffold-list" role="main">

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}

            </div>
			</g:if>
			<table>
				<thead>
					<tr>
					    <th>S.N </th>
                        <g:sortableColumn property="marks" title="${message(code: 'marksheet.marks.label', default: 'Marks')}" />
						<th><g:message code="marksheet.sj.label" default="Sj" /></th>
						<th><g:message code="marksheet.st.label" default="Student Name" /></th>
                        <th colspan="2">Action</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${marksheetInstanceList}" status="i" var="marksheetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					    <td>${i + 1}</td>
						%{--<td><g:link action="show" id="${marksheetInstance.id}">${fieldValue(bean: marksheetInstance, field: "marks")}--}%
                        %{--</g:link></td>--}%
					    <td>${marksheetInstance.marks}</td>
						<td>${marksheetInstance.sj.name}</td>
						<td>${marksheetInstance.st.name}</td>
                        <td><g:link action="edit" id="${marksheetInstance.id}">Edit</g:link></td>
                        <td><g:link action="delete2" id="${marksheetInstance.id}" onclick="return confirm('Are you sure?')">Delete</g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${marksheetInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
