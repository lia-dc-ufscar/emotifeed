Session.set "selected_message", "none"

Template.feedback.messages = ->
	getAllMessages()

window.getAllMessages = ->
	Messages.find({}, {sort: {date: -1}})

Template.feedback.events =
	"click a": (e) ->
		selected_message = $(e.target).attr "id"
		console.log selected_message