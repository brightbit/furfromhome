#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap
#= require_tree .
#= require jquery.imagesloaded.min
#= require packery.pkgd.min
#= require chosen-jquery
#= require dropkick

##
# App

$ ->

  $(".list-cards").imagesLoaded ->
    $(".list-cards").packery()

  # enable chosen js
  $('.chosen').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'

  $('select:not(.chosen)').dropkick()


##
# When Turbolinks page finishes loading (similar to document ready)
$(window).bind 'page:load', ->

  if( $("[type='filepicker']").length > 0 )
    filepicker.constructWidget( $("[type='filepicker']") )

  $(".list-cards").imagesLoaded ->
    $(".list-cards").packery()

  # enable chosen js
  $('.chosen').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'

  $('select:not(.chosen)').dropkick()