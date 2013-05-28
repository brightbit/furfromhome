$ ->

  body       = $(document.body)
  viewport   = $('#viewport')
  menu       = $('#menu')
  page       = $('#page')
  closeMask  = $('#close-mask')
  trigger    = $('.trigger')



  # Trigger opens the menu
  trigger.bind 'click', ->
    if body.hasClass('menu-open')
      closeMenu()
    else
      openMenu()



  # closeMask closes the menu
  closeMask.bind 'click', (event) ->
    event.preventDefault()
    closeMenu()

  closeMask.bind 'touchmove', (event) ->
    event.preventDefault()
    closeMenu()

  openMenu = ->
    menuOpening = true
    body.addClass("menu-open")
    menu.css('height', window.innerHeight + "px")
    closeMask.fadeIn(100)


  closeMenu = ->
    menuClosing = true
    body.removeClass("menu-open")
    closeMask.fadeOut(100)