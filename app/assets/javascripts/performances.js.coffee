# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  updateTips = () ->
    performer_id = $("#performer").attr("data-id")
    performance_id = $("#performance").attr("data-id")
    after = $("#tip_total").attr("data-time")
    $.getScript("/performers/" + performer_id + "/performances/pay.js?performance_id=" + performance_id + "&after=" + after)
    setTimeout(updateTips, 1000)

  setLocation = (position) ->
    latitude = position.coords.latitude
    longitude = position.coords.longitude
    $("#performance_performed_latitude").val(latitude)
    $("#performance_performed_longitude").val(longitude)

  getLocation = () ->
    navigator.geolocation.getCurrentPosition(setLocation) if navigator.geolocation


  getLocation() if $("#performance_performed_latitude").length > 0
  setTimeout(updateTips, 1000) if $("#tip_total").length > 0

