
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <meta charset="utf-8">
    <title>Gpx Hub</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <r:require module="core"/>
    <r:script type="text/javascript">

        var marker;
        var route;


        function moveToStep(themarker,yourroute, c) {
        console.log("Track: " + c)
            if (yourroute.length > c) {
                var newPos = yourroute[c]
                console.log(newPos)
                marker.setPosition(newPos);
                window.setTimeout(function(){
                    moveToStep(themarker,yourroute,c+1);
                },200);
            }
        }



        function initialize() {
            var myLatLng = new google.maps.LatLng(${gpx.getTrackCenter().lat}, ${gpx.getTrackCenter().lon});
            var myOptions = {
                zoom: 12,
                center: myLatLng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

            routeCoordinates = [
                //new google.maps.LatLng(37.772323, -122.214897),
                <g:each in="${gpx.points}" var="p" status="i">
                    new google.maps.LatLng(${p.lat}, ${p.lon})<g:if test="${i < gpx.points.size()-1}">,</g:if>
                </g:each>
            ];

            route = new google.maps.Polyline({
                path: routeCoordinates,
                strokeColor: "#FF0000",
                strokeOpacity: 0.4,
                strokeWeight: 3
            });

            var myLatlng = routeCoordinates[0];
            marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title:"Hello World!"
            });

            route.setMap(map);
        }

        $(document).ready(function() {
           initialize()
           moveToStep(marker,routeCoordinates,0);
        });
    </r:script>
</head>
<body>

<g:link action="index" class="btn btn-toolbar" href="#"><i class="icon-arrow-left"></i> Back</g:link>

<div class="page-header">
    <h1>${activity.name}. <small>Yikes.</small></h1>


</div>

<div class="row">
    <div class="span10">


        <div style="height: 500px;width: 100%" id="map_canvas"></div>


    </div>
    <div class="span2">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>#</th>
                <th>Pace</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>4:55 m/km</td>
            </tr>
            <tr>
                <td>2</td>
                <td>4:55 m/km</td>
            </tr>
            <tr>
                <td>3</td>
                <td>4:55 m/km</td>
            </tr>
            <tr>
                <td>4</td>
                <td>4:55 m/km</td>
            </tr>

            </tbody>
        </table>
    </div>
</div>
<div class="row">
    <div class="span12">
        <br>
        <p class="lead">On top of the scaffolding, basic HTML elements are styled and enhanced with extensible classes to provide a fresh, consistent look and feel.</p>
    </div>
</div>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
</body>
</html>
