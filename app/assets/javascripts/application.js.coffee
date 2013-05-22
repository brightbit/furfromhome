#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap
#= require_tree .
#= require jquery.imagesloaded.min
#= require packery.pkgd.min

##
# App

$ ->

  $(".list-cards").imagesLoaded ->
    $(".list-cards").packery()


##
# When Turbolinks page finishes loading (similar to document ready)
$(window).bind 'page:load', ->

  if( $("[type='filepicker']").length > 0 )
    filepicker.constructWidget( $("[type='filepicker']") )

  $(".list-cards").imagesLoaded ->
    $(".list-cards").packery()