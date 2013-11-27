pages = [
	"new_message"
	"vote"
	"feedback"
	"home"
	"message_feedback"
	"screen"
	"index"
]

window.Helpers = {}

Handlebars.registerHelper "is_logged", ->
	"true" == Session.get "logged"

Handlebars.registerHelper "is_logged_needed", ->
	return true if "new_message" is Session.get "current_page"
	return true if "feedback" is Session.get "current_page"
	return true if "home" is Session.get "current_page"
	return true if "message_feedback" is Session.get "current_page"
	false

Helpers.registerCurrentPageHelper = (page) ->
	Handlebars.registerHelper "is_#{page}", ->
		page == Session.get "current_page"

Helpers.registerCurrentPageHelper page for page in pages