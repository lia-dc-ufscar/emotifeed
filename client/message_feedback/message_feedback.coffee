Template.message_feedback.message = ->
	getSelectedMessage()

window.getSelectedMessage = ->
	Messages.findOne(Session.get("selected_message"))

feelings = [ "happy", "medium_happy", "indiferent", "medium_sad", "sad" ]

Template.show_message.feelings = ->
	message = getSelectedMessage()
	total = feelings.reduce (count, feeling) ->
		count + message[feeling]
	, 0

	feelings.map (feeling) ->
		{ label: feeling, percentage: message[feeling] / total * 100 }