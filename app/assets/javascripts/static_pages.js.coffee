# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready ->
        $(".tab").click ->
                 X = $(this).attr('id');
                if (X=='signup-tab')
                        $("#login-tab").removeClass('select-tab')
                        $("#signup-tab").addClass('select-tab')
                        $("#loginbox").slideUp()
                        $("#signupbox").slideDown()
                else
                        $("#signup").removeClass('select-tab')
                        $("#login").addClass('select-tab')
                        $("#signupbox").slideUp()
                        $("#loginbox").slideDown()

$(document).ready(ready)
$(document).on('page:load', ready)
