class window.AppRouter extends Backbone.Router
	routes:
		"new_message": "newMessage"
		"vote": "vote"
		"feedback": "feedback"
		"home": "home"

	newMessage: ->
		Session.set "current_page", "new_message"

	vote: ->
		Session.set "current_page", "vote"

	feedback: ->
		Session.set "current_page", "feedback"

	home: ->
		Session.set "current_page", "home"