# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class SettingsController
  constructor: ->
    @setEvents()

  setEvents: ->
    $(document).on 'click', 'img#settings', @toggle_settings

  toggle_settings: ->
    $("#settingsPanel").panel("open")

$ ->
  new SettingsController()
