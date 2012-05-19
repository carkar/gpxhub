package com.gpxhub

class TracksController {

    def index() {
        params.max = Math.min(params.max ? params.int('max') : 50, 100)
        [activities: Activity.list(params), activitiesCount: Activity.count()]
    }

    def view(Long id) {
        def activity = Activity.read(id)

        [activity: activity, gpx: new Gpx(activity.gpx)]
    }

    def delete(Long id) {
        Activity.get(id).delete()
        flash.message = "Activity removed"
        redirect(action: "index")
    }
}
