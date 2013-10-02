Template.vote.message = ->
	getLastMessage()

window.getLastMessage = ->
	Messages.findOne({}, {sort: {date: -1}})