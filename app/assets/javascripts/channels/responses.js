var counter = 0;
var buttonCounter = 0;
var correctGuesses = 0;
var wrongGuesses = 0;


$(document).ready(function() {
	$("#responses_container").hide();
	$("#scoreBox").hide();
	shuffleBoxes();
	//sendBotResponse();
});

App.responses = App.cable.subscriptions.create('ResponsesChannel', {
	received: function(data) {
		if (data.is_response == 1) {
			//Data from response send
			//$("#response_box_" + data.user).removeClass('hidden')
			//$("#responses_container").hide();
			//$("#response").hide(); // Hides the response box, but for all users in lobby
			//return $('#response_box_' + data.user).append(this.renderResponse(data));
			if (data.is_bot == "no") {
				counter = counter+1;
			}
			if (counter >= 4)
			{
				$("#responses_container").show();
			}
			if (data.is_bot == "no")
			{
				$('#response_box_' + counter + '_' + data.lobby_id).removeClass('hidden')
				return $('#response_box_' + counter + '_' + data.lobby_id).append(this.renderResponse(data));
			}
			else
			{
				//window.alert("magic");
				$('#response_box_bot_' + data.lobby_id).removeClass('hidden')
				return $('#response_box_bot_' + data.lobby_id).append(this.renderBotResponse(data));
			}
		}
		else {
			//Data from click button
			//data that is sent that is needed: username, boxclicked
			//have username displayed, have scores with username displayed
			buttonCounter = buttonCounter+1;
			if (buttonCounter >= 4)
			{
				$("#scoreBox").show();
			}
			if (data.correct_guess == 1) {
				correctGuesses = correctGuesses + 1;
			}
			else {
				wrongGuesses = wrongGuesses + 1;
			}
			$('#tableScore').removeClass('hidden')
			$('#tableScore').append(this.renderScore(data));
			correctGuesses = 0;
			wrongGuesses = 0;
			return;

		}
	},
	renderResponse: function(data) {
		// return "<p> <b>" + data.user + ": </b>" + data.response + "</p>";
		return "<p> <b>" + "Response " + counter + ": </b>" + data.response + "</p>";
	},
	renderBotResponse: function(data) {
		return "<p> <b>" + "Bot Response " + counter + ": </b>" + data.response + "</p>";
	},
	renderScore: function(data) {
		return "<tr> <td>" + data.user + "</td> <td>" + correctGuesses + "</td> <td>" + wrongGuesses + "</td> </tr>";
	}
});
