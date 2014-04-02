Session.set "selected_message", "none"

Template.feedback.messages = ->
	getAllMessages()

window.getAllMessages = ->
	Messages.find({}, {sort: {date: -1}})

Template.message.formattedDate = ->
	dd = this.date.getDate()
	mm = this.date.getMonth() + 1
	yyyy = this.date.getFullYear()

	if ( dd < 10 )
		dd = '0' + dd 
	if ( mm < 10 )
		mm = '0' + mm

	formattedDate = dd + '/' + mm + '/' + yyyy;

Template.feedback.events =
	"click a": (e) ->
		selected_message = $(e.target).attr "id"
