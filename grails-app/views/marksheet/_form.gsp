<%@ page import="studentmarks.Marksheet" %>



<div class="fieldcontain ${hasErrors(bean: marksheetInstance, field: 'marks', 'error')} required">
	<label for="marks">
		<g:message code="marksheet.marks.label" default="Marks" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="marks" type="number" min="0" value="${marksheetInstance.marks}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: marksheetInstance, field: 'sj', 'error')} required">
	<label for="sj">
		<g:message code="marksheet.sj.label" default="Sj" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sj" name="sj.id"
              from="${studentmarks.Subject.list()}"
              optionKey="id" required=""
              value="${marksheetInstance?.sj?.id}"
              optionValue="name"
              class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: marksheetInstance, field: 'st', 'error')} required">
	<label for="st">
		<g:message code="marksheet.st.label" default="St" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="st" name="st.id"
              from="${studentmarks.Student.list()}"
              optionKey="id" required=""
              value="${marksheetInstance?.st?.id}"
              optionValue="name"
              class="many-to-one"/>
</div>

