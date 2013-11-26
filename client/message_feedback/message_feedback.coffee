Template.message_feedback.message = ->
	getSelectedMessage()

Template.show_message.content = ->
	getSelectedMessage().content

window.getSelectedMessage = ->
	Messages.findOne(Session.get("selected_message"))

Template.show_message.date = ->
	current_message = getSelectedMessage().date

	dd = current_message.getDate()
	mm = current_message.getMonth() + 1
	yyyy = current_message.getFullYear()

	if ( dd < 10 )
		dd = '0' + dd 
	if ( mm < 10 )
		mm = '0' + mm

	current_message = dd + '/' + mm + '/' + yyyy;

feelings = [ "happy", "medium_happy", "indiferent", "medium_sad", "sad" ]

Template.show_message.feelings = ->
	message = getSelectedMessage()
	total = feelings.reduce (count, feeling) ->
		count + message[feeling]
	, 0

	feelings.map (feeling) ->
		{ label: feeling, percentage: message[feeling] / total * 100 }