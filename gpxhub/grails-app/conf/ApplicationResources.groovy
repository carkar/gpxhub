modules = {
    core {
        dependsOn("jquery")
        resource url:'js/application.js'
        resource url:'js/bootstrap.min.js'
    }

    'file-upload' {
        resource url:'/js/vendor/jquery.ui.widget.js'
        resource url:'/js/templ.js'
        resource url:'/js/load-image.min.js'
        resource url:'/js/canvas-to-blob.js'
        resource url:'/js/jquery.iframe-transport.js'
        resource url:'/js/jquery.fileupload.js'
        resource url:'/js/jquery.fileupload-fp.js'
        resource url:'/js/jquery.fileupload-ui.js'
        resource url:'/js/cors/jquery.postmessage-transport.js'
        resource url:'/js/main.js'
        resource url:'/js/locale.js'
        //resource url:'/js/cors/jquery.xdr-transport.js'
        resource url:'/css/jquery.fileupload-ui.css'
        resource url:'/css/style.css'
    }
}