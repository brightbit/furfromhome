$ ->

  $("#pet_listing_type").dropkick
    change: (label, value) ->
      label = label.substr(0,1).toUpperCase() + label.substr(1)
      $('label[for="pet_missing_since_found_at"]').text("#{label} on")

  $("#animal").bind "change", ->
    if $(this).val() != ''
      $(".pet_breed").show()
    else
      $(".pet_breed").hide()
      label = $(this).val().substr(0,1).toUpperCase() + $(this).val().substr(1)
      $(".pet_breed label").text("#{label} breed")

  $("#pet_collar").bind "change", ->
    if $(this).is(":checked")
      $(".pet_collar_description").show()
    else
      $(".pet_collar_description").hide()
      $("#pet_collar_description").text("")