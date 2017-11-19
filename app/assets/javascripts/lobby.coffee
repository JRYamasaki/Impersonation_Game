# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

App.global_chat = App.cable.subscriptions.create {
    channel: "SomeLobby"
    lobby_id: messages.data('lobby-id')
  },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    messages.append data['message']

  send_message: (message, lobby_id) ->
    @perform 'send_message', message: message, lobby_id: lobby_id
