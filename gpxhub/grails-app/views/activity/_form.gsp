<%@ page import="com.gpxhub.Activity" %>



<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="activity.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${activityInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="activity.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="300" value="${activityInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'when', 'error')} ">
	<label for="when">
		<g:message code="activity.when.label" default="When" />
		
	</label>
	<g:datePicker name="when" precision="day"  value="${activityInstance?.when}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'gpx', 'error')} ">
	<label for="gpx">
		<g:message code="activity.gpx.label" default="Gpx" />
		
	</label>
	<g:textArea name="gpx" cols="40" rows="5" maxlength="2048" value="${activityInstance?.gpx}"/>
</div>

