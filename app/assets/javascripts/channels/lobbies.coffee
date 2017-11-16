App.global_chat = App.cable.subscriptions.create {
    channel: "LobbiesChannel"
    lobby_id: ''
  },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Data received

  send_response: (respon, lobby_id) ->
    @perform 'send_response', response: response, lobby_id: lobby_id
