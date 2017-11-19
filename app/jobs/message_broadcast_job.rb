class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "lobbies_#{message.response.id}_channel", message: 'MESSAGE_HTML'
  end
end
