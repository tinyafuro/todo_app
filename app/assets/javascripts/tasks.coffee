# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $('#check').click ->
    if $(this).prop('checked') == true
      $('#content').attr 'disabled', 'disabled'
    else
      $('#content').removeAttr 'disabled'
    return
  return