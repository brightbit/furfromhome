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



  # Animation
  if "ontouchend" of window
    startX = undefined
    startY = undefined
    moveX = undefined
    moveY = undefined
    matrix = undefined
    m41 = 0
    shouldOpenMenu = false
    shouldCloseMenu = false
    menuOpen = false
    menuOpening = false
    menuClosing = false
    page.addEventListener "touchstart", (event) ->
      startX = event.touches[0].pageX
      startY = event.touches[0].pageY
      shouldOpenMenu = false
      shouldCloseMenu = false
      matrix = new WebKitCSSMatrix(page.style.webkitTransform)
      m41 = matrix["m41"]

    page.addEventListener "touchmove", (event) ->
      moveX = event.changedTouches[0].pageX
      moveY = event.changedTouches[0].pageY
      distanceX = moveX - startX
      distanceY = moveY - startY
      movedLeft = distanceX < 0
      movedRight = distanceX > 5
      movedVert = Math.abs(distanceY) > 15
      unless movedVert
        if not menuOpen and movedRight or menuOpen and movedLeft
          event.preventDefault()
          addClass body, "menu-moving"
          page.style.webkitTransform = "translate3d(" + (distanceX + m41) + "px, 0 , 0)"
        if not menuOpen and movedRight
          shouldOpenMenu = (Math.abs(distanceX) > (body.clientWidth / 2.5))
          shouldCloseMenu = not shouldOpenMenu
        if menuOpen and movedLeft
          shouldCloseMenu = (Math.abs(distanceX) > (body.clientWidth / 4))
          shouldOpenMenu = not shouldCloseMenu

    page.addEventListener "touchend", (event) ->
      openMenu()  if shouldOpenMenu
      closeMenu()  if shouldCloseMenu


  openMenu = ->
    menuOpening = true
    body.addClass("menu-open")
    menu.css('height', window.innerHeight + "px")


  closeMenu = ->
    menuClosing = true
    body.removeClass("menu-open")