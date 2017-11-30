App.responses = App.cable.subscriptions.create('ResponsesChannel', {
	received: function(data) {
		//$("#response_box_" + data.user).removeClass('hidden')
		//$("#response").hide(); // Hides the response box, but for all users in lobby
		//return $('#response_box_' + data.user).append(this.renderResponse(data));

		$("#response_box").removeClass('hidden')
		return $('#response_box').append(this.renderResponse(data));
	},
	renderResponse: function(data) {
		return "<p> <b>" + data.user + ": </b>" + data.response + "</p>";
	}
});
