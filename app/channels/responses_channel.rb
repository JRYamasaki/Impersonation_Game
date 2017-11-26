
class ResponsesChannel < ApplicationCable::ResponsesChannel


	def subscribed
		stream_from 'responses'
	end


end