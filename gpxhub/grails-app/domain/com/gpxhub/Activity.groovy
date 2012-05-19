package com.gpxhub

import org.joda.time.DateTime
import org.joda.time.Period

class Activity {

    String name
    String description
    Double distance
    Date when
    String gpx
    int duration

    def getDurationPeriod() {
        return new Period(duration * 1000)
    }

    static constraints = {
        name nullable: true
        distance(nullable:  true)
        description(nullable:  true)
        when(nullable:  true)
        gpx(nullable:  false)
    }

    static mapping = {
        gpx type: 'text'
    }

}
