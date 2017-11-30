var counter = 0;

App.responses = App.cable.subscriptions.create('ResponsesChannel', {
	received: function(data) {
		//$("#response_box_" + data.user).removeClass('hidden')
		//$("#response").hide(); // Hides the response box, but for all users in lobby
		//return $('#response_box_' + data.user).append(this.renderResponse(data));
		counter = counter+1;
		$("#response_box_" + counter).removeClass('hidden')
		return $('#response_box_' + counter).append(this.renderResponse(data));
	},
	renderResponse: function(data) {
		return "<p> <b>" + data.user + ": </b>" + data.response + "</p>";
	}
});
