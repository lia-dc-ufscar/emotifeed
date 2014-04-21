class window.AppRouter extends Backbone.Router
	routes:
		"new_message": "newMessage"
		"vote": "vote"
		"qrcodevote": "qrcodevote"
		"feedback": "feedback"
		"home": "home"
		"message_feedback": "messageFeedback"
		"message_feedback/:id": "parameterizedMessageFeedback"
		"screen": "screen"
		"": "index"

	newMessage: ->
		Session.set "current_page", "new_message"

	vote: ->
		Session.set "current_page", "vote"

	qrcodevote: ->
		Session.set "current_page", "qrcodevote"

	feedback: ->
		Session.set "current_page", "feedback"

	home: ->
		Session.set "current_page", "home"

	messageFeedback: ->
		Session.set "current_page", "message_feedback"

	parameterizedMessageFeedback: (id) ->
		Session.set "selected_message", id
		Session.set "current_page", "message_feedback"

	screen: ->
		Session.set "current_page", "screen"

	index: ->
		Session.set "current_page", "index"