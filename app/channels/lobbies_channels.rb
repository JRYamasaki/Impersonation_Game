class LobbyChannel < ApplicationCable::Channel
  def subscribed
    stream_from "lobbies_#{params['lobby_id']}_channel"
  end

  def unsubscribed
    #Stuff to do when one unsubscribes from a channel
  end

  def send_response(data)
    #Will take in the response and possibly store into a database for further processing

    #Message implementation defined here
    current_user.messages.create!(body: data['message'], lobby_id: data['lobby_id'])
  end
end
