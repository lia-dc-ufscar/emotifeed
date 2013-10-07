Template.vote.message = ->
	getLastMessage()

window.getLastMessage = ->
	Messages.findOne({}, {sort: {date: -1}})

Session.set "selected", "none"

Template.vote.events = 
	"click #feelings img": (e) ->
		answer = {}
		id = getLastMessage()._id
		selected = $(e.target).attr("id")
		answer[selected] = 1
		Messages.update(id, {$inc: answer})