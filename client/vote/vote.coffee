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
		if Session.get("selected") is "none"
			Session.set "selected", id
			$(e.target)[0].style.background = "gray"
		else
			if Session.get("selected") is id
				$(e.target)[0].style.background = "transparent"
				Session.set "selected", "none"
			else
				last = Session.get("selected")
				$("##{last}")[0].style.background = "transparent"
				$(e.target)[0].style.background = "gray"
				Session.set "selected", id