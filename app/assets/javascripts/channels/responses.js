

App.responses = App.cable.subscriptions.create('ResponsesChannel', { 
	received: function(data) {
		$("#responses").removeClass('hidden')
		return $('#responses').append(this.renderResponse(data));
	},
	renderResponse: function(data) {
		return "<p> <b>" + data.user + ": </b>" + data.response + "</p>";
	}
});