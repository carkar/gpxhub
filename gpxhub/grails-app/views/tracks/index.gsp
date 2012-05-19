<%@ page import="org.joda.time.format.PeriodFormat; org.joda.time.DateTime" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <meta charset="utf-8">
    <title>Tracks</title>
    <r:require module="core"/>

</head>
<body>
<div class="page-header">
<h1>Your tracks. <small>Blood, sweat and hard work in tabular form.</small>
    <g:link controller="upload" style="float: right" class="btn btn-primary" href="#"><i class="icon-upload icon-white"></i> Upload activities</g:link>
</div>
<div class="row">
    <div class="span10">
        <g:if test='${flash.message}'>
            <div class="alert alert-success">
                <a class="close" data-dismiss="alert">×</a>
                ${flash.message}
            </div>
        </g:if>

        <p class="lead">On top of the scaffolding, basic HTML elements are styled and enhanced with extensible classes to provide a fresh, consistent look and feel.</p>

        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Name</th>
                <th>Distance</th>
                <th>Duration</th>
                <th>&nbsp;</th>
            </tr>
            </thead>
            <tbody>

            <g:each in="${activities}" var="activity">
                <tr>
                    <td>
                        <h4><g:link action="view" controller="tracks" id="${activity.id}"> <joda:format value="${new DateTime(activity.when)}" pattern="yyyy-MM-dd"/> ${activity.name}</g:link></h4>


                    </td>

                    <td width="80">${activity.distance}km</td>
                    <td width="80"><gpx:duration value="${activity.getDurationPeriod()}"/></td>
                    <td width="95">

                            <div class="btn-group" style="float:right">
                                <a class="btn btn-small" href="#"><i class="icon-star-empty"></i> Action</a>
                                <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#"><i class="icon-pencil"></i> Edit</a></li>
                                    <li><g:link action="delete" id="${activity.id}"><i class="icon-trash"></i> Delete</g:link></li>
                                </ul>
                            </div>

                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination" style="float:right">
            <ul>
                <li class="disabled"><a href="#">«</a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">»</a></li>
            </ul>
        </div>

        <g:paginate fragment="" total="${activitiesCount}"/>

    </div>

    <div class="row">
        <div class="span4">
            <h2>Runkeeper?</h2>
            <p class="lead">Easy import of activities from runkeeper. Learn more.</p>
        </div>
        <div class="span4">
            <h2>Need help?</h2>
            <p class="lead">There is no help. No email, no support, nothing. Nada. Sorry.</p>
        </div>
    </div>
</div>
</body>
</html>
