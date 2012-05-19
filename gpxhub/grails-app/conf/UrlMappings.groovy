class UrlMappings {

	static mappings = {

		"/"(controller: "home", view: "index")
		"500"(view:'/error')

        "/tracks/view/${id}"(controller: "tracks", action: "view") {
            constraints {
                // apply constraints here
            }
        }

        "/tracks/delete/${id}"(controller: "tracks", action: "delete") { }

        "/tracks/upload"(controller: "upload") {
            constraints {
                // apply constraints here
            }
        }

        "/tracks/upload/do"(controller: "upload", action: "upload") {
            constraints {
                // apply constraints here
            }
        }

        "/tracks/upload/test"(controller: "upload", action: "test") {
            constraints {
                // apply constraints here
            }
        }




        "/tracks"(controller: "tracks", action: "index") {
            constraints {
                // apply constraints here
            }
        }

    }
}
