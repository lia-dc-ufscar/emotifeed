class window.AppRouter extends Backbone.Router
	routes:
		"new_message": "newMessage"
		"vote": "vote"
		"feedback": "feedback"
		"home": "home"
		"message_feedback": "messageFeedback"
		"message_feedback/:id": "parameterizedMessageFeedback"

	newMessage: ->
		Session.set "current_page", "new_message"

	vote: ->
		Session.set "current_page", "vote"

	feedback: ->
		Session.set "current_page", "feedback"

	home: ->
		Session.set "current_page", "home"

	messageFeedback: ->
		Session.set "current_page", "message_feedback"

	parameterizedMessageFeedback: (id) ->
		Session.set "selected_message", id
		Session.set "current_page", "message_feedback"
