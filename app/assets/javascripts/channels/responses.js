App.responses = App.cable.subscriptions.create('ResponsesChannel', {
	received: function(data) {
		$("#response").removeClass('hidden')
		return $('#response').append(this.renderResponse(data));
	},
	renderResponse: function(data) {
		return "<p> <b>" + data.user + ": </b>" + data.response + "</p>";
	}
});
