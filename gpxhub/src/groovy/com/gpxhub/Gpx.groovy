package com.gpxhub

import org.joda.time.format.ISODateTimeFormat
import org.joda.time.format.DateTimeFormatter
import org.joda.time.DateTime
import org.joda.time.Interval

/**
 * Created with IntelliJ IDEA.
 * User: calle
 * Date: 5/17/12
 * Time: 11:09 PM
 * To change this template use File | Settings | File Templates.
 */
class Gpx {

    def xml
    def name
    def time
    def points = []

    def formatter = ISODateTimeFormat.dateTimeNoMillis();

    public Gpx(def gpxFileContent) {
        this.xml = gpxFileContent

        def gpx = new XmlParser().parseText(this.xml)

        this.name = gpx.trk.name.text()

        def timeValue = gpx.trk.time.text()

        try {
            time = formatter.parseDateTime(timeValue)
        } catch(Exception e) {
            time = new DateTime()
        }


        gpx.trk.trkseg.trkpt.each {
            points << new Track(it)
        }
    }

    public double getTotalDistance() {

        double distance = 0.0;

        def lastPoint = null

        points.each { currentPoint ->

            if(lastPoint != null) {
                double pointsDistance = GeoUtils.distance(lastPoint.lat, lastPoint.lon, currentPoint.lat, currentPoint.lon, "K")
                distance += pointsDistance
            }

            lastPoint = currentPoint
        }

        return distance
    }

    public int getTotalDurationInSeconds() {
        DateTime start = points[0].time
        DateTime end   = points.last().time

        return new Interval(start, end).toDurationMillis() / 1000
    }

    public LatLng getTrackCenter() {
        return new LatLng(lat: points[0].lat, lon: points[0].lon)
    }

    class Track {
        def lat
        def lon
        def time
        public Track(def trkpt) {
            lat = Double.parseDouble(trkpt.'@lat')
            lon = Double.parseDouble(trkpt.'@lon')
            try {
                time = formatter.parseDateTime(trkpt.time.text())
            } catch(Exception e) {
                time = new DateTime()
            }

        }

    }



}
