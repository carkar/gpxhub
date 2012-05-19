package com.gpxhub

import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
import grails.converters.JSON

class UploadController {

    def index() { }

    def upload() {

        def result = []

        if (request instanceof MultipartHttpServletRequest) {
            MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
            CommonsMultipartFile file = (CommonsMultipartFile) mpr.getFile("files[]");



            if(!file.empty) {
                log.info("Uploaded: ${file.originalFilename}")

                File tempDir = new File(System.getProperty("java.io.tmpdir"))
                File uploadedFile = new File(tempDir,String.valueOf(System.currentTimeMillis()))
                file.transferTo(uploadedFile)

                // parse
                Gpx gpx = new Gpx(uploadedFile.text)

                log.info(gpx.name)
                log.info("Track points count: ${gpx.points.size()}")
                log.info("Total distannce: ${gpx.getTotalDistance()}")
                log.info("Time: ${gpx.time}")

                double km = (Math.round(gpx.getTotalDistance()*100.0)/100.0)

                def activity = new Activity(name: gpx.name,
                        description: "Desc",
                        distance: km,
                        gpx: gpx.xml,
                        duration: gpx.getTotalDurationInSeconds(),
                        when: gpx.time.toDate()
                ).save(failOnError: true)

                def link = g.createLink(controller: "tracks", action: "view", id: activity.id)

                render(contentType: "text/json") {
                    element (
                            name:gpx.name,
                            size:file.size,
                            url:link,
                            thumbnail_url:"",
                            delete_url:"/example.org/upload-handler?file=picture1.jpg",
                            delete_type:"DELETE"
                    )
                }
            }
            else {
                log.info("Empty file.")
                render result as JSON
            }



        }


        render result as JSON
        }


        def test() {










        }
    }
