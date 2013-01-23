# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.onload = ->
  errors = 0; card1 = null 
  total = document.querySelectorAll('.card').length

  displayAsInvalid = (el) ->
    $(el).addClass 'wrong'
    $('.selected').removeClass 'selected'
    card1 = null;

  recordAsMatch = ->
    total = total - 2
    if total == 0
      $('.you_won').show() 
      $('.errors').html(errors)

  checkIfMatch = (el) ->
    if $(el).data('pairing') == $(card1).data('pairing')
      $('.selected').addClass 'completed'
      recordAsMatch()
    else
      console.log "error! " + errors
      $('.selected').addClass 'wrong'
      errors++
      
    card1 = null;
    $('.selected').removeClass('selected')  

  processClick = ->
    $('.wrong').removeClass 'wrong'
    if $(this).hasClass('selected') or $(this).hasClass 'completed'
      displayAsInvalid(this)
    else
      $(this).addClass('selected')
      if card1
        checkIfMatch(this)
      else
        card1 = $(this)

  $('.card').click(processClick)