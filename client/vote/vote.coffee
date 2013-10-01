Template.vote.message = ->
	getLastMessage()

window.getLastMessage = ->
	Messages.findOne({}, {sort: {date: -1}})

Session.set "selected", "none"

Template.vote.events = 
	"click button": ->
		answer = {}
		id = getLastMessage()._id
		selected = Session.get "selected"
		answer[selected] = 1
		Messages.update(id, {$inc: answer})

	"click #feelings img": (e) ->
		id = $(e.target).attr("id")
		Session.set "selected", id