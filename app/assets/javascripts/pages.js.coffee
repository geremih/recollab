# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



ready = ->
        $('#comments').slimScroll  height: "300px"
        console.log "Scroll set"


ready()
$(ready)
$(document).on "page:change", ready
