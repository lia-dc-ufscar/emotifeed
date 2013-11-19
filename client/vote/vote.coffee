Template.vote.message = ->
	getLastMessage()

window.getLastMessage = ->
	Messages.findOne({}, {sort: {date: -1}})

Session.set "selected", "none"

Template.vote.events = 
	"mousedown #feelings img": (e) ->
		answer = {}
		id = getLastMessage()._id
		selected = $(e.target).attr("id")
		answer[selected] = 1
		Messages.update(id, {$inc: answer})

		///insert client information in database///
		today = new Date
		dd = today.getDate()
		mm = today.getMonth() + 1
		yyyy = today.getFullYear()
		hours = today.getHours()
		minutes = today.getMinutes()
		seconds = today.getSeconds()

		if ( dd < 10 )
			dd = '0' + dd 
		if ( mm < 10 )
			mm = '0' + mm
		if ( hours < 10 )
			hours = '0' + hours
		if ( minutes < 10 )
			minutes = '0' + minutes
		if ( seconds < 10 )
			seconds = '0' + seconds

		today = dd + '/' + mm + '/' + yyyy + " " + hours + ":" + minutes + ":" + seconds;

		History.insert { ip: "ip", choice: selected, timestamp: today }

		console.log $(e.target)