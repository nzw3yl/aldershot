# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  handle_click = (event) ->
    window.location.href = "/team"
    event.stopPropagation()

  $(".logimage").on "click", handle_click
  $(".action-bar-log-panel .inline-list .log-link").on "click", handle_click