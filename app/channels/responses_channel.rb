class ResponsesChannel < ApplicationCable::Channel


	def subscribed
		stream_from "responses"
	end


end
