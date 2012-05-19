package com.gpxhub

import org.joda.time.format.PeriodFormatterBuilder
import org.joda.time.format.PeriodFormatter

class PeriodFormatTagLib {
    static namespace = "gpx"

    def grailsApplication

    def duration = {attrs ->
        if (attrs.value) {
            PeriodFormatter daysHoursMinutes = new PeriodFormatterBuilder()
                    .printZeroAlways()
                    .minimumPrintedDigits(2)
                    .appendHours()
                    .appendSeparator(":")
                    .minimumPrintedDigits(2)
                    .appendMinutes()
                    .appendSeparator(":")
                    .minimumPrintedDigits(2)
                    .appendSeconds()
                    .toFormatter();

            out << daysHoursMinutes.print(attrs.value)
        }

    }
}
